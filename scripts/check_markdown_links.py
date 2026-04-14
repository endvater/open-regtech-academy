#!/usr/bin/env python3
"""Validate relative Markdown links inside the repository."""

from __future__ import annotations

import re
import sys
from pathlib import Path


LINK_RE = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")


def should_skip(target: str) -> bool:
    return (
        target.startswith("http://")
        or target.startswith("https://")
        or target.startswith("mailto:")
        or target.startswith("#")
    )


def normalize_target(target: str) -> str:
    cleaned = target.strip().strip("<>").strip()
    if " " in cleaned and not cleaned.startswith("/"):
        cleaned = cleaned.split(" ", 1)[0]
    return cleaned.split("#", 1)[0]


def validate_links(root: Path) -> list[str]:
    errors: list[str] = []
    for markdown_file in root.rglob("*.md"):
        text = markdown_file.read_text(encoding="utf-8")
        for match in LINK_RE.finditer(text):
            raw_target = match.group(1).strip()
            if should_skip(raw_target):
                continue
            normalized = normalize_target(raw_target)
            if not normalized:
                continue
            target_path = (markdown_file.parent / normalized).resolve()
            if not target_path.exists():
                rel_file = markdown_file.relative_to(root)
                errors.append(f"{rel_file}: missing target -> {raw_target}")
    return errors


def main() -> int:
    root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path.cwd()
    root = root.resolve()
    errors = validate_links(root)
    if errors:
        for error in errors:
            print(error)
        return 1
    print("All relative Markdown links look valid.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
