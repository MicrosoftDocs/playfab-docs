---
title: Game Saves quickstart
author: jasonsandlin
description: Quickstart for Game Saves
ms.author: jasonsa
ms.date: 07/01/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

# Quickstart for Game Saves

PlayFab Game Saves allows players to seamlessly continue their progress across devices by syncing save data to the cloud. This quickstart guide walks you through implementing a complete game save solution for Xbox and Windows platforms.

## Prerequisites

Before you begin, ensure you have:
- Been [onboarded](./onboarding.md) to the Game Saves preview
- Reviewed the implementation requirements in the [overview](./overview.md) section
- Completed the requirements listed below

## What you'll learn

In this guide, you'll learn how to:
- Initialize the Game Saves system
- Download existing save data from the cloud
- Upload local save data to the cloud
- Handle conflicts and UI callbacks
- Manage active device scenarios

## Development Requirements

### Software Requirements
- A [PlayFab developer account](https://developer.playfab.com)
- Visual Studio 2019 or Visual Studio 2022 is recommended for Gaming Runtime development.  See https://learn.microsoft.com/en-us/gaming/gdk/docs/gdk-dev/get-started/overviews/sdk-and-tools#install-visual-studio for details.
- Access to the preview [Microsoft Game Development Kit (GDK)](https://learn.microsoft.com/gaming/gdk/) (provided after [onboarding](./onboarding.md))

> [!NOTE]
> For the public preview, Game Saves functionality is delivered through a preview version of the GDK. Access to this preview GDK will be provided with detailed setup instructions after you complete the onboarding process.

## Game Saves Flow Overview

The Game Saves system follows a simple pattern that works seamlessly across devices:

### Initial Setup (One-time per game session)
1. **Initialize Services**: Set up PlayFab Core and Game Saves modules
2. **Authenticate User**: Sign in the player using Xbox authentication
3. **Download Existing Saves**: Sync save data from other devices to the local device
4. **Get Save Location**: Obtain the local save root folder where your game should write save files

### During Gameplay
5. **Write Save Files**: Your game writes save data to the local save root folder as usual
6. **Upload Changes**: Periodically upload modified save files to the cloud
7. **Continue Playing**: Repeat steps 5-6 as needed during the game session

### Session End
8. **Final Upload**: Upload any final changes before the player quits
9. **Background Sync**: On Xbox/Windows, the system automatically handles final uploads when the game closes

### Key Benefits
- **Offline Support**: Players can start playing even without internet connection
- **Automatic Conflict Resolution**: Built-in UI handles save conflicts between devices
- **Incremental Uploads**: Only changed files are uploaded, improving performance
- **Cross-Device Continuity**: Seamless experience when switching between devices

## Implementation Details

The following sections provide detailed code examples for each step:

## Step 1: Initialize Game Saves

Game Saves is designed to work both online and offline, making it different from other PlayFab APIs. It maintains a persistent local user identity that works even when the device starts offline.

### Key Concepts
- **PFLocalUserHandle**: A persistent user identifier that works offline
- **PFServiceConfigHandle**: Configuration for your PlayFab title
- **Offline-First Design**: The system works immediately, even without internet connectivity

### Prerequisites
Before initializing Game Saves, ensure you have:
- Called `XGameRuntimeInitialize()` to initialize the Xbox runtime
- Called `XUserAddAsync()` to sign in a user and obtain an `XUserHandle`
- Your PlayFab Title ID from Game Manager

### Implementation

```cpp
// Step 1: Initialize PlayFab Core
HRESULT hr = PFInitialize(nullptr);
if (FAILED(hr))
{
    // Handle initialization failure - log error and exit gracefully
    return hr;
}

// Step 2: Create service config handle with your title information
PFServiceConfigHandle serviceConfigHandle{ nullptr };
hr = PFServiceConfigCreateHandle(
    "https://<titleId>.playfabapi.com",    // Replace <titleId> with your actual PlayFab Title ID
    "<titleId>",                           // Replace <titleId> with your actual PlayFab Title ID
    &serviceConfigHandle);
if (FAILED(hr))
{
    // Handle service config creation failure
    return hr;
}

// Step 3: Initialize the Game Saves module
PFGameSaveInitArgs args = {};
// Set args.saveFolder here if you are targetting platforms such as Steam
// where you need to provide root of where the game saves are
hr = PFGameSaveFilesInitialize(&args);
if (FAILED(hr))
{
    // Handle Game Saves initialization failure
    return hr;
}

// Step 4: Create a local user handle
// NOTE: Assumes you have already obtained 'xuserHandle' from XUserAddAsync
PFLocalUserHandle localUserHandle;
hr = PFLocalUserCreateHandleWithXboxUser(serviceConfigHandle, xuserHandle, nullptr, &localUserHandle);
if (FAILED(hr))
{
    // Handle local user creation failure
    return hr;
}

// Success! The Game Saves system is now initialized and ready to use
```

> [!IMPORTANT]
> Replace `<titleId>` with your actual PlayFab Title ID from Game Manager. The `xuserHandle` must be obtained from a successful call to `XUserAddAsync`.

### Alternative Platforms
For platforms without Xbox authentication and without offline support, use other versions of `PFLocalUserCreateHandle` or `PFLocalUserCreateHandleWithPersistedLocalId` instead. Refer to platform-specific documentation for implementation details.

For example:
```cpp
PFLocalUserHandle localUserHandle;
hr = PFLocalUserCreateHandleWithSteamUser(serviceConfigHandle, nullptr, &localUserHandle);
if (FAILED(hr))
{
    // Handle local user creation failure
    return hr;
}
```

## Step 2: Sync Save Data from Cloud

After initialization, add the user to the Game Saves system to sync any existing save data from other devices. This step also sets up the local save root folder where your game will read and write save files.

### When to Call This
- Once per game session, after user authentication
- When the user returns to the game's main menu
- After resuming from suspend/background

### What This Step Does
1. **Downloads existing saves** from other devices (only new or changed files)
2. **Preserves file timestamps** when possible for proper versioning
3. **Handles conflicts** automatically through built-in UI
4. **Sets the device as active** for this user
5. **Provides the save folder path** where your game should write files

### Important Limitations
- Can only be called **once successfully** per Game Saves session
- Requires re-initialization of the Game Saves system to call again
- Triggers UI prompts for conflicts, storage issues, and device contention

### Implementation

```cpp
// Add user to Game Saves system and sync from cloud
HRESULT hr;
XAsyncBlock async{};
hr = PFGameSaveFilesAddUserWithUiAsync(localUserHandle, PFGameSaveFilesAddUserOptions::None, &async);
if (FAILED(hr))
{
    // Handle API call failure
    return hr;
}

// Wait for the operation to complete
// For production code, consider using a callback instead of blocking
hr = XAsyncGetStatus(&async, true); 
if (FAILED(hr))
{
    // Handle async operation failure (network issues, user cancellation, etc.)
    return hr;
}

hr = PFGameSaveFilesAddUserWithUiResult(&async);
if (FAILED(hr))
{
    // Handle specific operation failures (conflicts, storage issues, etc.)
    return hr;
}

// Get the local save root folder path for your game
char saveFolder[1024] = { 0 };
hr = PFGameSaveFilesGetFolder(localUserHandle, 1024, saveFolder, nullptr);
if (FAILED(hr))
{
    // Handle folder retrieval failure
    return hr;
}

// Check remaining cloud storage quota
int64_t remainingQuota{ 0 };
hr = PFGameSaveFilesGetRemainingQuota(localUserHandle, &remainingQuota);
if (FAILED(hr))
{
    // Handle quota retrieval failure
    return hr;
}

// Success! You can now read/write save files in the saveFolder directory
printf("Save folder: %s\n", saveFolder);
printf("Remaining quota: %lld bytes\n", remainingQuota);
```

### Next Steps
After this call completes successfully:
- Your game can read existing save files from the `saveFolder` directory
- Write new save files and create subdirectories as needed
- The device is now considered "active" for this user
- Other devices will show a warning if the user tries to sync there

## Step 3: Upload Save Data to Cloud

Once your game has written save files and subfolders to the local save root folder, use this step to upload changes to the cloud. The system automatically detects and uploads only files and subfolders that have changed since the last upload. File and folder deletions are also automatically synchronized to the cloud.

### Suggested points when to upload
- **After significant progress**: When the player reaches a checkpoint or completes a level
- **Before menu transitions**: When returning to the main menu or switching game modes  
- **On game exit**: Before the player quits the game
- **Periodic saves**: Every few minutes during extended gameplay sessions

### Upload Options
- **`KeepDeviceActive`**: Device remains active, allowing additional uploads later
- **`ReleaseDeviceAsActive`**: Releases device as active, allowing seamless sync on other devices

### Platform Behavior
- **Xbox/Windows**: Upload continues in background after game closes
- **Other platforms** (Steam Deck, etc.): Upload must complete before game exit, or save data won't reach the cloud

### Implementation

```cpp
// Upload save files to cloud
XAsyncBlock async{};
HRESULT hr = PFGameSaveFilesUploadWithUiAsync(
    localUserHandle, 
    PFGameSaveFilesUploadOption::KeepDeviceActive,  // Use ReleaseDeviceAsActive when quitting
    &async);
if (FAILED(hr))
{
    // Handle API call failure
    return hr;
}

// Wait for upload to complete
// Consider using callbacks for better user experience
hr = XAsyncGetStatus(&async, true); 
if (FAILED(hr))
{
    // Handle async operation failure (network issues, storage full, etc.)
    return hr;
}

hr = PFGameSaveFilesUploadWithUiResult(&async);
if (FAILED(hr))
{
    // Handle upload failure
    return hr;
}

// Success! Save data is now safely stored in the cloud
```

### Best Practices
1. **Handle failures gracefully**: Network issues shouldn't crash your game
2. **Use appropriate options**: 
   - Use `KeepDeviceActive` during gameplay for additional uploads
   - Use `ReleaseDeviceAsActive` when the player is quitting or returning to menu
3. **Warn users on non-Xbox platforms**: Let players know not to quit during upload

### Frequency Considerations
- Multiple uploads per session are supported and efficient
- Only changed files are uploaded, minimizing bandwidth usage
- See the [Limits documentation](./limits.md) for specific quotas and restrictions

## Step 4: Handle UI Callbacks (Optional)

Game Saves provides built-in UI for Xbox and Windows platforms, but you can customize the user experience by implementing your own UI callbacks.

### Platform Requirements
- **Xbox/Windows**: Built-in UI is provided; custom callbacks are optional
- **Other platforms** (Steam Deck, etc.): Custom UI callbacks are **required**

### Types of UI Callbacks
- **Progress**: Show upload/download progress to users
- **Conflicts**: Handle situations where local and cloud saves differ
- **Active Device Contention**: Warn when user tries to sync on multiple devices
- **Sync Failures**: Handle network or other sync errors
- **Out of Storage**: Notify users when local storage is too full to sync

### When Callbacks Trigger
UI callbacks only occur during two operations:
- `PFGameSaveFilesAddUserWithUiAsync` (download from cloud)
- `PFGameSaveFilesUploadWithUiAsync` (upload to cloud)

### Implementation

```cpp
// Set up custom UI callbacks (call this before AddUser or Upload operations)
// See sample for detailed examples of these callbacks.
hr = PFGameSaveFilesSetUiCallbacks( 
    MyPFGameSaveFilesUiProgressCallback, nullptr,
    MyPFGameSaveFilesUiSyncFailedCallback, nullptr,
    MyPFGameSaveFilesUiActiveDeviceContentionCallback, nullptr,
    MyPFGameSaveFilesUiConflictCallback, nullptr,
    MyPFGameSaveFilesUiOutOfStorageCallback, nullptr);
```

### Response APIs
Each callback has a corresponding response API:
- `PFGameSaveFilesSetUiProgressResponse()` - Respond to progress callback, letting users cancel
- `PFGameSaveFilesSetUiConflictResponse()` - Respond to conflict callbacks
- `PFGameSaveFilesSetUiActiveDeviceContentionResponse()` - Respond to device contention
- `PFGameSaveFilesSetUiSyncFailedResponse()` - Respond to sync failures  
- `PFGameSaveFilesSetUiOutOfStorageResponse()` - Respond to local storage full issues

> [!IMPORTANT]
> The Game Saves system waits for your response before continuing. Always call the appropriate response API when handling callbacks (except progress callbacks which don't need a response).

## Understanding Save Conflicts

Save conflicts occur when the same game data has been modified on multiple devices. Game Saves treats each root-level subfolder as an atomic unit for conflict resolution, and players can choose to keep either local or cloud data when conflicts arise.

For detailed conflict handling scenarios and best practices, see [Game Saves conflicts](./conflicts.md).

## Understanding Game Saves Offline Mode

Game Saves works both online and offline. When connected to the cloud, all APIs function normally. When offline or disconnected, local saves continue to work but cloud operations return `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`.

Use `PFGameSaveFilesIsConnectedToCloud()` to check connection status and implement sync failure callbacks to handle network issues gracefully.

For detailed offline behavior and best practices, see [Game Saves offline mode](./offline.md).

## Understanding Game Saves Active Device Changes

When a player switches devices mid-session, it's important to prevent them from accidentally losing progress by playing on multiple devices simultaneously.

If your game only signs in using Xbox's **Single Point of Presence (SPOP)** feature, this scenario is automatically prevented. SPOP ensures a user can only be signed in on one Xbox device at a time.  Otherwise you should also implement the active device changed callback to handle scenarios where a player switches devices mid-session 

For detailed behavior and best practices, see [Game Saves active device changes](./activedevicechanges.md).

## Debugging 

The easiest way to see the results and debug any calls in the SDK is to enable [Debug Tracing](https://learn.microsoft.com/gaming/playfab/sdks/c/tracing). Enabling debug tracing allows you to both see the results in the debugger output window and hook the results into your game's own logs.
