---
title: Game Saves quickstart
author: jasonsandlin
description: Quickstart for Game Saves
ms.author: jasonsa
ms.date: 06/24/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

# Quickstart for Game Saves
Before using this quickstart guide, you must be [onboarded](./onboarding.md) to the Game Saves preview. Also, review the implementation requirements in the [overview](./overview.md) section. This guide will then take you through an example flow for a typical game.

## Requirements
- A [PlayFab developer account](https://developer.playfab.com)
- [Visual Studio 2022](https://visualstudio.microsoft.com/) installed
- For public preview, we are delivering Game Saves for all supported platforms through a preview of the [Microsoft Game Development Kit (GDK)](https://learn.microsoft.com/gaming/gdk/). Once you are [onboarded](./onboarding.md), we will provide access to the preview GDK with further instructions.

## High Level Flow

Here is an example of how to sync game saves on Xbox or Windows devices:

1. Launch previously unplayed game.
1. Game signs into Xbox and gets an XUser handle using `XUserAddAsync`.
1. Game initializes PlayFab Core and creates a PFServiceConfigHandle using the PlayFab endpoint (titleId.playfabapi.com) from PlayFab's Game Manager.
1. Game signs into PlayFab using `PFLocalUserCreateHandleWithXboxUser` with XUserHandle to create a PFLocalUserHandle.
1. Game initializes PFGameSave module with `PFGameSaveFilesInitialize`.
1. Game adds user to PFGameSave module with `PFGameSaveFilesAddUserWithUiAsync` passing in the PFLocalUserHandle, which triggers UI as needed.
1. After the call completes, the game can get the save root folder for the game to write save data to with `PFGameSaveFilesGetFolder`.
1. User plays the game and the game writes save files to the local save root folder, creating subfolders as desired.
1. The game calls `PFGameSaveFilesUploadWithUiAsync` to upload the game save to the cloud. It automatically uploads any files and subfolders that have changed since the last upload contained in the local save root folder.
1. The prior two steps continue to loop until the user either suspends or quits the game. The game can call `PFGameSaveFilesUploadWithUiAsync` as many times as desired within reason (see [Limits](./limits.md) for details) as it will only upload files and subfolders that have changed since the last upload.
1. After the user suspends or quits the game, the "out of process" Gaming Service will upload automatically when it detects the game isn't running and mark the device as no longer active in the Game Save service.

## Initialize

Like XGameSaveFiles but unlike other PlayFab APIs, PFGameSave needs to work offline (including when first launched while offline) and seamlessly operate when the user launches online later. It achieves this with persisted local ID of the user. When using Xbox sign-in, the API that does this is `PFLocalUserCreateHandleWithXboxUser`. This API returns a PFLocalUserHandle given an XUserHandle. There are other forms of `PFLocalUserCreateHandle` for other platforms. The PFLocalUserHandle is used throughout the rest of the PFGameSave API.

When using XUser, which supports offline, this persisted local ID is handled automatically without extra effort by the game developer. When on a platform that doesn't have offline user material, you can use `PFLocalUserCreateHandleWithPersistedLocalId` and refer to the platform-specific documentation for example code.

Here is an example of how to initialize the PlayFab Core module and PFGameSave module:

```cpp
// Initialize PlayFab Core
HRESULT hr = PFInitialize(nullptr);
if (FAILED(hr))
{
    // Handle initialization failure
    return hr;
}

// Create service config handle
PFServiceConfigHandle serviceConfigHandle{ nullptr };
hr = PFServiceConfigCreateHandle(
    "https://<titleId>.playfabapi.com",    // Replace with your title's PlayFab endpoint
    "<titleId>",                           // Replace with your title's PlayFab title ID
    &serviceConfigHandle);
if (FAILED(hr))
{
    // Handle service config creation failure
    return hr;
}

// Initialize PFGameSave
PFGameSaveInitArgs args = {};     
hr = PFGameSaveFilesInitialize(&args);
if (FAILED(hr))
{
    // Handle initialization failure
    return hr;
}

// Create local user handle from platform user (e.g., XUserHandle)
PFLocalUserHandle localUserHandle;
hr = PFLocalUserCreateHandleWithXboxUser(serviceConfigHandle, xuserHandle, nullptr, &localUserHandle);
if (FAILED(hr))
{
    // Handle local user creation failure
    return hr;
}
```

### Download

To download game save files from the cloud, the game adds a user to the PFGameSave system via the `PFGameSaveFilesAddUserWithUiAsync` API call. This API call syncs all files and subfolders that were previously uploaded to the cloud on another device. Only new or changed cloud files & subfolders are downloaded. The files downloaded retain the original time created and time modified timestamps when possible via platform APIs. The `PFGameSaveFilesAddUserWithUiAsync` API can only be called once successfully without re-initialization of the PFGameSave system (e.g., when the user returns to the game's title menu, the game resumes from PLM, etc).  

The `PFGameSaveFilesAddUserWithUiAsync` call will trigger any UI required as needed. The majority of the UI interactions are front-loaded to this initial step, namely: conflict, active device contention, out of storage, progress, and sync failure. Note that UI will only be triggered during this API call and during `PFGameSaveFilesUploadWithUiAsync` (discussed later). 

When the `PFGameSaveFilesAddUserWithUiAsync` call completes:
1) The game can get the game save root folder where the game save's files and nested subfolders can be found using `PFGameSaveFilesGetFolder`. 
1) The game can also call `PFGameSaveFilesGetRemainingQuota` to know the remaining amount of cloud storage data left for that user on this game.
1) The current device is considered the active PFGameSave device for this user. While this device is active, if the user tries to sync on another device, then an "active device contention" UI prompt will trigger. 

```cpp
HRESULT hr;
XAsyncBlock async{};
hr = PFGameSaveFilesAddUserWithUiAsync(localUserHandle, PFGameSaveFilesAddUserOptions::None, &async);
if (FAILED(hr))
{
    // Handle API call failure
    return hr;
}

// This is doing a blocking wait for completion. You can instead use the XAsyncBlock to set a callback instead for async style usage
hr = XAsyncGetStatus(&async, true); 
if (FAILED(hr))
{
    // Handle async operation failure
    return hr;
}

hr = PFGameSaveFilesAddUserWithUiResult(&async);
if (FAILED(hr))
{
    // Handle result retrieval failure
    return hr;
}

// Get save folder for user
char saveFolder[1024] = { 0 };
hr = PFGameSaveFilesGetFolder(localUserHandle, 1024, saveFolder, nullptr);
if (FAILED(hr))
{
    // Handle folder retrieval failure
    return hr;
}

int64_t remainingQuota{ 0 };
hr = PFGameSaveFilesGetRemainingQuota(localUserHandle, &remainingQuota);
if (FAILED(hr))
{
    // Handle quota retrieval failure
    return hr;
}
```

### Upload
To upload game save files to the cloud, the game calls `PFGameSaveFilesUploadWithUiAsync`. All files and subfolders inside the game save root folder will be uploaded to the cloud. Files that did not change will not be re-uploaded.

This API will trigger UI as needed, namely: progress and upload failure. UI will only be triggered during this API and during `PFGameSaveFilesAddUserWithUiAsync`.

If the `KeepDeviceActive` option is passed, then the device remains active and the game can make additional calls to `PFGameSaveFilesUploadWithUiAsync` later as desired. If the user is going to the main menu or quitting via menu action, the game can choose to pass the `ReleaseDeviceAsActive` option which removes this device as active from the service – allowing the user to sync on another device without the "active device contention" warning being shown to the user when they try to sync on another device.

On Xbox and Windows platforms, the upload is done outside the game process and doesn't require the game to be running. On platforms other than Windows and Xbox (such as Steam Deck), the upload must complete prior to the user quitting or suspending the game or the game save will not reach the cloud. If the upload is halted midway through, no harm will occur, but other devices will continue to see the previous cloud state. The device will remain active and if the user goes to another device, the user will be warned that they are active on another device. It is best practice for the game to warn the user not to exit before upload finishes on these platforms. 

Here is an example of how to upload game save files:

```cpp
XAsyncBlock async{};
HRESULT hr = PFGameSaveFilesUploadWithUiAsync(localUserHandle, PFGameSaveFilesUploadOption::KeepDeviceActive, &async);
if (FAILED(hr))
{
    // Handle API call failure
    return hr;
}

// This is doing a blocking wait for completion. You can instead use the XAsyncBlock to set a callback instead for async style usage
hr = XAsyncGetStatus(&async, true); 
if (FAILED(hr))
{
    // Handle async operation failure
    return hr;
}

hr = PFGameSaveFilesUploadWithUiResult(&async);
if (FAILED(hr))
{
    // Handle result retrieval failure
    return hr;
}
```

### UI Callbacks

On Xbox and Windows platforms, stock UI is provided. The game can optionally set the UI callbacks for the PFGameSave sync engine using `PFGameSaveFilesSetUiCallbacks`. These UI callbacks will trigger during `PFGameSaveFilesAddUserWithUiAsync` or `PFGameSaveFilesUploadWithUiAsync`. On platforms other than Windows and Xbox (such as Steam Deck), setting these UI callbacks is required and the game should render UI in response. 

During these callbacks, the game can render UI to the user as desired.  For all UI other than the progress UI, the PFGameSave sync engine waits for a response before continuing.  When the user makes a decision, the game can call the appropriate PFGameSave API to continue the flow such as `PFGameSaveFilesSetUiConflictResponse`.  Each callback has a corresponding API to set the user response.  

### Conflicts

Conflicts only happen during the download API, `PFGameSaveFilesAddUserWithUiAsync`, and only when it internally detects that these two conditions exist at the same time: 
1) A file or files have locally changed since the last sync, meaning they need to be uploaded to the cloud eventually.
1) A different device has uploaded newer data to the cloud since the last sync, meaning it needs to be downloaded from the cloud.

Since PFGameSave detects it needs to both upload and download the data, this means there's a conflict. PFGameSave won't merge the data and doesn't know which state is better, so it asks the user to make a choice in the conflict UI: either use the local data as is (overwriting the cloud data upon upload) or sync to the cloud data (overwriting the local data on download).

Some cloud syncers such as OneDrive treat conflicts on a file-by-file basis – if the same file needs to be uploaded and also needs to be downloaded, then there's a conflict. In this product, each root level subfolder is considered an atomic unit. If any files or subfolders inside a single root level subfolder need to both download and upload, then there's a conflict. We believe this maps best to how games typically handle save game folder hierarchies since there are often interdependent files inside root level subfolders.

## Debugging

The easiest way to see the results and debug any calls in the SDK is to enable [Debug Tracing](https://learn.microsoft.com/gaming/playfab/sdks/c/tracing). Enabling debug tracing allows you to both see the results in the debugger output window and hook the results into your game's own logs.

## MORE TO COME

