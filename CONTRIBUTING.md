# Contributing to PlayFab Documentation

## Branch Strategy

```
main → live
```

- Create working branches from **main**
- **All PRs must target `main`** — never commit to main directly
- Automated merges promote content: main → live (2nd and 4th Tuesday of each month)
- "Xbox learning resources" reviewer is automatically assigned via CODEOWNERS and must approve

## Documentation URL

Published to: https://learn.microsoft.com/gaming/playfab/

## Article Requirements

Every Markdown article in `playfab-docs/` must include YAML frontmatter with these required fields:

| Field | Format | Example |
|---|---|---|
| `author` | GitHub username | `joannaleecy` |
| `title` | Quoted string | `"Overview of Economy features"` |
| `description` | Quoted string (<160 chars) | `"Learn about PlayFab Economy..."` |
| `ms.author` | MS alias | `joanlee` |
| `ms.topic` | Enum | `article`, `conceptual`, `reference`, `include`, `hub-page`, `overview`, `release-notes` |
| `ms.date` | `MM/DD/YYYY` | `03/19/2025` |
| `ms.service` | Always | `azure-playfab` |

Optional but recommended: `keywords` (SEO terms), `ms.localizationpriority`.

## Markdown Conventions

PlayFab docs use **DocFX-flavored Markdown** (Markdig engine). Supported extensions:

```markdown
> [!NOTE]           > [!IMPORTANT]
> [!TIP]            > [!WARNING]
> [!VIDEO id]       (video embeds)
```

Cross-reference syntax for API links:
```markdown
[Display text](xref:titleid.playfabapi.com.admin.authentication.getpolicy)
```

### Rules

- **One H1 per page**, matching the frontmatter `title`
- **Never skip heading levels** — go H1 → H2 → H3, not H1 → H3
- **No duplicate H2 headings** within a single topic
- **Always specify language** on code blocks: ` ```json `, ` ```csharp `, ` ```cpp `
- **No raw HTML** — use only standard Markdown and Learn extensions
- **All images must have alt-text** for accessibility

## File Naming

- Use **kebab-case** for Markdown files: `economy-what-is.md`
- TOC files are always `toc.yml` (lowercase)
- Images go in `media/` directory relative to the content section

## Linking

### Internal (same repo)

Use relative paths **with** `.md` extension:

```markdown
[Link text](../section/file.md)
```

### Cross-repo (other Learn docsets)

Use site-relative paths **without** `.md` extension:

```markdown
[Link text](/gaming/playfab/features/multiplayer/servers/overview)
```

Cross-repo links are validated at build time but are NOT click-navigable on the staging site.

## Validation Workflow

1. Push your branch to the server
2. The **Learn Build Service** runs validation and sends you an email
3. Review the build status:
   - **Failed** — must fix before content can build
   - **Succeeded With Warning** — fix warnings in your topics before PR
   - **Succeeded With Suggestion** — fix if possible (aliases, table headers)
   - **Succeeded** — ideal state ✅
4. Use the preview URLs in the email to verify rendering

### Local Validation

Run the validation script before submitting a PR:

```powershell
.\scripts\validate-docs.ps1              # changed files vs main
.\scripts\validate-docs.ps1 -All         # entire docs folder
.\scripts\validate-docs.ps1 -Path playfab-docs/economy-monetization
```

### Local Preview

Install the **Learn Authoring Pack** VS Code extension for local markdown preview.

## Checklist Before Submitting a PR

- [ ] All new/modified articles have complete frontmatter
- [ ] `title` field is present (required for builds)
- [ ] `ms.date` is updated on edited articles
- [ ] New articles are added to the relevant `toc.yml`
- [ ] Images have descriptive alt-text for accessibility
- [ ] No broken links to other articles
- [ ] No raw HTML — use only standard Markdown and Learn extensions
- [ ] Cross-repo links use site-relative paths (no `.md` extension)
- [ ] Content is public-friendly (no confidential info or codenames)
- [ ] Build validation email reviewed — errors and warnings resolved
- [ ] Acrolinx score is 80+ (check automated PR test results)
- [ ] PR targets **main**

## Code Owners

All content is owned by **@MicrosoftDocs/xbox-learning-resources** (see `CODEOWNERS`).
