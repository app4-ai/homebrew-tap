#!/usr/bin/env python3
"""Keep process documents (specs, plans, reviews, runbooks and the like) out of git once they live elsewhere.

    docguard.py --mode pre|post [--repo DIR] --commit-msg FILE | --range OLD..NEW | --tree REV
    docguard.py [--repo DIR] --list-unmerged [BASE]

A PROCESS PATH is a tracked file with a document extension that has a process folder (specs, plans, research,
reviews, reports, findings, audits, handoffs, runbooks, prompts, superpowers, brainstorms) anywhere in its path, or
that sits under the top-level docs/ folder. Never a process path: CLAUDE.md, AGENTS.md, README*, CHANGELOG*,
LICENSE*, CONTRIBUTING*, SECURITY* in any folder; anything under vendor/, node_modules/, testdata/, third_party/,
.github/, .gitlab/, .docguard/; and every glob of .docguard/retained.txt (`glob  # reason`; files read by code, a
build, a test, CI or the site).

--mode pre  (from the freeze to the removal commit): a process path may only be a line of .docguard/baseline.tsv
            with its frozen blob; a commit may delete one only when its message carries the trailer
            `Docs-Moved-To-Studio: 698`; .docguard/baseline.tsv and .docguard/retained.txt change only in that commit.
            .docguard/mode changes only in a commit with that trailer, in either mode.
--mode post (after the removal commit): no process path may exist or be added.
--commit-msg checks the index with the message (the commit-msg hook); --range checks every commit of OLD..NEW (CI),
a merge commit by what it changes against every parent; --tree checks the whole tree of REV. --list-unmerged prints
`<branch>\t<path>` for process documents that remote branches not merged into BASE (default origin/main) add.
Python 3.9+, standard library only.
This file is copied unchanged into each repository as scripts/docguard.py. Exit 0 clean, 1 refused, 2 usage error.
"""
import argparse
import fnmatch
import os
import subprocess
import sys

PROCESS_DIRS = frozenset({"specs", "plans", "research", "reviews", "reports", "findings", "audits", "handoffs",
                          "runbooks", "prompts", "superpowers", "brainstorms"})
DOC_EXTS = frozenset({".md", ".markdown", ".mdx", ".html", ".htm", ".txt", ".pdf", ".yaml", ".yml", ".json",
                      ".csv", ".tsv"})
ALWAYS_KEPT = ("CLAUDE.md", "AGENTS.md", "README*", "CHANGELOG*", "LICENSE*", "CONTRIBUTING*", "SECURITY*")
SKIP_DIRS = frozenset({"vendor", "node_modules", "testdata", "third_party", ".github", ".gitlab", ".docguard"})
TRAILER, TRAILER_VALUE = "Docs-Moved-To-Studio", "698"
MODE, BASELINE, RETAINED = ".docguard/mode", ".docguard/baseline.tsv", ".docguard/retained.txt"
GUARD_FILES = (BASELINE, RETAINED)
ZERO = "0" * 40


class Fail(Exception):
    """A usage or git error: exit 2."""


def git(repo, *args, stdin=None):
    try:
        p = subprocess.run(["git", "-C", repo, *args], input=stdin, capture_output=True)
    except OSError as e:
        raise Fail("cannot run git: %s" % e)
    if p.returncode != 0:
        raise Fail("git %s failed: %s" % (" ".join(args[:2]), p.stderr.decode("utf-8", "replace").strip()))
    return p.stdout


def show(repo, spec):
    """The text of `spec` (REV:path, or :path for the index), or None when it does not exist."""
    p = subprocess.run(["git", "-C", repo, "show", spec], capture_output=True)
    return p.stdout.decode("utf-8", "replace") if p.returncode == 0 else None


def read_retained(text):
    globs = []
    for n, line in enumerate((text or "").splitlines(), 1):
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        glob, hash_, reason = line.partition("#")
        if not hash_ or not reason.strip() or not glob.strip():
            raise Fail("%s line %d: an exception is `glob  # reason`; the reason is required" % (RETAINED, n))
        globs.append(glob.strip())
    return globs


def read_baseline(text):
    base = {}
    for n, line in enumerate((text or "").splitlines(), 1):
        if not line.strip() or line.startswith("#"):
            continue
        sha, tab, path = line.partition("\t")
        if not tab or len(sha) != 40:
            raise Fail("%s line %d: a baseline line is `<blob sha>\\t<path>`" % (BASELINE, n))
        base[path] = sha
    return base


class Config:
    """The guard's files as one revision (prefix 'REV:') or the index (prefix ':') holds them."""

    def __init__(self, repo, prefix):
        self.retained = read_retained(show(repo, prefix + RETAINED))
        self.baseline = read_baseline(show(repo, prefix + BASELINE))


def is_process(path, retained):
    parts = path.split("/")
    name = parts[-1]
    if any(p in SKIP_DIRS for p in parts[:-1]):
        return False
    if any(fnmatch.fnmatchcase(name, g) for g in ALWAYS_KEPT):
        return False
    if any(fnmatch.fnmatchcase(path, g) for g in retained):
        return False
    if os.path.splitext(name)[1].lower() not in DOC_EXTS:
        return False
    return (parts[0] == "docs" and len(parts) > 1) or any(p in PROCESS_DIRS for p in parts[:-1])


def judge_tree(repo, rev, mode, cfg):
    bad = []
    for rec in git(repo, "ls-tree", "-r", "-z", "--full-tree", rev).split(b"\0"):
        if not rec:
            continue
        meta, _, raw = rec.partition(b"\t")
        _, kind, sha = meta.decode().split()[:3]
        path = raw.decode("utf-8", "replace")
        if kind != "blob" or not is_process(path, cfg.retained):
            continue
        if mode == "post":
            bad.append((path, "still in the tree; it lives in app4.studio now"))
        elif cfg.baseline.get(path) != sha:
            bad.append((path, "not the frozen baseline copy" if path in cfg.baseline else "not in the frozen baseline"))
    return bad


def parse_raw(out):
    """`git diff/diff-tree --raw -z --no-renames` records → [(status letter, path)]; submodules skipped."""
    parts = out.split(b"\0")
    found = []
    for i in range(0, len(parts) - 1, 2):
        meta = parts[i].decode().lstrip(":").split()
        if len(meta) < 5 or "160000" in meta[:2]:
            continue
        found.append((meta[4][0], parts[i + 1].decode("utf-8", "replace")))
    return found


def has_trailer(repo, message):
    out = git(repo, "interpret-trailers", "--parse", stdin=message.encode("utf-8")).decode("utf-8", "replace")
    for line in out.splitlines():
        key, _, value = line.partition(":")
        if key.strip() == TRAILER and value.strip() == TRAILER_VALUE:
            return True
    return False


def judge(changes, mode, cfg, trailer):
    bad = []
    for status, path in changes:
        if path == MODE:  # flipping the mode would switch the pre-mode checks off: removal commit only, in any mode
            if status != "A" and not trailer:
                bad.append((path, "changed outside the removal commit (trailer `%s: %s`)" % (TRAILER, TRAILER_VALUE)))
            continue
        if path in GUARD_FILES:
            if mode == "pre" and status != "A" and not trailer:
                bad.append((path, "changed outside the removal commit (trailer `%s: %s`)" % (TRAILER, TRAILER_VALUE)))
            continue
        if not is_process(path, cfg.retained):
            continue
        if status == "D":
            if mode == "pre" and not trailer:
                bad.append((path, "deleted without the trailer `%s: %s` (only the removal commit deletes "
                                  "process documents)" % (TRAILER, TRAILER_VALUE)))
        elif mode == "post":
            bad.append((path, "process documents live in app4.studio now; upload it with studioDocUpload"))
        elif status == "A" or path not in cfg.baseline:
            bad.append((path, "added after the freeze; upload it to app4.studio instead"))
        else:
            bad.append((path, "modified after the freeze; the frozen copy is the one app4.studio imports"))
    return bad


def check_commit_msg(repo, mode, msg_file):
    with open(msg_file, encoding="utf-8") as f:
        message = f.read()
    changes = parse_raw(git(repo, "diff", "--cached", "--raw", "-z", "--no-renames", "--no-abbrev"))
    return judge(changes, mode, Config(repo, ":"), has_trailer(repo, message))


def check_range(repo, spec, mode):
    if ".." not in spec:
        raise Fail("--range wants OLD..NEW, got %r" % spec)
    old, new = spec.split("..", 1)
    new = new or "HEAD"
    git(repo, "rev-parse", "--verify", new + "^{commit}")
    if old in ("", ZERO):
        return []
    cfg = Config(repo, new + ":")
    bad = []
    for c in git(repo, "rev-list", "--no-merges", old + ".." + new).decode().split():
        message = git(repo, "log", "-1", "--format=%B", c).decode("utf-8", "replace")
        changes = parse_raw(git(repo, "diff-tree", "-r", "-z", "--root", "--no-commit-id", "--raw", "--no-renames",
                                "--no-abbrev", c))
        bad += [(p, "%s (commit %s)" % (why, c[:9])) for p, why in judge(changes, mode, cfg, has_trailer(repo, message))]
    for c in git(repo, "rev-list", "--merges", old + ".." + new).decode().split():
        message = git(repo, "log", "-1", "--format=%B", c).decode("utf-8", "replace")
        changes = merge_changes(repo, c)
        bad += [(p, "%s (merge %s)" % (why, c[:9])) for p, why in judge(changes, mode, cfg, has_trailer(repo, message))]
    return bad


def merge_changes(repo, c):
    """What a merge commit itself changes: the paths that differ from EVERY parent (its combined diff)."""
    names = git(repo, "diff-tree", "-r", "-z", "--cc", "--name-only", "--no-commit-id", c).decode("utf-8", "replace")
    found = []
    for path in sorted({n for n in names.split("\0") if n}):
        if show(repo, "%s:%s" % (c, path)) is None:
            found.append(("D", path))
        else:
            found.append(("M" if show(repo, "%s^1:%s" % (c, path)) is not None else "A", path))
    return found


def unmerged(repo, base):
    cfg = Config(repo, base + ":")
    found = []
    for ref in git(repo, "for-each-ref", "--format=%(refname)", "refs/remotes/origin").decode().split():
        short = ref[len("refs/remotes/"):]
        if short == base or ref.endswith("/HEAD"):
            continue
        if subprocess.run(["git", "-C", repo, "merge-base", "--is-ancestor", ref, base]).returncode == 0:
            continue
        names = git(repo, "diff", "--name-only", "-z", "--diff-filter=AM", base + "..." + ref).decode("utf-8", "replace")
        found += [(short, n) for n in names.split("\0") if n and is_process(n, cfg.retained)]
    return found


def report(mode, bad):
    print("docguard (%s mode): process documents live in app4.studio, not in git:" % mode,
          file=sys.stderr)
    for path, why in bad:
        print("  %s  %s" % (path, why), file=sys.stderr)
    print("Fix: `git rm --cached <path>` (or restore the frozen copy) and write the document with studioDocUpload or "
          "`app4 studio docs`. A file read by code, a build, a test, CI or the portal goes in %s as "
          "`glob  # reason`." % RETAINED, file=sys.stderr)


def main(argv):
    ap = argparse.ArgumentParser(description="Keep process documents out of git; they live in app4.studio.")
    ap.add_argument("--repo", default=".")
    ap.add_argument("--mode", choices=("pre", "post"))
    what = ap.add_mutually_exclusive_group(required=True)
    what.add_argument("--commit-msg", metavar="FILE")
    what.add_argument("--range", metavar="OLD..NEW")
    what.add_argument("--tree", metavar="REV")
    what.add_argument("--list-unmerged", metavar="BASE", nargs="?", const="origin/main")
    a = ap.parse_args(argv)
    try:
        if a.list_unmerged:
            for ref, path in unmerged(a.repo, a.list_unmerged):
                print("%s\t%s" % (ref, path))
            return 0
        if a.mode is None:
            raise Fail("--mode pre|post is required (the hook and CI read it from %s)" % MODE)
        if a.commit_msg:
            bad = check_commit_msg(a.repo, a.mode, a.commit_msg)
        elif a.range:
            bad = check_range(a.repo, a.range, a.mode)
        else:
            git(a.repo, "rev-parse", "--verify", a.tree + "^{tree}")
            bad = judge_tree(a.repo, a.tree, a.mode, Config(a.repo, a.tree + ":"))
    except Fail as e:
        print("docguard: %s" % e, file=sys.stderr)
        return 2
    if bad:
        report(a.mode, bad)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
