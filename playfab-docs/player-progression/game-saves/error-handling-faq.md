---
title: Game Saves error handling FAQ
author: jasonsandlin
description: Game Saves error handling FAQ covering transient failures, invalid input, and when the system goes offline instead of returning an error.
ms.author: jasonsa
ms.date: 07/15/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves, error handling, offline, transient failures, initialize, add user
ms.localizationpriority: medium
---

# Game Saves error handling FAQ

This article answers common questions about how Game Saves reports failures: which errors are **transient** (worth retrying), which mean **you passed something wrong** (fix the call), and when the system enters **offline mode** instead of returning an error.

Game Saves runs in one of two ways depending on the platform, and error handling differs slightly between them:

- **Out-of-process**: the platform's built-in service performs the sync and shows its own system UI. Game Saves always runs this way on XBOX and Windows.
- **In-process**: the SDK performs the cloud sync itself, on platforms where the platform service isn't available (for example Steam Deck). Your game drives the UI through callbacks.

## When does Game Saves go offline instead of returning an error?

Offline mode is a **success** outcome, not an error. The initial sync (`PFGameSaveFilesAddUserWithUiAsync`) only enters offline mode when the player explicitly chooses **Use Offline / Play offline** on a sync-failure prompt (or when another device becomes the active device). In that case the async operation completes with `S_OK` and `PFGameSaveFilesIsConnectedToCloud()` returns `false`. You still get a usable local save folder.

A deliberate **Cancel** by the player instead completes with `E_PF_GAMESAVE_USER_CANCELLED` and provides **no** save folder—treat that as "don't allow play." If your game cancels the async operation itself with `XAsyncCancel`, it completes with `E_ABORT` instead, also with no save folder; treat `E_ABORT` as your own cancel.

For the full decision table and error-code reference, see [Game Saves offline mode](./offline.md#when-game-saves-enters-offline-mode-or-returns-an-error).

## Can `PFGameSaveFilesInitialize` fail transiently?

**No.** `PFGameSaveFilesInitialize` only validates its arguments and sets up state—it doesn't touch the network. Every failure it returns is deterministic:

- `E_INVALIDARG`: a required argument is missing or invalid. In-process, this includes a missing or invalid `saveFolder` (a valid folder is required on those platforms; on XBOX/GDK the location is fixed and the argument is ignored).
- `E_PF_GAMESAVE_ALREADY_INITIALIZED`: you called it twice without an intervening `PFGameSaveFilesUninitializeAsync`.

If `Initialize` fails, retrying won't help—fix the input. If it succeeds once for a given configuration, it won't start failing later on its own.

## Can `PFGameSaveFilesAddUserWithUiAsync` fail transiently?

**Yes**—this is the call that performs the network sync, so it can hit transient failures (network down, service errors, token refresh, out of disk space). HTTP calls are retried according to the title's HTTP retry settings (`PFHttpRetrySettings`), but there's no guarantee that a transient failure is resolved before your game sees it.

When a transient failure isn't resolved by those retries, it's surfaced through the **sync-failed UI**, where the player chooses **Retry**, **Use Offline**, or **Cancel**—or, in-process with no sync-failed callback registered, it comes back as a raw HRESULT. So a transient failure normally resolves to online, offline, or cancel rather than a raw error—**with one important difference between the two paths** (see the next question).

`PFGameSaveFilesAddUserWithUiAsync` can also return **deterministic** errors that aren't transient and aren't retryable:

- `E_INVALIDARG`: null handle/async, or conflicting options.
- `E_PF_GAMESAVE_NOT_INITIALIZED`: called before `Initialize`.
- `E_PF_GAMESAVE_USER_ALREADY_ADDED`: the user is already added (and still connected).

## Do I need to register UI callbacks to get the offline option?

This is the key difference between the two paths:

- **In-process: yes.** The offline fallback for a transient sync failure only happens if you registered a sync-failed callback (via `PFGameSaveFilesSetUiCallbacks`) before calling `PFGameSaveFilesAddUserWithUiAsync`. **If no callback is registered, a transient failure completes the operation with the raw error HRESULT—there's no Retry and no Use Offline.** On platforms with no built-in Game Saves UI, registering the callbacks is required.
- **Out-of-process: not for ordinary sync failures.** The platform's built-in system UI provides the **Try again** / **Play offline** choices automatically, so ordinary network failures during sync give the player an offline option without any game callbacks. You can still register callbacks to provide your own UI.

For details on the callbacks and the built-in system UI, see [Game Saves UI callbacks](./ui-callbacks.md).

## Are there failures that happen *before* any UI appears?

**Out-of-process only.** Before the sync UI can appear, `PFGameSaveFilesAddUserWithUiAsync` gathers service configuration and (optionally) signs the user in. Early setup failures—for example the platform service being momentarily unavailable, or the title not being configured for Game Saves—can complete the call with a raw HRESULT before any dialog is shown. Some of these are transient (retry the whole `PFGameSaveFilesAddUserWithUiAsync` a moment later); others indicate configuration problems (deterministic). Sign-in/token failures are handled gracefully and don't fail the call on their own.

In-process, `AddUserWithUiAsync` doesn't have this early-setup category—failures occur during the sync and go through the sync-failed UI (subject to the callback requirement above).

## Can an upload be cancelled?

**Yes.** `PFGameSaveFilesUploadWithUiAsync` shows UI (a progress indicator, and a sync-failed prompt if it hits an error), and the player can back out of either one. When they do, the operation completes with `E_PF_GAMESAVE_USER_CANCELLED` (`0x800704C7`) and the save is **not** uploaded.

Unlike the initial sync, an upload has no **Use Offline** success outcome. Its terminal results are:

- **Success** (`S_OK`): saved to the cloud.
- **Cancelled** (`E_PF_GAMESAVE_USER_CANCELLED`): the player backed out.
- **Cancelled by your game** (`E_ABORT`): your game called `XAsyncCancel` on the upload.
- **Failed**: everything else (for example `E_PF_GAMESAVE_NETWORK_FAILURE` or `E_PF_GAMESAVE_DEVICE_NO_LONGER_ACTIVE`).

An upload can still end with the session **offline**. It completes with `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`, and `PFGameSaveFilesIsConnectedToCloud()` returns `false` afterward, when the session was already offline, when the cloud has a newer save from another device, or when the player chooses **Use Offline** on the re-lock prompt that follows an earlier partially failed upload. See [When an upload takes the session offline](./offline.md#when-an-upload-takes-the-session-offline).

Handle `E_PF_GAMESAVE_USER_CANCELLED` distinctly from other failures so you can tell "the player cancelled" apart from "the upload errored." This is the same cancel code the initial sync uses, so a single check covers both operations.

## Which errors indicate "you passed something wrong" versus a transient problem?

| Result | Meaning | Retryable? |
|--------|---------|-----------|
| `E_INVALIDARG` | Bad argument (null pointer, invalid/missing save folder, conflicting options). | No—fix the call. |
| `E_PF_GAMESAVE_NOT_INITIALIZED` / `E_PF_GAMESAVE_ALREADY_INITIALIZED` | Called out of order. | No—fix the sequence. |
| `E_PF_GAMESAVE_USER_ALREADY_ADDED` / `E_PF_GAMESAVE_USER_NOT_ADDED` | Wrong state for this call. | No—fix the sequence. |
| Sync-failed UI fires during `AddUserWithUiAsync` | Transient network/service failure. | Yes—Retry, or Use Offline. |
| `E_PF_GAMESAVE_NETWORK_FAILURE` (from `PFGameSaveFilesUploadWithUiAsync`) | Transient upload failure; still connected. | Yes—try again later. |
| `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD` | You're in offline mode. | No—you chose offline (or lost active-device status). |
| `E_PF_GAMESAVE_DISK_FULL` | Not enough local disk space. | After the player frees space. |
| `E_PF_GAMESAVE_OPERATION_IN_PROGRESS` | A conflicting operation is already running for this user: another upload or a cloud reset (for uploads and add-user), or any upload, download, or reset (for `PFGameSaveFilesResetCloudAsync`). | Yes—after the in-flight operation completes. |
| `E_PF_GAMESAVE_LOCAL_FILE_UNAVAILABLE` (from `PFGameSaveFilesUploadWithUiAsync`) | A local save file couldn't be read (for example, it's still open for writing). | Yes—once the title stops writing the file. |
| `E_PF_GAMESAVE_USER_CANCELLED` | The player cancelled on a UI prompt. | No. |
| `E_ABORT` | Your game cancelled the async operation with `XAsyncCancel`. | Only if your game starts the operation again. |

See the full HRESULT reference in [Game Saves offline mode](./offline.md#game-saves-error-codes).

## Recommendations

- Treat `PFGameSaveFilesInitialize` failures as **bugs to fix** (bad arguments/config), not runtime conditions to retry.
- **In-process:** always register your UI callbacks (at minimum the sync-failed callback) before `PFGameSaveFilesAddUserWithUiAsync`, so transient failures give the player Retry/Use-Offline instead of a hard error.
- **Out-of-process:** be prepared for a raw failure from `PFGameSaveFilesAddUserWithUiAsync` before any UI (service/config). Retry transient ones; surface configuration problems as errors.
- Gate play on the final result: `S_OK` + connected → play online; `S_OK` + not connected → play offline (warn the player that saves won't sync); cancel/failure with no folder → block play.

## Related content

- [Game Saves offline mode](./offline.md)
- [Game Saves UI callbacks](./ui-callbacks.md)
- [Game Saves conflicts](./conflicts.md)
- [Game Saves active device changes](./activedevicechanges.md)
