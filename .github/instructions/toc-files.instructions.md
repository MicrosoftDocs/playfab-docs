---
applyTo: "playfab-docs/**/toc.yml"
---

# toc.yml Editing Instructions

## Format

```yaml
- name: "Display Name"
  href: ./article.md          # link to article or child toc.yml
  items:                       # optional nested entries
    - name: "Child Entry"
      href: ./child/article.md
```

## Rules

- `name` — quote if it contains special characters
- `href` — use relative paths (`./`, `../`) or site-absolute paths starting with `/playfab-docs/...`
- Link to child `toc.yml` files for sub-sections, or directly to `.md` files
- Maintain ordering consistent with sibling entries
- Every article in the directory should have a TOC entry — orphaned pages won't appear in navigation
- Test that all `href` paths resolve to existing files

## Pattern File

Follow `playfab-docs/toc.yml` for top-level structure.
