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

Steam Deck offers two implementation approaches with different complexity levels and cross-platform capabilities. PlayFab Game Saves is valuable for cross-platform save sync beyond Steam's ecosystem - you'll need either Xbox Live integration (Approach 1) or your own custom player identity system (Approach 2).

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
- **No XUser APIs**: Eliminates complex event handlers
- **Custom identity flexibility**: Implement your own cross-platform player identity system

**Complexity**:
- **Manual player management**: Must implement your own cross-platform player identity system
- **Limited ecosystem integration**: No access to Xbox Live social features or existing Xbox player base
- **Platform bridging**: Requires custom solutions for connecting players across different platforms
- **Additional identity infrastructure**: Need to build or integrate third-party identity systems

**When to choose**: Steam-focused games, games with existing custom identity systems, or development scenarios where Xbox Live integration isn't needed or desired.

**OpenID Connect**: For Approach 2, PlayFab supports OpenID Connect authentication through the `LoginWithOpenIdConnect` API call, enabling integration with custom identity providers that support the OpenID Connect standard.

## Common Setup (Both Approaches)

The following setup steps are required regardless of which implementation approach you choose.

## 1. DLL Deployment Requirements

Steam Deck requires all Unified SDK DLLs to be deployed with your game:

**Required DLLs**: 
- `libHttpClient.dll` - HTTP operations
- `PlayFabCore.dll` - Authentication and core services
- `PlayFabGameSave.dll` - Game Saves functionality
- `xgameruntime.dll` - Core SDK capabilities and Xbox sign-in

**Optional DLL**: 
- `PlayFabServices.dll` - Additional PlayFab services (recommended)

**Steam Deck Deployment Structure**:
```
YourGame/
├── YourGame.exe
├── libHttpClient.dll     // Required for HTTP operations
├── PlayFabCore.dll       // Required for authentication
├── PlayFabServices.dll   // Optional: For additional PlayFab services
├── PlayFabGameSave.dll   // Required for Game Saves
├── xgameruntime.dll      // Required for Xbox Live services
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

## 3. UI Callback Implementation

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

---

## Approach 1: Xbox Ecosystem Integration - Complete Implementation

This approach provides full cross-platform sync between Steam Deck, Xbox consoles, Microsoft Store PC, and other Xbox-enabled platforms. Choose this approach if your game targets Xbox platforms or requires Xbox Live integration.

### Overview

**Prerequisites**:
- Completed common setup (Sections 1-3 above)
- Development sandbox access for testing
- Administrator privileges for registry configuration (dev/test only)

### 1. Registry Configuration

Steam Deck requires Xbox Live sandbox configuration for non-retail sandbox testing:

```cpp
// Set sandbox before Xbox Live services initialization
// Only required when testing with non-retail sandboxes
if (isSteamDeck) {
    HRESULT hr = SteamIntegration::SetSandboxForSteamDeck("XDKS.1");
    if (FAILED(hr)) {
        // Handle sandbox setup failure - requires admin privileges
        return hr;
    }
}
```

**Configuration Details**:
- **Key**: `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\XboxLive\Sandbox`
- **Value**: Development sandbox ID (e.g., "XDKS.1")
- **Timing**: Must be set before Xbox Live services initialize
- **Privileges**: Requires administrator access
- **Usage**: Only required for testing in non-retail sandboxes (development/testing environments)

### 2. XUser Platform Event Handlers

Steam Deck requires two critical event handler sets for Xbox authentication:

#### A. Remote Connect Event Handlers
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

#### B. SPOP (Sign-in Prompt) Event Handlers
Handles the SPOP sign-in prompt used when a user's account is already signed in on another device:

```cpp
// Handle SPOP sign-in prompt. See sample: ShowSpopPromptDialogForXUserOnSteamDeck
HRESULT hr = XUserPlatformSpopPromptSetEventHandlers(nullptr, &OnSpopPrompt, nullptr);
if (FAILED(hr)) {
    // Handle SPOP setup failure
}
```

The handler must present UI that lets the player choose an action (Sign In Here, Switch Account, or Cancel) and call `XUserPlatformSpopPromptComplete(operation, result)` with the chosen result.

### 3. Authentication UI Implementation

In addition to the Game Saves UI callbacks (Section 3), Xbox ecosystem integration requires:

- **Remote Connect Dialog**: Display QR code and URL for users to authenticate on another device
- **SPOP Prompt Dialog**: Allow users to select/confirm their Xbox gamertag

### 4. Initialization Sequence

Follow this initialization sequence for Xbox ecosystem integration:

```cpp
// 1. Check Steam availability and platform
bool steamAvailable = SteamIntegration::CheckSteamAvailability();
bool isSteamDeck = SteamIntegration::CheckIfSteamDeck();

// 2. Set Xbox Live sandbox (Steam Deck only, required for non-retail sandbox testing)
if (isSteamDeck) {
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

// 5. Initialize XUser for Steam Deck
if (isSteamDeck) {
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

### 5. Sign-Out Implementation

Steam Deck requires special sign-out handling to clear stored Xbox credentials:

```cpp
void SignOutFromSteamDeck() {
    // Enumerate and delete Windows credentials with target names starting with "Xbl"
    DWORD count = 0;
    PCREDENTIALW* credentials = nullptr;
    
    if (CredEnumerateW(L"Xbl*", 0, &count, &credentials)) {
        for (DWORD i = 0; i < count; i++) {
            CredDeleteW(credentials[i]->TargetName, credentials[i]->Type, 0);
        }
        CredFree(credentials);
    }
    
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
    
    // Reset authentication state for clean re-authentication
    authenticationState = AuthState::NotAuthenticated;
}
```

### 6. Testing Checklist

Use this checklist to validate your Xbox ecosystem implementation:

- [ ] **Authentication Flow**: Test remote connect (QR code/URL) authentication
- [ ] **UI Callbacks**: Verify all Game Saves UI dialogs display correctly
- [ ] **SPOP Prompts**: Test gamertag selection and confirmation
- [ ] **Credential Persistence**: Test sign-in persistence across app restarts
- [ ] **Sign-Out**: Verify proper credential cleanup on sign-out
- [ ] **Sync Behavior**: Test frequent sync patterns and pre-shutdown sync
- [ ] **Data Loss Prevention**: Verify minimal progress lost during force-close scenarios
- [ ] **Cross-Platform Sync**: Test save sync between Steam Deck, Xbox consoles, and Microsoft Store PC
- [ ] **Registry Configuration**: Verify sandbox configuration works in dev environments
- [ ] **XUser Event Handlers**: Confirm Remote Connect and SPOP handlers work correctly

---

## Approach 2: Custom Identity Implementation - Complete Implementation

This approach allows you to use your own player identity system without Xbox Live integration. Choose this approach if your game is Steam-focused or you have an existing custom identity system.

### Overview

**Prerequisites**:
- Completed common setup (Sections 1-3 above)
- Custom player identity system for production use

**Benefits**:
- No Xbox authentication required
- No registry configuration needed
- No administrator privileges required
- Simpler UI (no QR code or gamertag selection)

**Limitations**:
- Must implement your own cross-platform player identity
- No Xbox Live social features
- Requires custom platform bridging solutions

### 1. Custom Identity Authentication

Implement your own identity system for cross-platform player authentication:

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

### 2. Initialization Sequence

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

### 3. Sign-Out Implementation

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

### 4. Testing Checklist

Use this checklist to validate your custom identity implementation:

- [ ] **Custom Identity System**: Test your custom player authentication and identity system
- [ ] **PlayFab Authentication**: Test PlayFab login using LoginWithOpenIdConnect (if using OpenID Connect) or custom authentication method
- [ ] **Cross-Platform Game Saves Sync**: Test save synchronization across all target platforms
- [ ] **UI Callbacks**: Verify all Game Saves UI dialogs display correctly
- [ ] **Conflict Resolution**: Test save conflicts between devices across different platforms
- [ ] **Sync Behavior**: Test frequent sync patterns and pre-shutdown sync
- [ ] **Data Loss Prevention**: Verify minimal progress lost during force-close scenarios
- [ ] **Custom Authentication**: Test login/logout flows for your identity system
- [ ] **Platform Coverage**: Test on all platforms your game targets (not just Steam devices)
- [ ] **Network Scenarios**: Test offline/online transitions
- [ ] **Performance**: Verify sync operations don't impact gameplay performance

---

## Sample Code Reference

For complete implementation examples for both approaches, refer to the sample project:
- **Location**: [PlayFabGameSaveSample-Windows](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/All/PlayFabGameSaveSample-Windows)
- **Key Files**: 
  - `SteamIntegration.cpp/.h` - Steam Deck detection, registry setup, authentication handlers
  - `GameSaveIntegrationUI.cpp/.h` - UI callback implementations for both approaches

---

## Related Documentation
- [October 2025 GDK Implementation Guide](october-2025-gdk-changes.md)
- [Game Saves Overview](overview.md)
- [Game Saves Quickstart](quickstart.md)
