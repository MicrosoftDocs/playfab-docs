---
applyTo: "playfab-docs/api-references/**"
---

# API Reference Conventions

API reference pages use `ms.topic: reference` (not `conceptual`).

> [!NOTE]
> Many PlayFab API reference pages are machine-generated from a reference source. When reviewing or editing generated reference pages, respect the existing structure and conventions of the generated output. These conventions primarily apply to human-authored and AI-authored reference pages.

## API Function Pages

Follow this section structure for API function reference pages:

```markdown
# FunctionName

One-sentence summary.

## Syntax

\`\`\`cpp
ReturnType FunctionName(
    ParamType param1,
    const ParamType* param2
)
\`\`\`

### Parameters

**`param1`** &nbsp; ParamType
Description of parameter.

### Return value

Type: ReturnType
Description.

## Remarks

Detailed explanation.

## Requirements

**Header:** HeaderFile.h

## See also

[Related members](../members.md)
```

## Members Overview Pages

Use markdown tables with two columns:

```markdown
| Function | Description |
|---|---|
| [FunctionName](functions/functionname.md) | Brief description |
```

## API Cross-References

Use xref syntax for links to PlayFab REST API docs:

```markdown
[Display text](xref:titleid.playfabapi.com.admin.authentication.getpolicy)
[With anchor](xref:titleid.playfabapi.com.admin.authentication.updatepolicy#permissionstatement)
```

## Pattern Files

- Function page → see `playfab-docs/api-references/c/pfaccountmanagement/functions/pfaccountmanagementclientaddorupdatecontactemailasync.md`
- Members overview → see `playfab-docs/api-references/c/pfaccountmanagement/pfaccountmanagement_members.md`
