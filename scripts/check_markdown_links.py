#!/usr/bin/env python3
"""Check local Markdown links resolve to files or directories inside the repo."""

from __future__ import annotations

import re
import sys
from pathlib import Path
from urllib.parse import unquote


REPO_ROOT = Path(__file__).resolve().parent.parent
LINK_PATTERN = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")
SKIP_PREFIXES = ("http://", "https://", "mailto:", "tel:")


def normalize_target(raw_target: str) -> str:
    target = raw_target.strip()

    if target.startswith("<") and target.endswith(">"):
        target = target[1:-1]

    if " " in target and not target.startswith(("http://", "https://")):
        target = target.split(" ", 1)[0]

    return target


def link_exists(source_file: Path, target: str) -> bool:
    if target.startswith(SKIP_PREFIXES) or target.startswith("#"):
        return True

    clean_target = unquote(target.split("#", 1)[0])
    if not clean_target:
        return True

    candidate = (source_file.parent / clean_target).resolve()

    try:
        candidate.relative_to(REPO_ROOT)
    except ValueError:
        return False

    return candidate.exists()


def main() -> int:
    errors: list[str] = []

    for markdown_file in sorted(REPO_ROOT.rglob("*.md")):
        if ".git" in markdown_file.parts:
            continue

        for line_number, line in enumerate(markdown_file.read_text().splitlines(), start=1):
            for match in LINK_PATTERN.finditer(line):
                target = normalize_target(match.group(1))
                if link_exists(markdown_file, target):
                    continue

                source = markdown_file.relative_to(REPO_ROOT)
                errors.append(f"{source}:{line_number} -> missing target: {target}")

    if errors:
        print("Markdown link check failed:", file=sys.stderr)
        for error in errors:
            print(f"  - {error}", file=sys.stderr)
        return 1

    print("Markdown link check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
