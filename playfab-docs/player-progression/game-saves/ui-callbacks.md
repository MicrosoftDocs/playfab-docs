---
title: Game Saves UI callbacks
author: amccalib
description: How Game Saves UI callbacks work, including the state machine model, callback types, and response APIs.
ms.author: andmcc
ms.date: 03/06/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves, ui callbacks, sync failed, conflict, progress
ms.localizationpriority: medium
---

# Game Saves UI callbacks

Game Saves provides a set of UI callbacks that let your game respond to events during sync operations. On Xbox and Windows, the platform provides built-in UI for these events. On other platforms (such as Steam Deck), your game must implement its own UI by handling these callbacks.

Setting callbacks on Xbox and Windows overrides the platform-provided UI with your implementation. This is useful if your game needs a consistent player experience across all platforms—register the same callbacks everywhere and the built-in UI won't appear.

## How the state machine works

Game Saves uses an internal state machine to coordinate UI callbacks with the async operation lifecycle. When a UI callback fires, the async operation pauses—the `XAsyncBlock` callback doesn't fire until the callback is resolved. The state machine doesn't progress until the game calls the corresponding response API or the async operation is canceled.

This means:

- Each callback type has a corresponding response API. Call the response API to tell the system what to do next.
- Response APIs can be called inside or outside the callback function.
- If a response action is `Retry`, the operation retries and may trigger the same callback again.
- The `XAsyncBlock` callback only fires once the operation reaches a terminal state—success, cancellation, or an offline fallback.

For example, if an upload fails due to rate limits:

1. `PFGameSaveFilesUiSyncFailedCallback` fires with the error.
2. The `XAsyncBlock` callback doesn't fire yet—the state machine waits for a response.
3. If the user selects `Retry` and the retry also fails, the sync failed callback fires again.
4. If the user selects `Cancel`, the `XAsyncBlock` callback fires with `E_PF_GAMESAVE_USER_CANCELLED`.
5. If a retry succeeds, the `XAsyncBlock` callback fires with `S_OK`.

## When callbacks trigger

UI callbacks only fire during two async operations:

| Operation | Callbacks that can trigger |
|-----------|--------------------------|
| `PFGameSaveFilesAddUserWithUiAsync` | Progress, Sync Failed, Active Device Contention, Conflict, Out of Storage |
| `PFGameSaveFilesUploadWithUiAsync` | Progress, Sync Failed |

## Registering callbacks

Register all callbacks before calling `PFGameSaveFilesAddUserWithUiAsync` or `PFGameSaveFilesUploadWithUiAsync`:

```cpp
PFGameSaveUICallbacks callbacks{};
callbacks.progressCallback = MyProgressCallback;
callbacks.progressContext = nullptr;
callbacks.syncFailedCallback = MySyncFailedCallback;
callbacks.syncFailedContext = nullptr;
callbacks.activeDeviceContentionCallback = MyActiveDeviceContentionCallback;
callbacks.activeDeviceContentionContext = nullptr;
callbacks.conflictCallback = MyConflictCallback;
callbacks.conflictContext = nullptr;
callbacks.outOfStorageCallback = MyOutOfStorageCallback;
callbacks.outOfStorageContext = nullptr;

HRESULT hr = PFGameSaveFilesSetUiCallbacks(&callbacks);
```

## Callback reference

### Progress

Reports upload or download progress. Use `PFGameSaveFilesUiProgressGetProgress` inside the callback to retrieve the current `PFGameSaveFilesSyncState`, bytes completed, and bytes total.

**Callback**: `PFGameSaveFilesUiProgressCallback`

**Response API**: `PFGameSaveFilesSetUiProgressResponse`

| Action | Effect |
|--------|--------|
| `Cancel` | Cancels the operation. The `XAsyncBlock` callback fires with `E_PF_GAMESAVE_USER_CANCELLED`. |

> [!NOTE]
> The progress callback doesn't require a response to continue—the operation keeps progressing on its own. Only call the response API if the user wants to cancel.

#### Sync states

The `PFGameSaveFilesSyncState` enum indicates which phase the operation is in:

| State | Description | Safe to write to save folder? |
|-------|-------------|-------------------------------|
| `NotStarted` | Operation hasn't begun | Yes |
| `PreparingForDownload` | Preparing to download from cloud | Yes |
| `Downloading` | Downloading from cloud | No |
| `PreparingForUpload` | Reading and compressing local files | No |
| `Uploading` | Upload to cloud in progress (local files captured) | Yes |
| `SyncComplete` | Operation finished | Yes |

### Sync failed

Fires when a sync operation fails, for example due to network issues or rate limits.

**Callback**: `PFGameSaveFilesUiSyncFailedCallback`

**Parameters**: Receives `PFGameSaveFilesSyncState` (the phase that failed) and `HRESULT` (the error code).

**Response API**: `PFGameSaveFilesSetUiSyncFailedResponse`

| Action | Effect |
|--------|--------|
| `Cancel` | Cancels the operation. The `XAsyncBlock` callback fires with `E_PF_GAMESAVE_USER_CANCELLED`. |
| `Retry` | Retries the failed operation. If the retry fails, this callback fires again. |
| `UseOffline` | Only valid during `PFGameSaveFilesAddUserWithUiAsync`. The `XAsyncBlock` callback fires with `S_OK`, but the system enters offline mode. Use `PFGameSaveFilesIsConnectedToCloud()` to detect this state. |

For more details on offline mode behavior, see [Game Saves offline mode](./offline.md).

### Active device contention

Fires during `PFGameSaveFilesAddUserWithUiAsync` when another device is already the active device for this user. The callback receives `PFGameSaveDescriptor` structs for both the local and remote save data, which include device names, timestamps, and save sizes that you can display to help the user decide.

**Callback**: `PFGameSaveFilesUiActiveDeviceContentionCallback`

**Response API**: `PFGameSaveFilesSetUiActiveDeviceContentionResponse`

| Action | Effect |
|--------|--------|
| `Cancel` | Cancels the operation. The `XAsyncBlock` callback fires with `E_PF_GAMESAVE_USER_CANCELLED`. |
| `Retry` | Retries—useful if the user expects the other device to release soon. If the other device is still active, this callback fires again. |
| `SyncLastSavedData` | Makes the local device active and syncs. The remote device can no longer upload and receives an active device changed notification. |

For more details on active device behavior, see [Game Saves active device changes](./activedevicechanges.md).

### Conflict

Fires during `PFGameSaveFilesAddUserWithUiAsync` when local and cloud save data have diverged. The callback receives `PFGameSaveDescriptor` structs for both the local and remote save data.

**Callback**: `PFGameSaveFilesUiConflictCallback`

**Response API**: `PFGameSaveFilesSetUiConflictResponse`

| Action | Effect |
|--------|--------|
| `Cancel` | Cancels the operation. The `XAsyncBlock` callback fires with `E_PF_GAMESAVE_USER_CANCELLED`. |
| `TakeLocal` | Keeps local save data and uploads it to the cloud. |
| `TakeRemote` | Discards local changes and downloads the cloud save data. |

> [!IMPORTANT]
> Conflict resolution applies to the entire save, not individual files or folders. For details on how conflicts are detected at the atomic unit level and resolved globally, see [Game Saves conflicts](./conflicts.md).

### Out of storage

Fires during `PFGameSaveFilesAddUserWithUiAsync` when the local device doesn't have enough disk space to download save data from the cloud. The callback receives `requiredBytes` indicating how much space is needed.

**Callback**: `PFGameSaveFilesUiOutOfStorageCallback`

**Response API**: `PFGameSaveFilesSetUiOutOfStorageResponse`

| Action | Effect |
|--------|--------|
| `Cancel` | Cancels the operation. The `XAsyncBlock` callback fires with `E_PF_GAMESAVE_USER_CANCELLED`. |
| `Retry` | Retries after the user frees local storage space. If there still isn't enough space, this callback fires again. |

## Platform requirements

| Platform | UI callbacks |
|----------|-------------|
| **Xbox and Windows** | Optional. Set callbacks to override the built-in UI. |
| **Other platforms** (Steam Deck, etc.) | **Required**. No built-in UI is available; your game must handle all callbacks. |

For Steam Deck implementation details, see [Steam Deck implementation guide](./steam-deck-implementation.md).

## Related content

- [Game Saves quickstart](./quickstart.md)
- [Game Saves offline mode](./offline.md)
- [Game Saves conflicts](./conflicts.md)
- [Game Saves active device changes](./activedevicechanges.md)
