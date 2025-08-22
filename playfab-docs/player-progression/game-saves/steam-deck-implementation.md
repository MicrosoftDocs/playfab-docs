---
title: Steam Deck Implementation Guide for PlayFab Game Saves
author: amccalib
description: Comprehensive guide for implementing PlayFab Game Saves on Steam Deck with October 2025 GDK, including authentication, UI callbacks, and sync strategies
ms.author: andmcc
ms.date: 08/01/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves, steam deck, xgameruntime, authentication, sync
ms.localizationpriority: medium
---

# Steam Deck Implementation Guide for PlayFab Game Saves

> [!IMPORTANT]
> This guide specifically covers Steam Deck implementation requirements for PlayFab Game Saves with the October 2025 GDK. Before implementing Steam Deck support, ensure you have completed the basic [October 2025 GDK implementation](october-2025-gdk-changes.md) requirements.

> [!TIP]
> **Complete Sample Implementation**: For working code examples of all Steam Deck integration patterns described in this guide, see the **[PlayFab Game Save Sample](https://github.com/PlayFab/PlayFabGameSaves/tree/main/samples)**. Key files include:
> - **SteamIntegration.cpp/.h** - Steam Deck detection, registry setup, authentication handlers
> - **XUserFileStorage.cpp/.h** - Local XUser data persistence implementation  
> - **GameSaveIntegration.cpp** - UI callback setup and Game Saves integration
> - **GameSaveIntegrationUI.cpp** - Authentication and Game Saves UI dialogs

## Overview

Steam Deck Game Saves integration can be implemented with varying levels of complexity depending on your cross-platform requirements. You can choose between a simplified Steam-only approach or full Xbox ecosystem integration with more complex authentication flows.

> [!IMPORTANT]
> **Critical Difference - Sync Behavior**: Game Saves on Windows can run fully out-of-process and continue syncing beyond the game's lifetime. On Steam Deck, Game Saves runs in-process only. This means save syncing stops when the game shuts down, requiring games to adopt frequent sync patterns to avoid losing unsynced progress.
> 
> **Best Practice for All Platforms**: While these sync patterns are required for Steam Deck, they're highly recommended for all platforms, especially handheld devices or any scenario where sudden shutdowns might occur (battery drain, system crashes, force-close events).

## Sync Engine Behavior Differences

| Platform | Sync Mode | Post-Shutdown Sync | Recommended Pattern |
|----------|-----------|-------------------|-------------------|
| **Windows PC** | Out-of-process | ✅ Continues after game shutdown | Frequent sync recommended for reliability |
| **Steam Deck** | In-process | ❌ Stops when game shuts down | **Frequent sync required** |

**Universal Sync Recommendations** (beneficial for all platforms):
- Sync save data frequently (e.g., after each level, checkpoint, or significant progress)
- Always sync before displaying "quit game" confirmations
- Consider background sync during gameplay transitions
- Implement sync progress indicators to ensure completion before shutdown
- Especially important for handheld devices where battery drain or sudden shutdowns are common

## Prerequisites

Before implementing Steam Deck support, ensure you have:

1. **Completed October 2025 GDK Setup**: Follow the [October 2025 GDK implementation guide](october-2025-gdk-changes.md)
2. **Steam API Integration**: Basic Steam API initialization and Steam Deck detection
3. **Choose Integration Approach**: Decide between Xbox ecosystem or custom identity integration (see below)
4. **All Required DLLs**: Unified SDK DLLs must be deployed with your Steam build

## Implementation Approaches

Steam Deck offers two implementation approaches with different complexity levels and cross-platform capabilities:

> [!IMPORTANT]
> **Why Use PlayFab Game Saves?** Steam Cloud already handles save synchronization between Steam devices (Steam Deck ↔ Steam PC). PlayFab Game Saves is primarily valuable for cross-platform save sync beyond Steam's ecosystem. For production use, you need either Xbox Live integration (Approach 1) or your own custom player identity system (Approach 2).

### Approach 1: Xbox Ecosystem Integration (Recommended)

**Benefits**:
- **Full cross-platform sync**: Save data syncs between Steam Deck, Xbox consoles, Microsoft Store PC, and other Xbox-enabled platforms
- **Xbox Live integration**: Players use their Xbox gamertag and can access Xbox social features
- **Unified player identity**: Same player profile across all platforms
- **Proven authentication**: Leverages Xbox Live's mature authentication infrastructure
- **Xbox Game Studios compatibility**: Seamless integration for Xbox first-party and partner studios

**Complexity**:
- **Complex authentication**: Custom XUser event handlers and UI callbacks required
- **Development sandbox setup**: Required for non-retail testing environments
- **Administrator privileges**: Required for registry modifications during sandbox setup
- **Additional UI implementation**: QR code authentication and gamertag selection dialogs

**When to choose**: Games that target multiple platforms including Xbox consoles, Xbox Game Studios titles, or games requiring full Xbox Live ecosystem integration.

### Approach 2: Custom Identity Implementation (Alternative)

**Benefits**:
- **Potentially reduced sign-in complexity**: No Xbox user authentication required
- **No registry configuration**: No sandbox setup needed
- **No XUser APIs**: Eliminates complex event handlers and storage implementation
- **Custom identity flexibility**: Implement your own cross-platform player identity system

**Complexity**:
- **Manual player management**: Must implement your own cross-platform player identity system
- **Limited ecosystem integration**: No access to Xbox Live social features or existing Xbox player base
- **Platform bridging**: Requires custom solutions for connecting players across different platforms
- **Additional identity infrastructure**: Need to build or integrate third-party identity systems

**When to choose**: Steam-focused games, games with existing custom identity systems, or development scenarios where Xbox Live integration isn't needed or desired.

> [!NOTE]
> **OpenID Connect Integration**: For Approach 2, PlayFab supports OpenID Connect authentication through the `LoginWithOpenIdConnect` API call. This enables integration with custom identity providers that support the OpenID Connect standard, making it easier to implement cross-platform player identity without building everything from scratch.

## Approach 1: Xbox Ecosystem Integration Implementation

This approach provides the most comprehensive cross-platform experience, enabling save synchronization between Steam Deck, Xbox consoles, Microsoft Store PC, and other Xbox-enabled platforms.

### Prerequisites for Approach 1
- **Development sandbox setup**: Required for non-retail testing environments
- **Additional UI implementation**: QR code authentication and gamertag selection dialogs

**When to choose**: Games that target multiple platforms including Xbox consoles or require full Xbox Live ecosystem integration.

## 1. DLL Deployment Requirements

Steam Deck requires all Unified SDK DLLs to be deployed with your game:

**Required DLLs**: 
- `libHttpClient.GDK.dll` - HTTP operations
- `PlayFabCore.GDK.dll` - Authentication and core services
- `PlayFabGameSave.GDK.dll` - Game Saves functionality
- `xgameruntime.dll` - Core SDK capabilities and Xbox sign-in

**Optional DLL**: 
- `PlayFabServices.GDK.dll` - Additional PlayFab services (recommended)

**Steam Deck Deployment Structure**:
```
YourGame/
├── YourGame.exe
├── libHttpClient.GDK.dll     // Required for HTTP operations
├── PlayFabCore.GDK.dll       // Required for authentication
├── PlayFabServices.GDK.dll   // Optional: For additional PlayFab services
├── PlayFabGameSave.GDK.dll   // Required for Game Saves
├── xgameruntime.dll          // Required for Xbox Live services
├── Steam_api64.dll
└── Other game files...
```

## 2. Steam Integration Prerequisites

### Steam API Integration
```cpp
// Initialize Steam API
bool steamAvailable = SteamAPI_Init();
```

### Platform Detection
Implement platform detection early in your initialization:

```cpp
bool DetectSteamDeck() {
    if (!SteamAPI_Init()) {
        return false;
    }
    
    return SteamUtils()->IsSteamRunningOnSteamDeck();
}
```

## 3. Authentication Configuration

Your authentication setup depends on which implementation approach you choose:

### Xbox Ecosystem Authentication (Approach 1)

For full Xbox ecosystem integration, you need registry configuration and XUser setup:

#### Registry Configuration
Steam Deck requires Xbox Live sandbox configuration for non-retail sandbox testing:

```cpp
// Set sandbox before Xbox Live services initialization
// Only required when testing with non-retail sandboxes AND using Xbox ecosystem integration
if (isSteamDeck && useXboxEcosystem) {
    HRESULT hr = SteamIntegration::SetSandboxForSteamDeck("XDKS.1");
    if (FAILED(hr)) {
        // Handle sandbox setup failure - requires admin privileges
        return hr;
    }
}
```

**Registry Configuration Details**:
- **Key**: `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\XboxLive\Sandbox`
- **Value**: Development sandbox ID (e.g., "XDKS.1")
- **Timing**: Must be set before Xbox Live services initialize
- **Privileges**: Requires administrator access
- **Usage**: Only required for testing in non-retail sandboxes (development/testing environments)
- **When needed**: Only for Xbox ecosystem integration approach

### Custom Identity Authentication (Approach 2)

For custom identity implementation, you can bypass Xbox user authentication and implement your own identity system:

```cpp
// Custom identity authentication
if (isSteamDeck) {
    // Development/Testing: Use Steam user identity temporarily
    // Production: Implement your own cross-platform player identity system
    // Required for production since Steam Cloud handles Steam-only sync
    
    // Option 1: OpenID Connect Integration (Recommended)
    // If your identity system supports OpenID Connect, use LoginWithOpenIdConnect:
    // PFAuthenticationLoginWithOpenIdConnectRequest request = {};
    // request.connectionId = "YourOpenIdConnectConnectionId";
    // request.idToken = "YourOpenIdConnectToken";
    // PFAuthenticationLoginWithOpenIdConnectAsync(serviceConfigHandle, &request, ...);
    
    // Option 2: Custom Integration
    // Initialize your custom authentication system
    // Connect to your user accounts/login system
    // Integrate with PlayFab Game Saves using your player identity
    
    // Initialize Game Saves with your custom identity system
    // (Implementation details depend on your specific identity integration)
}
```

**Requirements for Custom Identity**:
- **No registry configuration needed**
- **No administrator privileges required**
- **No XUser platform event handlers**
- **Simplified UI - no Xbox authentication dialogs**
- **Essential**: Custom player identity system for production use

## 4. XUser Platform Event Handlers (Xbox Ecosystem Only)

> [!NOTE]
> **Custom Identity Implementation**: If you're using the custom identity approach (Approach 2), you can skip this entire section. XUser event handlers are only required for Xbox ecosystem integration.

For Xbox ecosystem integration (Approach 1), Steam Deck requires three critical event handler sets for authentication:

### A. Remote Connect Event Handlers
Handles the remote authentication flow (QR code/URL display):

```cpp
// Handle remote authentication flow (QR code/URL)
XUserPlatformRemoteConnectEventHandlers remoteConnect{};
remoteConnect.context = nullptr;
remoteConnect.show = &OnRemoteConnectShow;     // Display QR code/URL dialog
remoteConnect.close = &OnRemoteConnectClose;   // Close authentication dialog
HRESULT hr = XUserPlatformRemoteConnectSetEventHandlers(nullptr, &remoteConnect);
if (FAILED(hr)) {
    // Handle event handler setup failure
}
```

### B. SPOP (Sign-in Prompt) Event Handlers
Handles the SPOP sign-in prompt used when a user's account is already signed in on another device. The handler should present UI that lets the player choose an action (Sign In Here, Switch Account, or Cancel) and must call `XUserPlatformSpopPromptComplete(operation, result)` with the chosen result.

```cpp
// Handle SPOP sign-in prompt. See sample: ShowSpopPromptDialogForXUserOnSteamDeck
HRESULT hr = XUserPlatformSpopPromptSetEventHandlers(nullptr, &OnSpopPrompt, nullptr);
if (FAILED(hr)) {
    // Handle SPOP setup failure
}
```

### C. Platform Storage Event Handlers
Handles local XUser data persistence. IMPORTANT: The sample ship with a convenience helper (`XUserFileStorage::Init`) but that helper is sample code only and not intended as a production drop-in. You should implement your own platform storage handlers and register them with the runtime. Use the sample implementation as a reference, not as the recommended production integration.

Required steps for production integration:
- Implement `OnWrite`, `OnRead`, and `OnClear` to persist XUser data to whatever store your title requires (secure file, encrypted store, cloud cache, etc.).
- Each handler MUST call the corresponding completion API when the work finishes:
    - `XUserPlatformStorageWriteComplete(operation, XUserPlatformOperationResult::Success|Failure)`
    - `XUserPlatformStorageReadComplete(operation, XUserPlatformOperationResult::Success|Failure, size, dataPtr)`
    - `XUserPlatformStorageClearComplete(operation, XUserPlatformOperationResult::Success|Failure)`
- Register your handlers with `XUserPlatformStorageSetEventHandlers(queue, &handlers)` during initialization.

Example (manual registration pattern - recommended):

```cpp
XUserPlatformStorageEventHandlers handlers = {};
handlers.write = &OnWrite;    // Your handler; must call XUserPlatformStorageWriteComplete
handlers.read = &OnRead;      // Your handler; must call XUserPlatformStorageReadComplete
handlers.clear = &OnClear;    // Your handler; must call XUserPlatformStorageClearComplete
handlers.context = nullptr;
HRESULT hr = XUserPlatformStorageSetEventHandlers(queue, &handlers);
if (FAILED(hr)) {
        // Handle storage setup failure
}
```

Note: the sample's `XUserFileStorage` provides a ready-made, file-backed implementation you can use as a starting point during development or testing, but we strongly recommend copying and adapting its logic into your game's own handlers rather than calling `XUserFileStorage::Init` directly in production.

## 5. UI Callback Implementation

> [!IMPORTANT]
> **Steam Deck UI Requirement**: All PlayFab Game Saves UI callbacks are **required** on Steam Deck regardless of which implementation approach you choose. This is because Steam Deck has no built-in UI available for Game Saves operations, so your application must provide all UI dialogs.

### Game Saves UI Callbacks (Required for Both Approaches)

Both custom identity and Xbox ecosystem implementations require the same PlayFab Game Saves UI callbacks:

```cpp
// Required Game Saves UI callbacks for Steam Deck (both approaches)
PFGameSaveUICallbacks callbacks{};
callbacks.progressCallback = OnPFGameSaveFilesUiProgress;                    // Sync progress
callbacks.syncFailedCallback = OnPFGameSaveFilesUiSyncFailed;               // Sync errors
callbacks.activeDeviceContentionCallback = OnPFGameSaveFilesUiActiveDeviceContention;  // Device conflicts
callbacks.conflictCallback = OnPFGameSaveFilesUiConflict;                   // Save conflicts
callbacks.outOfStorageCallback = OnPFGameSaveFilesUiOutOfStorage;           // Storage quota

HRESULT hr = PFGameSaveFilesSetUiCallbacks(&callbacks);
if (FAILED(hr)) {
    // Handle callback setup failure
}

// Optional: Additional active device changed callback
hr = PFGameSaveFilesSetActiveDeviceChangedCallback(&OnActiveDeviceChanged, nullptr);
```

**Required Game Saves UI Dialogs** (both approaches):
- **Progress Dialogs**: Show sync progress during save operations
- **Error Handling**: Display sync failure messages and retry options
- **Conflict Resolution**: Handle save conflicts between devices
- **Device Contention**: Handle multiple device access scenarios
- **Storage Management**: Notify users of storage quota issues

### Additional Authentication UI (Xbox Ecosystem Only)

The difference between approaches is in the **additional Xbox authentication UI** required:

#### Xbox Ecosystem Implementation (Approach 1)
- **All Game Saves dialogs** (above) **plus Xbox authentication dialogs**:
- **Remote Connect Dialog**: Display QR code and URL for users to authenticate on another device
- **SPOP Prompt Dialog**: Allow users to select/confirm their Xbox gamertag

#### Custom Identity Implementation (Approach 2)  
- **No Xbox authentication dialogs needed**: No QR code or gamertag selection
- **Custom identity display**: Use your own player identity system for user-facing displays

## 6. XUser File Storage Implementation (Xbox Ecosystem Only)

> [!NOTE]
> **Custom Identity Implementation**: If you're using the custom identity approach (Approach 2), you can skip this section. XUser file storage is only required for Xbox ecosystem integration.

For Xbox ecosystem integration (Approach 1), Steam Deck requires a custom file storage implementation for XUser data persistence:

```cpp
// Initialize XUser file storage
// NOTE: `XUserFileStorage::Init` registers the platform storage event handlers
// (write/read/clear) that the runtime will call to persist XUser data locally.
// Parameters:
//  - queue: an `XTaskQueueHandle` to receive platform events (the sample uses `nullptr`),
//  - pathPrefix: optional path prefix where per-key files will be written (e.g. "%TEMP%/xuser/").
// The function returns an HRESULT; always check for failure and handle it appropriately.
// The handlers registered by Init must call the corresponding completion APIs
// (XUserPlatformStorageWriteComplete / XUserPlatformStorageReadComplete / XUserPlatformStorageClearComplete)
// when their work finishes. See the sample implementation for a complete example.

{
    // Example (mirrors the sample): build a temp/xuser path and initialize storage
    char tempPath[MAX_PATH];
    DWORD tempPathLength = GetTempPathA(MAX_PATH, tempPath);
    std::string xuserPath;
    if (tempPathLength != 0 && tempPathLength <= MAX_PATH)
    {
        xuserPath = std::string(tempPath) + "xuser\\";
    }
    else
    {
        // Fallback if GetTempPathA fails
        xuserPath = "C:\\temp\\xuser";
    }

    HRESULT hr = XUserFileStorage::Init(nullptr, xuserPath.c_str());
    if (FAILED(hr)) {
        // Log and decide how your game should proceed when XUser storage cannot be initialized.
    }
}

// See: `samples/PlayFabGameSaveSample-Windows/XUserFileStorage.cpp` for a full file-backed
// implementation and the required completion calls.
```

### Storage Implementation Requirements
The storage implementation must handle:

- **Write Operations**: Save XUser authentication data locally
- **Read Operations**: Retrieve stored XUser data on subsequent launches
- **Clear Operations**: Remove XUser data during sign-out

### Storage Handler Implementation Templates
```cpp
// Write handler for storing XUser data
// IMPORTANT: Call XUserPlatformStorageWriteComplete to notify the runtime when the operation finishes.
void OnWrite(
    _In_opt_ void* /*context*/,
    _In_ uint32_t /*userIdentifier*/,
    _In_ XUserPlatformOperation operation,
    _In_z_ char const* key,
    _In_ size_t dataSize,
    _In_reads_bytes_(dataSize) void const* data
)
{
    // Store data to local file system (example: write to %TEMP%/xuser/<key>.json)

    // When complete, notify the platform of success or failure:
    // XUserPlatformStorageWriteComplete(operation, XUserPlatformOperationResult::Success);
    // or on failure:
    // XUserPlatformStorageWriteComplete(operation, XUserPlatformOperationResult::Failure);
}

// Read handler for retrieving XUser data
// IMPORTANT: Call XUserPlatformStorageReadComplete with the result and data buffer (or nullptr if not found).
void OnRead(
    _In_opt_ void* /*context*/,
    _In_ uint32_t /*userIdentifier*/,
    _In_ XUserPlatformOperation operation,
    _In_z_ char const* key
)
{
    // Read data from local file system (example: read %TEMP%/xuser/<key>.json)
    // If the file is not found, the sample below signals success with size 0 and nullptr data.
    // On success:
    //     XUserPlatformStorageReadComplete(operation, XUserPlatformOperationResult::Success, dataSize, dataPtr);
    // On failure:
    //     XUserPlatformStorageReadComplete(operation, XUserPlatformOperationResult::Failure, 0, nullptr);
}

// Clear handler for removing XUser data
// IMPORTANT: Call XUserPlatformStorageClearComplete to notify the runtime when clear completes.
void OnClear(
    _In_opt_ void* /*context*/,
    _In_ uint32_t /*userIdentifier*/,
    _In_ XUserPlatformOperation operation,
    _In_z_ char const* key
)
{
    // Remove stored data from local file system
    // On success:
    //     XUserPlatformStorageClearComplete(operation, XUserPlatformOperationResult::Success);
    // On failure:
    //     XUserPlatformStorageClearComplete(operation, XUserPlatformOperationResult::Failure);
}
```

## 7. Steam Deck Initialization Sequence

Your initialization sequence depends on which implementation approach you choose:

### Xbox Ecosystem Initialization (Approach 1)

Follow this enhanced initialization sequence for full Xbox ecosystem support:

```cpp
// 1. Check Steam availability and platform
bool steamAvailable = SteamIntegration::CheckSteamAvailability();
bool isSteamDeck = SteamIntegration::CheckIfSteamDeck();

// 2. Set Xbox Live sandbox (Steam Deck only, required for non-retail sandbox testing)
if (isSteamDeck && useXboxEcosystem) {
    HRESULT hr = SteamIntegration::SetSandboxForSteamDeck("XDKS.1");
    if (FAILED(hr)) {
        // Handle sandbox setup failure
        return hr;
    }
}

// 3. Initialize Xbox runtime
hr = XGameRuntimeInitialize();
if (FAILED(hr)) {
    return hr;
}

// 4. Initialize PlayFab Core and Services
hr = PFInitialize(nullptr);
if (FAILED(hr)) {
    return hr;
}
hr = PFServicesInitialize(nullptr); // Optional

// 5. Initialize XUser for Steam Deck (Xbox ecosystem only)
if (isSteamDeck && useXboxEcosystem) {
    hr = SteamIntegration::InitializeXUserForSteamDeck();
    if (FAILED(hr)) {
        return hr;
    }
}

// 6. Initialize Game Saves with appropriate callbacks
bool setUiCallbacks = isSteamDeck;
hr = InitializeGameSaves(setUiCallbacks);
if (FAILED(hr)) {
    return hr;
}
```

### Custom Identity Initialization (Approach 2)

```cpp
// 1. Check Steam availability and platform
bool steamAvailable = SteamIntegration::CheckSteamAvailability();
bool isSteamDeck = SteamIntegration::CheckIfSteamDeck();

// 2. Initialize Xbox runtime (still required for Game Saves infrastructure)
HRESULT hr = XGameRuntimeInitialize();
if (FAILED(hr)) {
    return hr;
}

// 3. Initialize PlayFab Core and Services
hr = PFInitialize(nullptr);
if (FAILED(hr)) {
    return hr;
}
hr = PFServicesInitialize(nullptr); // Optional

// 4. Initialize your custom player identity system
hr = InitializeCustomPlayerIdentity();
if (FAILED(hr)) {
    return hr;
}

// 5. Initialize Game Saves with custom identity system
// Option A: OpenID Connect (if your identity system supports it)
// hr = PFAuthenticationLoginWithOpenIdConnectAsync(serviceConfigHandle, &openIdRequest, ...);
// Option B: Custom authentication integration
hr = InitializeGameSavesWithCustomIdentity();
if (FAILED(hr)) {
    return hr;
}
```

## 8. Sign-Out Implementation

Your sign-out implementation depends on which approach you're using:

### Xbox Ecosystem Sign-Out (Approach 1)

For Xbox ecosystem integration, Steam Deck requires special sign-out handling to clear stored Xbox credentials:

```cpp
void SignOutFromSteamDeckXboxEcosystem() {
    // Clean up Windows Credential Manager entries
    SteamIntegration::SignOutViaXboxOnSteamDeck();
    
    // Close Xbox user handles
    if (xboxUser) {
        XUserCloseHandle(xboxUser);
        xboxUser = nullptr;
    }
    
    // Close PlayFab user handles
    if (pfUser) {
        PFLocalUserCloseHandle(pfUser);
        pfUser = nullptr;
    }
}
```

This Xbox ecosystem implementation:
- Enumerates and deletes Windows credentials with target names starting with "Xbl"
- Closes Xbox user handles properly
- Resets authentication state for clean re-authentication

### Custom Identity Sign-Out (Approach 2)

```cpp
void SignOutFromSteamDeck() {
    // Sign-out for custom identity implementation
    // No Xbox credential cleanup needed
    
    // Clean up your custom identity system
    SignOutFromCustomIdentitySystem();
    
    // Close PlayFab user handles
    if (pfUser) {
        PFLocalUserCloseHandle(pfUser);
        pfUser = nullptr;
    }
    
    // Clear local game state as needed
    ClearLocalGameState();
}
```

## 9. Testing Requirements

Your testing requirements depend on which implementation approach you choose:

### Xbox Ecosystem Testing (Approach 1)
- [ ] **Authentication Flow**: Test remote connect (QR code/URL) authentication
- [ ] **UI Callbacks**: Verify all Game Saves UI dialogs display correctly
- [ ] **SPOP Prompts**: Test gamertag selection and confirmation
- [ ] **Credential Persistence**: Test sign-in persistence across app restarts
- [ ] **Sign-Out**: Verify proper credential cleanup on sign-out
- [ ] **Sync Behavior**: Test frequent sync patterns and pre-shutdown sync
- [ ] **Data Loss Prevention**: Verify minimal progress lost during force-close scenarios
- [ ] **Cross-Platform Sync**: Test save sync between Steam Deck, Xbox consoles, and Microsoft Store PC

### Custom Identity Testing (Approach 2)
- [ ] **Custom Identity System**: Test your custom player authentication and identity system
- [ ] **PlayFab Authentication**: Test PlayFab login using LoginWithOpenIdConnect (if using OpenID Connect) or custom authentication method
- [ ] **Cross-Platform Game Saves Sync**: Test save synchronization across all target platforms
- [ ] **UI Callbacks**: Verify all Game Saves UI dialogs display correctly
- [ ] **Conflict Resolution**: Test save conflicts between devices across different platforms
- [ ] **Sync Behavior**: Test frequent sync patterns and pre-shutdown sync
- [ ] **Data Loss Prevention**: Verify minimal progress lost during force-close scenarios
- [ ] **Custom Authentication**: Test login/logout flows for your identity system
- [ ] **Platform Coverage**: Test on all platforms your game targets (not just Steam devices)

### Cross-Platform Testing
- [ ] **Save Sync**: Test save synchronization between Steam Deck and other platforms
- [ ] **Conflict Resolution**: Test save conflicts when playing on multiple devices
- [ ] **Network Scenarios**: Test offline/online transitions
- [ ] **Performance**: Verify sync operations don't impact gameplay performance

## 10. Sample Code Reference

For complete implementation examples, refer to the sample project:
- **Location**: [https://github.com/PlayFab/PlayFabGameSaves/tree/main/samples](https://github.com/PlayFab/PlayFabGameSaves/tree/main/samples)
- **Key Files**: 
  - `SteamIntegration.cpp/.h` - Steam Deck specific functions
  - `XUserFileStorage.cpp/.h` - Local storage implementation
  - `GameSaveIntegrationUI.cpp/.h` - UI callback implementations

## 11. Development Checklist

Use this checklist to track your Steam Deck implementation progress:

### Prerequisites & Setup
- [ ] **Complete October 2025 GDK Setup**: Verify basic Game Saves implementation works on Windows
- [ ] **Choose Implementation Approach**: Decide between Xbox ecosystem (Approach 1) or custom identity (Approach 2)
- [ ] **Deploy Required DLLs**: Ensure all Unified SDK DLLs are included in Steam build
- [ ] **Steam API Integration**: Implement Steam API initialization and Steam Deck detection

### Xbox Ecosystem Implementation (Approach 1)
- [ ] **Registry Configuration**: Implement SetSandboxForSteamDeck for development environments
- [ ] **XUser Event Handlers**: Set up Remote Connect, SPOP, and Platform Storage handlers
- [ ] **XUser File Storage**: Implement local storage for XUser data persistence
- [ ] **Authentication UI**: Implement QR code and gamertag selection dialogs
- [ ] **Game Saves UI Callbacks**: Implement all required UI dialogs (progress, sync failed, conflict, etc.)
- [ ] **Initialization Sequence**: Update app startup for full Xbox ecosystem integration
- [ ] **Sign-Out Implementation**: Implement credential cleanup via SignOutViaXboxOnSteamDeck
- [ ] **Sync Strategy**: Implement frequent sync patterns for Steam Deck reliability

### Custom Identity Implementation (Approach 2)
- [ ] **Custom Identity System**: Design and implement cross-platform player identity
- [ ] **PlayFab Authentication**: Set up LoginWithOpenIdConnect (if using OpenID Connect) or custom auth
- [ ] **Game Saves UI Callbacks**: Implement all required UI dialogs (same as Approach 1)
- [ ] **Initialization Sequence**: Update app startup to handle Steam Deck-specific initialization
- [ ] **Sign-Out Implementation**: Implement custom identity cleanup on sign-out
- [ ] **Sync Strategy**: Implement frequent sync patterns for Steam Deck reliability

### Testing & Validation
- [ ] **Steam Deck Detection**: Verify platform detection works correctly
- [ ] **Authentication Flow**: Test sign-in process on Steam Deck
- [ ] **UI Dialogs**: Verify all UI callbacks display correctly
- [ ] **Save Sync**: Test game save synchronization across platforms
- [ ] **Conflict Resolution**: Test save conflicts between devices
- [ ] **Sign-Out/Sign-In**: Test credential persistence and cleanup
- [ ] **Frequent Sync**: Verify sync occurs at checkpoints and before shutdown
- [ ] **Error Handling**: Test network failures and recovery scenarios
- [ ] **Performance**: Ensure sync operations don't impact gameplay

## 12. Related Documentation
- [October 2025 GDK Implementation Guide](october-2025-gdk-changes.md)
- [Game Saves Overview](overview.md)
- [Game Saves Quickstart](quickstart.md)

---

> [!NOTE]
> This guide provides comprehensive Steam Deck implementation details for PlayFab Game Saves with October 2025 GDK. For basic Game Saves implementation, start with the [October 2025 GDK guide](october-2025-gdk-changes.md).
