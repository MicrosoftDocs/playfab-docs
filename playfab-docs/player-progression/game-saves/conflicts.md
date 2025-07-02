---
title: Game Save conflicts
author: jasonsandlin
description: Game Save conflicts
ms.author: jasonsa
ms.date: 07/01/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

## Game Save conflicts

Save conflicts occur when the same game data has been modified on multiple devices, and the system needs to determine which version to keep.

### When Conflicts Happen
Conflicts only occur during the sync operation (`PFGameSaveFilesAddUserWithUiAsync`) when **both** conditions are true:
1. **Local changes exist**: Files have been modified locally since the last sync
2. **Cloud changes exist**: Another device has uploaded newer data since the last sync

### Conflict Resolution Approach
Some file sync systems such as OneDrive treat conflicts on a file-by-file basis – if the same file needs to be uploaded and also needs to be downloaded, then there's a conflict. In this product, each root level subfolder is considered an atomic unit when it comes to conflict detection. If any files or subfolders inside a single root level subfolder need to both download and upload, then there's a conflict. This approach better matches how games organize save data, where files within a root level subfolder are often interdependent.

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
