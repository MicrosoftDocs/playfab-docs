# PlayFab Documentation

Public documentation for Microsoft PlayFab, published to [learn.microsoft.com/gaming/playfab](https://learn.microsoft.com/gaming/playfab/). Built with DocFX (Markdig engine) and Microsoft Open Publishing System (OPS).

## Build & Validation

There is no local build. OPS builds on every push:

1. Push your branch → Learn Build Service emails you results + preview URLs
2. Fix all **errors** (block build). Note any **warnings** in files you touched — fix them in a follow-up PR to keep diffs clean
3. Preview on review.learn.microsoft.com using the emailed links

Run local validation before submitting a PR:

```powershell
.\scripts\validate-docs.ps1              # changed files vs main
.\scripts\validate-docs.ps1 -All         # entire docs folder
.\scripts\validate-docs.ps1 -Path playfab-docs/economy-monetization
```

Acrolinx content quality score ≥ 80 is required for merge to main.

**Recommended editor:** VS Code with the Learn Authoring Pack extension.
See `CONTRIBUTING.md` for the full contributor workflow.

## Branch Workflow

- Create working branches from `main`
- All PRs target `main` — never commit directly
- "Xbox learning resources" reviewer is auto-assigned (CODEOWNERS) and must approve
- `main` → `live` is merged on the 2nd and 4th Tuesday of each month via automated PR

## Project Structure

```
playfab-docs/                    ← All documentation content
├── docfx.json                   ← DocFX build config
├── index.yml                    ← Hub landing page (YamlMime:Hub)
├── toc.yml                      ← Top-level table of contents
├── includes/                    ← Reusable include files (_name.md)
├── media/                       ← Images (PNG, SVG, JPG)
├── breadcrumb/                  ← Breadcrumb navigation
├── get-started/                 ← Onboarding & fundamentals
├── economy-monetization/        ← Economy, catalogs, stores, UGC
├── multiplayer/                 ← Servers, matchmaking, lobbies, networking
├── identity/                    ← Authentication, player profiles
├── player-progression/          ← Leaderboards, achievements, rules
├── live-service-management/     ← Title config, experiments, insights
├── data-analytics/              ← PlayStream, events, data connections
├── sdks/                        ← SDK guides (C++, Unity, Unreal, etc.)
├── api-references/              ← API reference docs (multiple formats — see L2)
├── release-notes/               ← Version history (different format — see L2)
├── pricing/                     ← Pricing tiers and meters
├── resources/                   ← Limits, best practices
├── community/                   ← Forums, support
└── whats-new/                   ← Feature announcements
```

## Required YAML Frontmatter

Every `.md` file must begin with YAML frontmatter (`---` delimiters). Article pages require all these fields:

```yaml
---
title: "Page Title"
description: "Brief SEO description of the page"
author: githubUsername
ms.author: microsoftAlias
ms.date: MM/DD/YYYY
ms.topic: article
ms.service: azure-playfab
---
```

> [!NOTE]
> `ms.topic: include` files (under `playfab-docs/includes/`) do not require `title` or `description`. All other fields are still required.

- `ms.topic` values: `article` (most content), `reference` (API docs), `include` (include files), `hub-page` (index.yml), `overview`, `release-notes`
- `ms.service`: always `azure-playfab`
- Date format: `MM/DD/YYYY`
- All documentation is public — never include internal or confidential content

## Markdown Conventions

DocFX-flavored Markdown (Markdig engine). Key rules:

- **One H1 per page**, matching the frontmatter `title`
- **Never skip heading levels** — go H1 → H2 → H3, never H1 → H3
- **No duplicate H2 headings** within a single topic
- **Always specify language** on code blocks: ` ```json `, ` ```csharp `, ` ```cpp `

### Alerts

```markdown
> [!NOTE]
> Informational content

> [!IMPORTANT]
> Critical information

> [!TIP]
> Helpful suggestion

> [!WARNING]
> Risk or danger
```

### Video embeds

```markdown
> [!VIDEO video-id-here]
>
```

### API cross-references (xref)

```markdown
[Display text](xref:titleid.playfabapi.com.admin.authentication.getpolicy)
```

## Links

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

## Images

- Store in `media/` directory relative to the content section
- **Always include descriptive alt text** (accessibility requirement)
- Supported formats: PNG, JPG, SVG, GIF

```markdown
![Descriptive alt text for screen readers](./media/filename.png)
```

## TOC Files

YAML format with `name`/`href` pairs — see `playfab-docs/toc.yml` for the pattern:

```yaml
items:
- name: Overview
  href: overview.md
- name: Section Name
  items:
  - name: Sub-page
    href: sub-page.md
```

## Include Files

- Stored in `playfab-docs/includes/`
- Named with underscore prefix: `_name.md`
- Use `ms.topic: include` in frontmatter

## Content Quality

- Acrolinx minimum score: **80** (enforced on merge)
- All images must have alt text
- Fix all build warnings in files you touch
- No duplicate H1 titles across topics
- Validate all links (build validates automatically)
- Domain-specific spelling → add to `.vscode/settings.json` cSpell words list

## Key Patterns

- New conceptual article → follow `playfab-docs/get-started/what-is-playfab.md`
- New TOC entry → follow `playfab-docs/toc.yml`
- New include file → follow `playfab-docs/includes/_economy-deprecation.md`
- Hub/landing page → follow `playfab-docs/index.yml` (YamlMime:Hub format)
