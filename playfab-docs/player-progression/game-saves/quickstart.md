# Quickstart for Game Saves
Before using this qiuckstart guide, you must be onboarded to the Game Saves preview. Once you have been onboarded, this guide will take you through an example flow for a typical game, showing options for using both in-process (with Xbox) and out-of-process (with Steam) upload as well as options for using title callable UI (provided by Xbox) and custom game UI.

## Requirements
- A [PlayFab developer account](https://developer.playfab.com)
- [Visual Studio 2022](https://visualstudio.microsoft.com/) installed (to build from source)
- For public preview, we are delivering Game Saves only through the [Microsoft Game Development Kit (GDK)](https://learn.microsoft.com/gaming/gdk/). A preview of the GDK is required. Once you are [onboarded for preview](./onboarding.md), we will provide access to the preivew with further instructions.

**++Quickstart needs to be updated ++**

## High level flow

Example of how to sync game saves between Windows based devices (eg Xbox console, PC) 

1. Launch previously unplayed game
1. Game gets an XUser handle via XUserAddAsync() 
1. Game inits PlayFab Core with PlayFab endpoint (titleId.playfabapi.com) from PlayFab's Game Manager 
1. Game signs into PlayFab using PlayFab Core's PFLocalUserCreateHandle() with XUserHandle to create a PFLocalUserHandle     
1. Game inits PlayFab Game Save module with PFGameSaveFilesInitialize()
1. Game adds user to PlayFab Game Save module with PFGameSaveFilesGetFolderWithUiAsync() passing in the PFLocalUserHandle, which triggers UI, as needed
1. After the call completes, the game can get folder for the game to write save data to with PFGameSaveFilesGetFolder(). 
1. User plays the game & the game saves game state to the folder, creating subfolders as desired
1. The user suspends/quits the game
1. The "out of process" XGameRuntime will upload automatically when it detects the game isn't running

## Init

Like XGameSaveFiles but unlike other PlayFab APIs, PFGameSave needs to work offline (including when first launched while offline) and seamlessly operate when launched online later. It achieves this by the game providing a persisted local id of the user and a login callback which is invoked to get a PFEntityHandle when online. The API that does this is PFLocalUserCreateHandle().  This API returns a PFLocalUserHandle given a platform user such as XUserHandle. The PFLocalUserHandle is used throughout the rest of the PFGameSave API.

When using XUser, which supports offline, this persisted local ID is handled automatically as shown in 2.1.1 without extra effort by the game dev.  When on a platform that doesn’t have offline user material, then see appendix 5.1.1 for example code.

```
PFGameSaveInitArgs args = {};     
hr = PFGameSaveFilesInitialize(&args);

PFServiceConfigHandle serviceConfigHandle{ nullptr };
hr = PFServiceConfigCreateHandle(
    "https://E18D7.playfabapi.com",   
    "E18D7",
    &serviceConfigHandle);

PFLocalUserHandle localUserHandle;
PFLocalUserPlatformContext platformContext{ xuserHandle };    
hr = PFLocalUserCreateHandle(serviceConfigHandle, &platformContext, nullptr, &localUserHandle);
```

### Download

To download game save files from the cloud, the game adds a user to the PFGameSave system via the PFGameSaveFilesAddUserWithUiAsync API call.  It syncs all files and subfolders that were previously uploaded to the cloud. Only new or changed cloud files & folders are downloaded. The files downloaded have the original time created and time modified timestamps when made possible via platform APIs.

This API call will also trigger any UI required as needed. The majority of the UI interactions are front loaded to this initial step. Namely: conflict, active device contention, out of storage, progress, sync failure. UI / UI callbacks will only be triggered during this API and during PFGameSaveFilesUploadWithUiAsync (discussed later). 

After this API call completes, the game can get the game save folder where the game save’s files and nested subfolders can be found. The game can also call PFGameSaveFilesGetRemainingQuota to know the remaining amount of cloud storage data left for that user on this title.

After this API call completes, the current device is considered the active PFGameSave device for this user.  While this device is active, if the user tries to sync on another device then an “active device contention” UI callback will trigger. The PFGameSaveFiles AddUserWithUiAsync API can only be called once successfully without re-initialization of the PFGameSave system (e.g. when the user returns to the game’s title menu, title resumes from PLM, etc).  

A future option still being designed is that the game has the option to request a rollback which causes it to not sync to the latest set of cloud data but the previous. This is an advanced scenario but might be useful for games that wish to provide a failsafe in case the user needs to recover from a bad situation (eg the save game data gets corrupted, or the user makes a wrong choice during the conflict dialog).  The basic idea would be the user notices the game save isn’t what they want and clicks an rollback button in some advanced game menu which in turn re-initializes PFGameSave and calls AddUserWithUI with this rollback flag which internally fetches an older finalized game save state.  

```
HRESULT hr;
XAsyncBlock async{};
hr = PFGameSaveFilesAddUserWithUiAsync(localUserHandle, PFGameSaveFilesAddUserOptions::None, &async);

hr = XAsyncGetStatus(&async, true); // This is doing a blocking wait for completion, but you can use the XAsyncBlock to set a callback instead for async style usage
hr = PFGameSaveFilesAddUserWithUiResult(&async);

// Get save folder for user
char saveFolder[1024] = { 0 };
hr = PFGameSaveFilesGetFolder(localUserHandle, 1024, saveFolder, nullptr);

int64_t remainingQuota{ 0 };
hr = PFGameSaveFilesGetRemainingQuota(localUserHandle, &remainingQuota);
```

### Upload
To upload game save files to the cloud, the game calls PFGameSaveFilesUploadWithUiAsync().  All files and subfolders inside the game save folder will be uploaded to the cloud.  Files that did not change will not be re-uploaded.     

This API will trigger a few UI callbacks as needed. Namely: progress, and upload failure.  UI / UI callbacks will only be triggered during this API and during PFGameSaveFilesAddUserWithUiAsync.

If KeepDeviceActive option is passed then the device remains active and the game can make additional calls to PFGameSaveFilesUploadWithUiAsync later as desired.  If the user is going to the main menu or quitting via menu action, the game can choose to pass ReleaseDeviceAsActive option which removes this device as active from the service – allowing the user to sync on another device without the “active device contention” warning being shown to the user.

On Xbox and Windows platforms, the upload is completed outside the game process and doesn’t require the game to be running.  On non-Windows platforms, the upload must complete prior to the user quitting or suspending the title.  If its halted midway through an upload, no harm will occur but other devices will continue to see previous cloud state.  The device will remain active and can make another call to the upload API as desired.     

```
XAsyncBlock async{};
HRESULT hr = PFGameSaveFilesUploadWithUiAsync(g_gameState.localUserHandle, PFGameSaveFilesUploadOption::KeepDeviceActive, &async);
hr = XAsyncGetStatus(&async, true); // This is doing a blocking wait for completion, but you can use the XAsyncBlock to set a callback instead for async style usage
hr = PFGameSaveFilesUploadWithUiResult(&async);
```

### UI Callbacks
Sets the UI callbacks for PF game save sync engine.  These UI callbacks will trigger during PFGameSaveFilesAddUserWithUiAsync() or PFGameSaveFilesUploadWithUiAsync().

On non-Windows platforms, setting these callbacks is required and the game should render UI dialogs in response. Stock UI may be provided for Unreal Engine and Unity plugins for non-Windows platforms after the first release.   

Stock UI is also provided by the Windows/Xbox platform however the title can set these callbacks to render custom UI dialogs as desired.
  
Conflicts happen during the download API, PFGameSaveFilesAddUserWithUiAsync(), it internally detects that at the same time these two conditions: a) the data has locally changed since last sync and b) when another device has uploaded newer data to the cloud. It won’t merge the data and doesn’t know which state is better, so it asks the user to make a choice in the conflict UI: either use the local as is (overwriting the cloud data upon upload) or sync to the cloud data (overwriting the local data on download).   

Some cloud syncers such as OneDrive treat conflicts on a file by file basis – if the same file needs to be uploaded and also needs to download then there’s a conflict.  In this product, each root level subfolder is considered an atomic unit.  If any files or folders inside a single root level subfolder needs to both download and upload then there’s a conflict.  We believe this maps best to how games typically handle save game folder hierarchies since there’s often interdependent files inside root level subfolders.  

```
hr = PFGameSaveFilesSetUiCallbacks( 
    MyPFGameSaveFilesUiProgressCallback, contextPtr,
    MyPFGameSaveFilesUiSyncFailedCallback, contextPtr,
    MyPFGameSaveFilesUiActiveDeviceContentionCallback, contextPtr,
    MyPFGameSaveFilesUiConflictCallback, contextPtr,
    MyPFGameSaveFilesUiOutOfStorageCallback, contextPtr);

void MyPFGameSaveFilesUiProgressCallback(PFLocalUserHandle localUserHandle, PFGameSaveFilesSyncState syncState, void* context)
{
    if (syncState == PFGameSaveFilesSyncState::Downloading)
    {
        std::cout << "Downloading game save data..." << std::endl;
        std::cout << "[Cancel]" << std::endl;
    }
    else
    {
        std::cout << "Uploading game save data..." << std::endl;
        std::cout << "[Cancel]" << std::endl;   
    }
    // repeatedly call PFGameSaveFilesUiProgressGetProgress(localUserHandle, &state, &current, &total) and show an animated progress bar/etc

    // if user chooses [Cancel], call PFGameSaveFilesSetUIProgressResponse(localUserHandle, PFGameSaveFilesUIProgressUserAction::Cancel)

    // These API calls can happen inside or outside of this callback
}

void MyPFGameSaveFilesUiSyncFailedCallback(
    PFLocalUserHandle localUserHandle, 
    PFGameSaveFilesSyncState syncState,
    HRESULT error,
    void* context)
{
    // Tell the user something like this:
    std::cout << "We couldn't sync your data with the cloud just now" << std::endl;
    std::cout << "Try syncing again or use this game or app offline [error]" << std::endl;
    std::cout << "[Try Again]" << std::endl;
    std::cout << "[Use Offline]" << std::endl;

    // if user chooses [Try Again], call PFGameSaveFilesSetUiSyncFailedResponse(localUserHandle, PFGameSaveFilesUiSyncFailedUserAction::Retry);
    // if user chooses [Use Offline], call PFGameSaveFilesSetUiSyncFailedResponse(localUserHandle, PFGameSaveFilesUiSyncFailedUserAction::UseOffline);

    // These API calls can happen inside or outside of this callback
}

void MyPFGameSaveFilesUiActiveDeviceContentionCallback(
    PFLocalUserHandle localUserHandle,
    time_t localTime, 
    time_t remoteTime,
    void* context)
{
    // Tell the user something like this:
    std::cout << "Your other device is taking a long time to sync to the cloud" << std::endl;
    std::cout << "Do you want to sync the last saved data we have in the cloud?" << std::endl;
    std::cout << "This will cancel your other sync.  To have us check if the other device has finished syncing, choose:" << std::endl;

    // if the users chooses [Retry], call 
    // PFGameSaveFilesSetUiActiveDeviceContentionResponse(localUserHandle, PFGameSaveFilesUiActiveDeviceContentionUserAction::Retry);

    // if the users chooses [Sync Last Saved Data], call 
    // PFGameSaveFilesSetUiActiveDeviceContentionResponse(localUserHandle, PFGameSaveFilesUiActiveDeviceContentionUserAction::SyncLastSavedData);

    // if the users chooses [Cancel], call 
    // PFGameSaveFilesSetUiActiveDeviceContentionResponse(localUserHandle, PFGameSaveFilesUiActiveDeviceContentionUserAction::Cancel);

    // These API calls can happen inside or outside of this callback
}

void MyPFGameSaveFilesUiConflictCallback(
    PFLocalUserHandle localUserHandle,
    time_t localModifiedTime, 
    time_t remoteModifiedTime,
    uint64_t localSize, 
    uint64_t remoteSize,
    void* context)
{
    // Tell the user something like this:
    std::cout << "Which one do you want to use?" << std::endl;
    std::cout << "The save data we have on the Xbox[?] network for [YOUR TITLE NAME] is different than the data on this device." << std::endl;
    std::cout << "[This device <insert localModifiedTime> with [localSize] bytes]" << std::endl;
    std::cout << "[The cloud data has <insert remoteModifiedTime> with [remoteSize] bytes]" << std::endl;
    std::cout << "[Cancel]" << std::endl;

    // if the users chooses [This device], call PFGameSaveFilesSetUiConflictResponse(localUserHandle, PFGameSaveFilesUiConflictUserAction::TakeLocal);
    // if the users chooses [Cloud data], call PFGameSaveFilesSetUiConflictResponse(localUserHandle, PFGameSaveFilesUiConflictUserAction::TakeRemote);
    // if the users chooses [Cancel], call PFGameSaveFilesSetUiConflictResponse(localUserHandle, PFGameSaveFilesUiConflictUserAction::Cancel);

    // These API calls can happen inside or outside of this callback
}

void MyPFGameSaveFilesUiOutOfStorageCallback(
    PFLocalUserHandle localUserHandle, 
    uint64_t requiredBytes, 
    void* context)
{
    // Tell the user something like this:
    std::cout << "You are out of space on this device." << std::endl;
    std::cout << "You need on [requiredBytes] bytes free." << std::endl;
    std::cout << "[Try again]" << std::endl;
    std::cout << "[Cancel]" << std::endl;

    // if user chooses [Try Again], call PFGameSaveFilesSetUiOutOfStorageResponse(localUserHandle, PFGameSaveFilesUiOutOfStorageUserAction::Retry);
    // if user chooses [Cancel], call PFGameSaveFilesSetUiOutOfStorageResponse(localUserHandle, PFGameSaveFilesUiOutOfStorageUserAction::Cancel);

    // These API calls can happen inside or outside of this callback
}
```

### Active Device Changed
While the current device is running, the user might login on device 2 and after seeing the “active device contention” UI dialog, they might choose “Sync Last Saved Data” which changes device 2 to be the active device.  

Without extra steps device 1 would not be wise to this, and would allow the user to continue making progress on device 1. In this scenario the user would be active on both device 1 and device 2 and could make progress on either or both. Once both upload, only one of those states will be last and when the user syncs next time it will sync to this last uploaded state and this might not be what the user expects. It’s important to avoid the user being in this situation and suffering lost progression as it could result in the user losing many hours of game time.    

To deal with this, games should listen to the active device changed callback, notify the user, and jump back to the game’s title menu.

If your game only operates on Windows/Xbox devices using Xbox’s title SPOP (Single Point of Presence), then this is not of concern since title SPOP will naturally prevent this situation.   

```
void MyPFGameSaveFilesActiveDeviceChangedCallback(
    PFLocalUserHandle localUserHandle,
    PFActiveDevice * activeDevice,
    void* context)
{
    // handle active device changing
}

hr = PFGameSaveFilesSetActiveDeviceChangedCallback(nullptr, MyPFGameSaveFilesActiveDeviceChangedCallback, nullptr);
```
