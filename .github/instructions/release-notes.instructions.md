---
applyTo: "playfab-docs/release-notes/**"
---

# Release Notes Conventions

## Entry Format

Each release is an H2 heading with a version identifier, followed by the date and a bullet list of changes:

```markdown
## <version>

Date: Month Day, Year

- Change description with relevant details
- Another change
```

## Version Formats

Different libraries use different version formats. **Always follow the existing version format used in the file you are editing.**

| Library | Format | Example |
|---|---|---|
| PlayFab Services SDK | `YYMMDD` (year-month-day, no separators) | `251219` |
| PlayFab C/C++ SDK | Semver-style | `2504.0.0` |

If you are unsure which format to use, check the most recent H2 heading already in the file and match it.

## Examples

### PlayFab Services SDK (`YYMMDD`)

```markdown
## 251219

Date: December 19, 2025

- Added StartDate field to Economy API SearchItems response
- Fixed issue with multiplayer server allocation in East US region
```

### PlayFab C/C++ SDK (semver)

```markdown
## 2504.0.0

Date: April 25, 2025

- Added new PFAccountManagement APIs for contact email management
- Fixed memory leak in PFMultiplayerServer cleanup
```

## Rules

- Date line uses full month name: `Date: March 15, 2025`
- Each bullet is a concise, complete sentence fragment describing one change
- Newest releases go at the top of the file
- Each calendar year gets its own file (`2024.md`, `2025.md`, etc.)

## Pattern Files

- PlayFab Services SDK → `playfab-docs/release-notes/2025.md`
- PlayFab C/C++ SDK → `playfab-docs/release-notes/playfab-c/index.md`
