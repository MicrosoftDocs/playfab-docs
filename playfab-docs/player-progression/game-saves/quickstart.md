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
- [Visual Studio 2022](https://visualstudio.microsoft.com/) or later
- Access to the preview [Microsoft Game Development Kit (GDK)](https://learn.microsoft.com/gaming/gdk/) (provided after [onboarding](./onboarding.md))

### Supported Platforms
Game Saves is currently available for:
- Xbox consoles (Xbox One, Xbox Series X|S)
- Windows 10/11 devices
- Steam Deck (with additional implementation requirements)

> [!NOTE]
> For the public preview, Game Saves functionality is delivered through a preview version of the GDK. Access to this preview GDK will be provided with detailed setup instructions after you complete the onboarding process.

## Game Save Flow Overview

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
For platforms without Xbox authentication and without offline suport, use other versions of `PFLocalUserCreateHandle` or `PFLocalUserCreateHandleWithPersistedLocalId` instead. Refer to platform-specific documentation for implementation details.

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

Once your game has written save files and subfolders to the local save root folder, use this step to upload changes to the cloud. The system automatically detects and uploads only files and subfolders that have changed since the last upload.

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
    MyProgressCallback,                    // Show progress during uploads/downloads
    contextPtr,                           // Optional context object for your callbacks
    MySyncFailedCallback,                 // Handle sync failures
    contextPtr,
    MyActiveDeviceContentionCallback,     // Handle device conflicts  
    contextPtr,
    MyConflictCallback,                   // Handle save data conflicts
    contextPtr,
    MyOutOfStorageCallback,               // Handle storage quota exceeded
    contextPtr);
```

### Response APIs
Each callback has a corresponding response API:
- `PFGameSaveFilesSetUiProgressResponse()` - Respond to porgres callback, letting users cancel
- `PFGameSaveFilesSetUiConflictResponse()` - Respond to conflict callbacks
- `PFGameSaveFilesSetUiActiveDeviceContentionResponse()` - Respond to device contention
- `PFGameSaveFilesSetUiSyncFailedResponse()` - Respond to sync failures  
- `PFGameSaveFilesSetUiOutOfStorageResponse()` - Respond to local storage full issues

> [!IMPORTANT]
> The Game Saves system waits for your response before continuing. Always call the appropriate response API when handling callbacks (except progress callbacks which don't need a response).

## Understanding Save Conflicts

Save conflicts occur when the same game data has been modified on multiple devices, and the system needs to determine which version to keep.

### When Conflicts Happen
Conflicts only occur during the sync operation (`PFGameSaveFilesAddUserWithUiAsync`) when **both** conditions are true:
1. **Local changes exist**: Files have been modified locally since the last sync
2. **Cloud changes exist**: Another device has uploaded newer data since the last sync

### Conflict Resolution Approach
Some file sync systems such as OneDrive treat conflicts on a file-by-file basis – if the same file needs to be uploaded and also needs to be downloaded, then there's a conflict. In this product, each root level subfolder is considered an atomic unit when it comes to conflict dectection. If any files or subfolders inside a single root level subfolder need to both download and upload, then there's a conflict. This approach better matches how games organize save data, where files within a root level subfolder are often interdependent.

### User Choice Options
When conflicts occur, players choose between:
- **Use Local Data**: Keep the device's current save data (overwrites cloud data on next upload)
- **Use Cloud Data**: Download and use the cloud save data (overwrites local data)

### Best Practices
- **Design folder structure carefully**: Group related save files into logical folders
- **Minimize conflicts**: Upload frequently to reduce the chance of conflicts
- **Clear conflict UI**: Help players understand what data they might lose with each choice

## Handling Active Device Changes

When a player switches devices mid-session, it's important to prevent them from accidentally losing progress by playing on multiple devices simultaneously.

### The Problem Scenario
1. **Player starts on Device A**: Begins playing and becomes the "active" device
2. **Player switches to Device B**: Logs in and chooses "Sync Last Saved Data"
3. **Device B becomes active**: Device A is no longer the active device, but may not know this
4. **Risk of lost progress**: Player could continue playing on Device A, creating conflicting save states

### The Solution: Active Device Callbacks
Listen for active device changes and gracefully handle the transition:

```cpp
// Set up the active device changed callback during initialization
hr = PFGameSaveFilesSetActiveDeviceChangedCallback(
    optionalTaskQueue,                    // Use nullptr for immediate callback
    MyActiveDeviceChangedCallback,        // Your callback function
    contextPtr);                          // Optional context for your callback
```

### Callback Implementation Example

```cpp
void MyActiveDeviceChangedCallback(void* context)
{
    // The current device is no longer active for Game Saves
    
    // 1. Pause the game immediately
    
    // 2. Inform the player what happened
    // with a message such as:
    // "Your game progress is being continued on another device."
    // "Returning to main menu to prevent data loss."
    
    // 3. Return to a safe state (main menu)
    
    // 4. Re-initialize Game Saves system when ready to play again
    // (The player will need to sync again from the main menu)
}
```

### Xbox-Specific Exception
If your game only runs on Xbox consoles and uses Xbox's **Single Point of Presence (SPOP)** feature, this scenario is automatically prevented. SPOP ensures a user can only be signed in on one Xbox device at a time.

### Best Practices
- **Always implement this callback** for multi-platform games
- **Pause gameplay immediately** when the callback triggers
- **Clearly explain to players** why they're being returned to the menu
- **Make re-entry easy** by returning to main menu rather than closing the game

## Understanding Game Save offline mode

TBD

## Debugging 

The easiest way to see the results and debug any calls in the SDK is to enable [Debug Tracing](https://learn.microsoft.com/gaming/playfab/sdks/c/tracing). Enabling debug tracing allows you to both see the results in the debugger output window and hook the results into your game's own logs.
