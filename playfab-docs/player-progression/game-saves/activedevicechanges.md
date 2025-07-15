---
title: Game Saves Active Device Changes
author: jasonsandlin
description: Game Saves Active Device Changes
ms.author: jasonsa
ms.date: 07/01/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

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
If your game only signs in using Xbox's **Single Point of Presence (SPOP)** feature, this scenario is automatically prevented. SPOP ensures a user can only be signed in on one Xbox device at a time.

### Best Practices
- **Always implement this callback** for multi-platform games
- **Pause gameplay immediately** when the callback triggers
- **Clearly explain to players** why they're being returned to the menu
- **Make re-entry easy** by returning to main menu rather than closing the game
