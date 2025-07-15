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

### Connection Modes

#### Connected to Cloud Mode
When network is available and `PFGameSaveFilesAddUserWithUiAsync()` completes successfully, the system operates in connected to cloud mode. In this mode:
- All APIs function normally with full cloud synchronization
- Save data uploads work as expected
- Storage quota information is available
- Active device monitoring works properly

#### Offline Mode (Not Connected to Cloud)
When network is unavailable or the user chooses to play offline, the system enters offline mode with limited functionality. You can check the current connection status using `PFGameSaveFilesIsConnectedToCloud()` to determine which mode the system is operating in.

### Handling Network Failures During Initial Sync

When `PFGameSaveFilesAddUserWithUiAsync()` is called without network connectivity, it triggers a `PFGameSaveFilesUiSyncFailedCallback`. Users can respond with two options:

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
- **Try Again**: Attempts the network call again (loops back to failure callback if still offline)
- **Use Offline**: `PFGameSaveFilesAddUserWithUiAsync` async callback reports `S_OK` but puts system into offline mode (can be detected with `PFGameSaveFilesIsConnectedToCloud()`)

### API Behavior in Offline Mode

When in offline mode, APIs behave differently:

#### APIs That Work Normally
- `PFGameSaveFilesGetFolder()` - Returns local save folder path

#### APIs With Limited Functionality  
- `PFGameSaveFilesUploadWithUiAsync()` - Returns `S_OK` immediately, but async completion returns `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`
- `PFGameSaveFilesGetRemainingQuota()` - Returns `E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD`
- `PFGameSaveFilesSetActiveDeviceChangedCallback()` - Can be set but will never trigger

#### Returning to Online Mode
- Call `PFGameSaveFilesAddUserWithUiAsync()` again to attempt reconnection
- No need to fully re-initialize the Game Saves system
- Will show failure UI again if network is still unavailable
- Use `PFGameSaveFilesIsConnectedToCloud()` to verify connection status after retry attempts

### Additional Connection Status Scenarios

The `PFGameSaveFilesIsConnectedToCloud()` API is particularly useful because disconnection can happen in multiple ways:

- **Network unavailable during sync**: User explicitly chooses to play offline
- **Active device changed**: Another device takes over as the active device, automatically putting this device in offline mode

Use this API before attempting cloud operations to provide appropriate user feedback.

### Best Practices for Offline Support

1. **Always implement sync failure callbacks** to handle network issues gracefully
2. **Check connection status regularly** using `PFGameSaveFilesIsConnectedToCloud()` before attempting cloud operations  
3. **Inform players** when operating in offline mode so they understand saves won't sync
4. **Provide retry options** when network connectivity is restored
5. **Local saves always work** - players can continue playing regardless of network status
6. **Monitor for disconnection** - remember that devices can be disconnected when another device becomes active

### Upload Behavior in Connected Mode

Even in connected mode, uploads can fail due to network issues. When this happens:
- Failure UI callback is triggered
- User can choose to retry or cancel
- If cancelled, async completion returns `E_PF_GAMESAVE_USER_CANCELLED`
- The game can call upload again later when network is restored
