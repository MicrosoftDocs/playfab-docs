---
title: API Access Policy in Game Manager
author: kidistadamu
description: Learn how to view and manage your title's API access policy in Game Manager.
ms.author: kidistadamu
ms.date: 04/24/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, config, game manager, api access, privacy
ms.localizationpriority: medium
---
# API Access Policy

## About PlayFab APIs

Game clients make requests to PlayFab APIs using URIs like:

- `/client/loginwithxbox`
- `/catalog/getitems`
- `/cloudscript/executefunction`

These requests include a payload of data that tells PlayFab what to do: which player to log in, what item to retrieve, what function to execute.

## What is an API access policy?

Every PlayFab title has an **API access policy:** a list of permission statements that control which PlayFab APIs players are allowed to invoke from the game client. The policy acts as a title-level firewall: when a client or makes an API call, PlayFab evaluates the policy to determine whether the request should be **allowed** or **denied**.

The default API access policy allows most APIs.

## Why modify the API access policy?

- Restrict access to features your title isn't using
- Prevent malicious players from increasing your costs
- Safety from typos during development

## Structure

A title's API access policy is an ordered list of **statements**. Each statement has these fields:

| Field             | Description                                                                                                                                                                                          |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Resource**      | The API path the statement applies to, expressed as a PlayFab Resource Name (for example, `pfrn:api--/Client/*` or `pfrn:api--/Client/GetPlayerProfile`). A wildcard `*` matches all APIs in a namespace.   |
| **Action**        | Always `*` (all actions).                                                                                                                                                                            |
| **Effect**        | `Allow` or `Deny`.                                                                                                                                                                                   |
| **Principal**     | Who the statement applies to. `*` means all callers. A JSON object (for example, `{"master_player_account": "*"}`) targets a specific principal type. We don't recommend using a principal other than `*`. |
| **Comment**       | An optional description.                                                                                                                                                                             |
| **ApiConditions** | Optional conditions such as `HasSignatureOrEncryption`.                                                                                                                                              |

## Deny effect

Using the `Deny` effect takes precedence over the `Allow` effect. If a resource with a wildcard (for example, `pfrn:api--/CloudScript/*`) has a `Deny` effect, then no APIs starting with that resource may be accessed, even if they have specific `Allow` effects.

## API Access Policy page

The **API Access Policy** page in your title's settings page in Game Manager provides an interface for viewing and editing your title's API access policy.

## Index page

The index page displays a table of all API categories with the following columns:

| Column                 | Description                                                                                                                                                                               |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Category**           | The name of the API category (for example, "Client", "Server"). Click to edit APIs for that category, which may be multiple                                                                      |
| **Wildcard Statement** | Shows the current wildcard effect for the category, **Allow** or **Deny**. This is the default rule applied to every API in the category unless overridden by a more specific statement. |
| **Summary**            | A brief count of any per-API overrides in the category (for example, "3 denied, 1 allowed").                                                                                                     |

### Available actions

- **Search**: Filter the category list by name or by API path. This filter is retained on the category page.
- **Edit as JSON**: Opens a full-policy JSON editor for power users. Saving here replaces the entire policy at once and takes effect immediately.
- **Revert to Defaults**: Resets the entire policy back to PlayFab's default policy and saves immediately. A confirmation dialog appears before this action is executed.

## Category page

Clicking a category name navigates to the detail page, which lists every API in that category with individual controls. Any changes to the checkboxes on this page must be saved before they take effect.

### Wildcard rule

At the top of each resource pattern group is a **wildcard rule**, a radio button group for `Allow` or `Deny`. This sets the default effect for all APIs in that group. When the wildcard is set to **Deny**, all individual API toggles below it are disabled because the entire category is blocked.

### Per-API toggles

Below the wildcard rule, each API endpoint is listed with a checkbox. When checked, the API is **allowed**; when unchecked, it's **denied**. These per-API toggles let you create exceptions to the wildcard rule. For example, deny all Client APIs by default, then explicitly allow only the ones your title uses.

### Available actions

- **Save**: Saves only the statements for the current category
- **Reset**: Discards all unsaved changes for this category
- **Edit as JSON**: Opens a JSON editor scoped to this category's statements
- **Search**: Filter the API list within the category

## Change summary sidebar

Both pages include a **Pending changes** sidebar on the right side of the screen. This sidebar shows a real-time list of every statement you've changed since the last save, with color-coded labels:

- **Allow**: A resource was changed to allow
- **Deny**: A resource was changed to deny
- **Removed**: A previously explicit statement was removed (the API inherits its category's wildcard rule)

On the index page, each change in the sidebar links back to the relevant category page.
