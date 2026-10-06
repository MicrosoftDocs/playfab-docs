---
title: Game Saves offline mode
author: jasonsandlin
description: Game Saves offline mode
ms.author: jasonsa
ms.date: 07/01/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

# Game Saves offline mode

Game Saves is designed to work both online and offline, allowing players to continue playing even when network connectivity is unavailable. The system operates in two distinct modes based on network availability and user choices.

## Connection Modes

### Connected to Cloud Mode
When network is available and `PFGameSaveFilesAddUserWithUiAsync()` completes successfully, the system operates in connected to cloud mode. In this mode:
- All APIs function normally with full cloud synchronization
- Save data uploads work as expected
- Storage quota information is available
- Active device monitoring works properly

### Offline Mode (Not Connected to Cloud)
When network is unavailable or the user chooses to play offline, the system enters offline mode with limited functionality. You can check the current connection status using `PFGameSaveFilesIsConnectedToCloud()` to determine which mode the system is operating in.

## Handling Network Failures During Initial Sync

When `PFGameSaveFilesAddUserWithUiAsync()` is called without network connectivity, it triggers a `PFGameSaveFilesUiSyncFailedCallback`. The `XAsyncBlock` callback doesn't fire while the system waits for the user's response—the async operation is paused until the user selects a terminal action.

```cpp
// Handle sync failure callback
void MyPFGameSaveFilesUiSyncFailedCallback(PFLocalUserHandle localUserHandle, PFGameSaveFilesSyncState syncState, HRESULT error, void* context)
{
    // Tell the user something like this:
    std::cout << "We couldn't sync your data with the cloud just now" << std::endl;
    std::cout << "Try syncing again or use this game offline" << std::endl;
    std::cout << "[Try Again]" << std::endl;
    std::cout << "[Use Offline]" << std::endl;

    // if user chooses [Try Again], call PFGameSaveFilesSetUiSyncFailedResponse(localUserHandle, PFGameSaveFilesUiSyncFailedUserAction::Retry);
    // if user chooses [Use Offline], call PFGameSaveFilesSetUiSyncFailedResponse(localUserHandle, PFGameSaveFilesUiSyncFailedUserAction::UseOffline);

    // These API calls can happen inside or outside of this callback
}
```

**User Response Options:**
- **Try Again (`Retry`)**: Retries the network call. If the retry also fails, this callback fires again and the user must respond again. The `XAsyncBlock` callback remains deferred through each retry loop.
- **Use Offline (`UseOffline`)**: The `XAsyncBlock` callback fires with `S_OK`, but the system enters offline mode (detectable with `PFGameSaveFilesIsConnectedToCloud()`).
- **Cancel**: The `XAsyncBlock` callback fires with `E_PF_GAMESAVE_USER_CANCELLED`.

## API Behavior in Offline Mode

When in offline mode, APIs behave differently:

### APIs That Work Normally
- `PFGameSaveFilesGetFolder()` - Returns local save folder path

### APIs With Limited Functionality  
- `PFGameSaveFilesUploadWithUiAsync()` - Returns `S_OK` immediately, but async completion returns `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`
- `PFGameSaveFilesGetRemainingQuota()` - Returns `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`
- `PFGameSaveFilesSetActiveDeviceChangedCallback()` - Can be set but will never trigger

### Returning to Online Mode
- Call `PFGameSaveFilesAddUserWithUiAsync()` again to attempt reconnection
- No need to fully reinitialize the Game Saves system
- Will show failure UI again if network is still unavailable
- Use `PFGameSaveFilesIsConnectedToCloud()` to verify connection status after retry attempts

## When Game Saves enters offline mode or returns an error

A common integration question is: *when does the initial sync (`PFGameSaveFilesAddUserWithUiAsync`) drop the player into offline mode, and when does it fail with an error code?* There are three terminal outcomes—connected, offline, or cancelled—and a cancel can come from either the player or the game:

| Outcome | How it's reached | Async result | `IsConnectedToCloud()` | Save folder available? | Recommended handling |
|---------|------------------|--------------|------------------------|------------------------|----------------------|
| **Connected** | Sync completed successfully | `S_OK` | `true` | Yes | Allow play; saves sync to the cloud. |
| **Offline** | User selected **Use Offline** on the sync-failed prompt (or another device became the active device) | `S_OK` | `false` | Yes | Allow play with local saves; tell the player saves won't sync. |
| **Cancelled by the player** | User selected **Cancel** on any prompt | `E_PF_GAMESAVE_USER_CANCELLED` (`0x800704C7`) | n/a | **No** | **Block play** or return to a safe menu—there's no folder to save or load. |
| **Cancelled by the game** | The game called `XAsyncCancel` on the `XAsyncBlock` | `E_ABORT` (`0x80004004`) | n/a | **No** | Same as a player cancel—there's no folder to save or load. |

Key points:

- **Offline mode is a success outcome, not an error.** It is only entered by an explicit **Use Offline** choice, and the async operation completes with `S_OK`. Detect it with `PFGameSaveFilesIsConnectedToCloud()`.
- **Transient/technical failures are surfaced through the sync-failed UI**, not returned directly from `PFGameSaveFilesAddUserWithUiAsync`. The user (or your auto-response) then chooses `Retry`, `UseOffline`, or `Cancel`, which resolves to one of the three outcomes above.
- **Cancel is terminal and produces no save folder.** Treat "cancelled" (or any failure that leaves no folder) as *don't allow play*.
- **Player cancel and game cancel return different codes.** Only the player choosing **Cancel** on a prompt produces `E_PF_GAMESAVE_USER_CANCELLED`. If your game cancels the operation itself with `XAsyncCancel`, it completes with `E_ABORT`. Check for both if you want to treat them the same way.

> [!NOTE]
> Cancelling a **conflict** prompt is also terminal—it completes with `E_PF_GAMESAVE_USER_CANCELLED` and does not automatically fall through to a sync-failed "Use Offline" prompt. If you want a "reject the conflict but keep playing offline" experience, design it explicitly (for example, re-run `PFGameSaveFilesAddUserWithUiAsync` and choose Use Offline on the resulting failure). See [Game Saves conflicts](./conflicts.md).

## Game Saves error codes

The following HRESULTs are defined by the Game Saves SDK. Codes in the `0x8923xxxx` range are Game Saves–specific; `0x800704C7` is `HRESULT_FROM_WIN32(ERROR_CANCELLED)`.

| Code | Value | When it's returned |
|------|-------|--------------------|
| `E_PF_GAMESAVE_USER_CANCELLED` | `0x800704C7` | User selected **Cancel** on any UI prompt. Terminal; no save folder. (If the game cancels the `XAsyncBlock` with `XAsyncCancel`, the operation completes with the standard `E_ABORT` (`0x80004004`) instead.) |
| `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD` | `0x89237004` | Returned by `PFGameSaveFilesUploadWithUiAsync()` and `PFGameSaveFilesGetRemainingQuota()` while the session is in offline mode. |
| `E_PF_GAMESAVE_NETWORK_FAILURE` | `0x89237005` | Returned by `PFGameSaveFilesUploadWithUiAsync()` after a transient network failure while still connected to the cloud. Safe to retry later. |
| `E_PF_GAMESAVE_DEVICE_NO_LONGER_ACTIVE` | `0x89237007` | Returned by `PFGameSaveFilesUploadWithUiAsync()` when this device is no longer the active device (another device took over). |
| `E_PF_GAMESAVE_DISK_FULL` | `0x89237008` | Not enough local disk space to download save data. Prompt the user to free space and retry. |
| `E_PF_GAMESAVE_OPERATION_IN_PROGRESS` | `0x89237009` | A conflicting operation is already running for this user: `PFGameSaveFilesUploadWithUiAsync()` was called while another upload or a cloud reset is in progress, `PFGameSaveFilesAddUserWithUiAsync()` was called while a cloud reset is in progress, or `PFGameSaveFilesResetCloudAsync()` was called while another reset, an upload, or a download is in progress. Nothing was started or modified; wait for the in-flight operation to complete, then retry. Available starting with the October 2026 GDK (2610). |
| `E_PF_GAMESAVE_LOCAL_FILE_UNAVAILABLE` | `0x8923700A` | Returned by `PFGameSaveFilesUploadWithUiAsync()` when a local save file can't be read during the upload—for example, the title still has it open for writing. Nothing was committed to the cloud. Transient: retry once the title stops writing that file. Available in the October 2025 GDK (2510) QFE5, the April 2026 GDK (2604) QFE6, and the October 2026 GDK (2610). |
| `E_PF_GAMESAVE_DOWNLOAD_IN_PROGRESS` | `0x89237006` | `PFGameSaveFilesUploadWithUiAsync()` was called before `PFGameSaveFilesAddUserWithUiAsync()` finished the initial sync. |
| `E_PF_GAMESAVE_USER_NOT_ADDED` | `0x89237003` | An API was called before `PFGameSaveFilesAddUserWithUiAsync()` completed for that user. |
| `E_PF_GAMESAVE_USER_ALREADY_ADDED` | `0x89237002` | `PFGameSaveFilesAddUserWithUiAsync()` was called again for a user already added. |
| `E_PF_GAMESAVE_ALREADY_INITIALIZED` | `0x89237001` | `PFGameSaveFilesInitialize()` was called twice without an intervening `PFGameSaveFilesUninitializeAsync()`. |
| `E_PF_GAMESAVE_NOT_INITIALIZED` | `0x89237000` | An API was called before `PFGameSaveFilesInitialize()`. |

For how these outcomes are produced by the built-in (out-of-process) system UI versus your own callbacks, see [Game Saves UI callbacks](./ui-callbacks.md#in-process-vs-out-of-process-system-ui).

## Additional Connection Status Scenarios

The `PFGameSaveFilesIsConnectedToCloud()` API is particularly useful because disconnection can happen in multiple ways:

- **Network unavailable during sync**: User explicitly chooses to play offline
- **Active device changed**: Another device takes over as the active device, automatically putting this device in offline mode

Use this API before attempting cloud operations to provide appropriate user feedback.

## Best Practices for Offline Support

1. **Always implement sync failure callbacks** to handle network issues gracefully
2. **Check connection status regularly** using `PFGameSaveFilesIsConnectedToCloud()` before attempting cloud operations  
3. **Inform players** when operating in offline mode so they understand saves won't sync
4. **Provide retry options** when network connectivity is restored
5. **Local saves always work** - players can continue playing regardless of network status
6. **Monitor for disconnection** - remember that devices can be disconnected when another device becomes active

## Upload Behavior in Connected Mode

Even in connected mode, uploads can fail due to network issues or rate limits. When this happens, the `XAsyncBlock` callback doesn't fire immediately—the async operation pauses while the system waits for the user's response through the [UI callback state machine](./ui-callbacks.md#how-the-state-machine-works):

1. The `PFGameSaveFilesUiSyncFailedCallback` fires with the error details.
2. The `XAsyncBlock` callback doesn't fire yet—the operation is paused while the system waits for a response.
3. If the user selects `Retry`, the upload retries. If it fails again, the callback fires again and the user must respond again.
4. If the user selects `Cancel`, the `XAsyncBlock` callback fires with `E_PF_GAMESAVE_USER_CANCELLED`.
5. If a retry succeeds, the `XAsyncBlock` callback fires with `S_OK`.

The game can call `PFGameSaveFilesUploadWithUiAsync()` again later when network is restored.

> [!NOTE]
> **In-process, don't offer `Use Offline` in the sync-failed prompt while an upload is running.** The upload fires the same `PFGameSaveFilesUiSyncFailedCallback` as the initial sync, so the SDK doesn't restrict the choices—but if your game responds with `UseOffline` to an upload failure, the upload fails with `E_ABORT` (and debug builds assert). Offer only `Retry` and `Cancel` there.

## When an upload takes the session offline

An upload doesn't normally change the connection mode, but it can end with the session offline in the following cases. In each one, the upload completes with `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`, and `PFGameSaveFilesIsConnectedToCloud()` returns `false` afterward.

- **The session was already offline.** The upload doesn't run and completes with `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`, even if the network has been restored.
- **The cloud has a newer save.** If the service reports that a newer save was committed from another device when the upload finalizes, Game Saves puts the session offline, fires the active-device-changed callback, and completes the upload with `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`.
- **The player chooses `Use Offline` on the re-lock prompt.** If an earlier upload committed its data but failed afterward, the next upload first has to re-acquire the save lock. A sync-failed prompt during that step can be answered with `UseOffline`, which takes the session offline and completes the upload with `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`.

To reconnect, call `PFGameSaveFilesAddUserWithUiAsync()` again.

## Cancelling an upload

An upload can be cancelled the same way the initial sync can: the user can `Cancel` the **progress** UI while the upload is in flight, or `Cancel` the **sync-failed** prompt if the upload hit an error. Either way, `PFGameSaveFilesUploadWithUiAsync()` completes with `E_PF_GAMESAVE_USER_CANCELLED` (`0x800704C7`) and the save isn't uploaded. Its terminal results are **success**, **cancelled**, or **failed** (where `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD` means the session is now offline—see [When an upload takes the session offline](#when-an-upload-takes-the-session-offline))—handle `E_PF_GAMESAVE_USER_CANCELLED` distinctly from other failures so you can tell "the player backed out" apart from "the upload errored." If your game cancels the upload itself with `XAsyncCancel`, it completes with `E_ABORT` rather than `E_PF_GAMESAVE_USER_CANCELLED`.

