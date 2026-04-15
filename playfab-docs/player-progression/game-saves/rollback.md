---
title: Game Saves rollback
author: andmcc
description: How to use rollback to recover a player's game save to a previous version.
ms.author: andmcc
ms.date: 03/24/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves, rollback, version recovery
ms.localizationpriority: medium
---

# Game Saves rollback

Rollback lets you restore a player's game save to an earlier state. Use it when a player's save becomes corrupted, when a title update introduces a bug that damages save data, or when a player wants to reverse a conflict resolution decision.

## How rollback works

Game Saves tracks finalized versions of a player's save data. When you trigger a rollback, the service creates a **new version** whose contents are identical to the earlier state you're restoring. Rollback preserves the original version history. It doesn't delete or overwrite previous versions. Other devices that sync after the rollback see it as a normal update.

There are two types of rollback. You trigger each by passing an option flag to `PFGameSaveFilesAddUserWithUiAsync`:

| Option | Description |
|--------|-------------|
| `PFGameSaveFilesAddUserOptions::RollbackToLastKnownGood` | Restores the most recently verified prior cloud save. This save was previously loaded and later replaced by a newer upload. |
| `PFGameSaveFilesAddUserOptions::RollbackToLastConflict` | Restores the save state that lost the most recent conflict resolution. |

Both options fall back to default behavior (sync the current latest version) if no eligible restore point exists.

## When to use each rollback type

### Rollback to last known good

Use `RollbackToLastKnownGood` when you suspect the latest upload is bad. Common triggers include:

- Load failure or failed integrity check after downloading a save.
- A crash during or immediately after a save operation.
- A player report of corrupted or regressed state.

The service automatically tracks which versions are "known good." You don't need to mark them explicitly. A version becomes known good when you successfully load it and a newer upload later replaces it.

### Rollback to last conflict

Use `RollbackToLastConflict` when a player chose the wrong side during conflict resolution. As described in [Game Saves conflicts](conflicts.md), both resolution choices preserve the discarded branch. This rollback option restores that preserved branch.

## Calling the API

Trigger rollback by passing the appropriate option to `PFGameSaveFilesAddUserWithUiAsync`. You can only call this function once per user, so to roll back for a user that's already added, first call `PFGameSaveFilesUninitializeAsync` and wait for it to complete.

```cpp
// Rollback to last known good version
XAsyncBlock async{};
async.queue = queue;
async.callback = [](XAsyncBlock* async)
{
    HRESULT hr = PFGameSaveFilesAddUserWithUiResult(async);
    if (SUCCEEDED(hr))
    {
        // Save data is now restored to the last known good version.
        // Read files from the game save folder as usual.
    }
};

HRESULT hr = PFGameSaveFilesAddUserWithUiAsync(
    localUserHandle,
    PFGameSaveFilesAddUserOptions::RollbackToLastKnownGood,
    &async
);
```

To roll back to the last conflict loser instead, replace the option flag:

```cpp
HRESULT hr = PFGameSaveFilesAddUserWithUiAsync(
    localUserHandle,
    PFGameSaveFilesAddUserOptions::RollbackToLastConflict,
    &async
);
```

### Fallback behavior

If no eligible restore point exists for the requested rollback type, the call behaves as if you passed `PFGameSaveFilesAddUserOptions::None`. The current latest version syncs normally. Check the synced files after the call completes to confirm whether a rollback occurred.

## Title configuration

You can restrict client-initiated rollback through two configuration flags. When you enable either flag, only support tools and Game Manager can perform that type of rollback.

| Flag | Effect |
|------|--------|
| `DisableClientRollbackToLastKnownGood` | Prevents game clients from rolling back to the last known good version. |
| `DisableClientRollbackToLastConflictLoser` | Prevents game clients from reversing the most recent conflict resolution decision. |

Set these flags in Game Manager under **Progression > Game Saves**.

## Error handling

| HRESULT | Meaning |
|---------|---------|
| `E_PF_GAME_SAVE_MANIFEST_NOT_ELIGIBLE_FOR_ROLLBACK` | No eligible restore point exists for the requested rollback type. |
| `E_PF_GAME_SAVE_NOT_FINALIZED_MANIFEST_NOT_ELIGIBLE_AS_KNOWN_GOOD` | The target version isn't eligible as a known good restore point. |
| `E_PF_GAME_SAVE_SERVICE_NOT_ENABLED_FOR_TITLE` | Game Saves isn't enabled for this title. Complete onboarding first. |
| `E_PF_GAME_SAVE_SERVICE_ONBOARDING_PENDING` | Title onboarding is still in progress. |

## Considerations

- **Rollback creates a new version.** It doesn't erase history. The player's version sequence continues forward.
- **The service tracks known good automatically.** It determines which versions qualify based on successful load-then-replace cycles. Your game doesn't need to mark versions explicitly.
- **One rollback per add-user call.** Because you can only call `PFGameSaveFilesAddUserWithUiAsync` once per user, triggering a second rollback requires calling `PFGameSaveFilesUninitializeAsync` first.
- **UI callbacks still fire.** Rollback goes through the same sync flow as a normal add-user call. Register your [UI callbacks](ui-callbacks.md) before calling the API.
- **Restrict rollback if needed.** If your game handles recovery server-side or through support tooling, disable client rollback with the title configuration flags to prevent players from accidentally reverting progress.
- **Rollback works on all platforms.** This API has no platform-specific guards.
