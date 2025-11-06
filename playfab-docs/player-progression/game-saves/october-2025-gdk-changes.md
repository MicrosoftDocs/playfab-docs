---
title: Game Saves Implementation with October 2025 GDK
author: amccalib
description: Essential guide for implementing PlayFab Game Saves with October 2025 GDK (2510), including requirements for new implementations and migration guidance
ms.author: andmcc
ms.date: 08/01/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves, gdk, steam deck, xgameruntime, unified sdk
ms.localizationpriority: medium
---

# Game Saves Implementation with October 2025 GDK

> [!IMPORTANT]
> This guide covers implementing PlayFab Game Saves with the October 2025 GDK (version 2510). Whether you're new to Game Saves or migrating from a previous implementation, this document provides the essential requirements and setup instructions, with special attention to Steam Deck support.

## Overview of Implementation Requirements

When implementing PlayFab Game Saves with the October 2025 GDK, you need to understand four key components:

1. **New GDK Folder Layout**: Platform-centric SDK directory structure
2. **XGameRuntime Integration**: Cross-platform runtime with specific deployment requirements
3. **PlayFab Unified SDK**: Modern SDK architecture for all PlayFab components
4. **Other Unified SDK Components**: Updated Party and Multiplayer components (if used)

The first three components are **required** for all Game Saves implementations with October 2025 GDK and later, including Steam Deck support. The fourth component only applies if your game uses PlayFab Party or Multiplayer features.

> [!NOTE]
> **New to Game Saves?** Start with the [Game Saves Overview](overview.md) and [Quickstart Guide](quickstart.md) to understand the basics, then return here for October 2025 GDK-specific implementation details.

## 1. GDK Folder Layout and Path Configuration

### Current GDK Structure
The October 2025 GDK uses a flat, platform-centric directory structure. Understanding this layout is essential for setting up your build system correctly.

**October 2025 GDK Layout**:
```
\Microsoft GDK\251000\windows\include
\Microsoft GDK\251000\xbox\lib\x64
\Microsoft GDK\251000\xbox\bin\x64
```

**Migrating from earlier GDK?** The previous folder structure (`$(GDK)\GRDK\ and $(GDK)\GXDK\`) has been replaced. Update your build scripts accordingly.

### Setting Up Your Build System

#### Required Path Configuration
Configure your build system to use the correct platform-specific paths:

#### Example Build System Configuration

**CMake Setup**:
```cmake
# Configure GDK paths for your target platform
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(GDK_INCLUDE_DIR "${GDK_PATH}/windows/include")
    set(GDK_LIB_DIR "${GDK_PATH}/windows/lib/x64")
elseif(XBOX)
    set(GDK_INCLUDE_DIR "${GDK_PATH}/xbox/include")
    set(GDK_LIB_DIR "${GDK_PATH}/xbox/lib/x64")
endif()
```

**MSBuild Configuration**:
```xml
<!-- Set include paths for Game Saves development -->
<IncludePath>$(GDK)\windows\include;$(IncludePath)</IncludePath>
<LibraryPath>$(GDK)\windows\lib\x64;$(LibraryPath)</LibraryPath>
```

#### Platform Support Details
- **Xbox**: Uses `xbox` folders for all recent Xbox console generations
- **Windows**: All Windows platforms (PC, Steam PC, Steam Deck-Proton) use the `windows` folder
- **Steam Deck**: Despite running SteamOS, uses the `windows` folder for compatibility with Proton emulation

### Implementation Steps

1. **Configure Your Build System**
   - Set up include and library paths using the new GDK structure
   - Add platform detection logic if targeting multiple platforms
   - Test compilation on all target platforms

2. **Validate Game Saves Integration**
   - Ensure all required libraries link correctly
   - Test functionality on your target platforms
   - Verify PlayFab service connectivity

## 2. XGameRuntime Integration

### Understanding XGameRuntime
XGameRuntime provides the foundation for Xbox Live services and Game Saves functionality across all platforms. Here's what you need to know:

#### Core Components

**xgameruntime.lib (Import Library)**
- Links into your game project at compile time
- Locates and loads the runtime DLL automatically
- Handles service discovery (local vs. system)

**xgameruntime.dll (Runtime Library)**
- Implements Xbox Live and Game Saves functionality
- Location: `{GDK}\windows\bin\xgameruntime.dll`
- **Critical for Steam builds**: Must be deployed with your game

### Implementation Requirements

#### 1. Basic Integration
All Game Saves implementations require XGameRuntime initialization:

```cpp
// Initialize XGameRuntime - required for all Game Saves implementations
HRESULT hr = XGameRuntimeInitialize();
if (FAILED(hr)) {
    // Handle initialization failure
    return hr;
}
```

#### 2. Steam Platform Requirements

**Essential for Steam Builds**:
When building for Steam, you **must** include `xgameruntime.dll` in your game directory. Without this DLL, when running on Steam Deck:
- Xbox Live authentication will fail
- Game Saves functionality will be unavailable

**Deployment Structure**:
```
YourGame/
├── YourGame.exe
├── xgameruntime.dll          // Required for Steam/Steam Deck
├── Steam_api64.dll
└── Other game files...
```

> [!NOTE]
> **Microsoft Store builds** automatically load XGameRuntime from the system and don't require DLL deployment.

#### 3. Automated DLL Deployment

**CMake Configuration**:
```cmake
# Automatically copy XGameRuntime DLL for Steam builds
if(STEAM_BUILD)
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${GDK_PATH}/windows/bin/xgameruntime.dll"
        $<TARGET_FILE_DIR:${PROJECT_NAME}>)
endif()
```

**MSBuild Configuration**:
```xml
<Target Name="CopySteamRuntimeDll" AfterTargets="Build" Condition="'$(SteamBuild)'=='true'">
  <Copy SourceFiles="$(GDK)\windows\bin\xgameruntime.dll" 
        DestinationFolder="$(OutDir)" />
</Target>
```

### Platform-Specific Runtime Behavior

| Platform | DLL Source | Runtime Mode | Game Saves Support | Sync Behavior |
|----------|------------|--------------|-------------------|---------------|
| Microsoft Store | System DLL | GRTS | Full support | Out-of-process, continues after shutdown |
| Steam PC | System DLL | GRTS | Full support | Out-of-process, continues after shutdown |
| Steam Deck | Local DLL | Local services | Game lifetime support | **In-process only, stops at shutdown** |

> [!IMPORTANT]
> Steam Deck support specifically requires the local DLL deployment. The system cannot fall back to system services like other platforms. Additionally, the sync engine runs in-process, meaning games must ensure critical save data is synced before shutdown.

## 3. PlayFab Unified SDK Integration

### What is the PlayFab Unified SDK?
The PlayFab Unified SDK is a modern, cohesive SDK that brings together all PlayFab components under a single architecture. Game Saves is now part of this unified system, providing:
**Benefits for Game Saves Development**:
- Unified memory management across all PlayFab components
- Consistent async operation patterns
- Integrated tracing and diagnostics
- Modular component loading (include only what you need)

**New to PlayFab?** The Unified SDK simplifies integration by providing a single, consistent API pattern across all PlayFab services. If you're implementing Game Saves or any other PlayFab services for the first time, you'll want to start with this modern architecture.

### Required SDK Components

Game Saves implementations need these Unified SDK components:

**Essential Components**:
- **libHttpClient**: Cross-platform HTTP/WebSocket communication
- **PlayFab Core**: Authentication, entity management, and configuration
- **PlayFab GameSave**: Game Saves specific functionality

**Optional Components**:
- **PlayFab Services**: Shared services for LiveOps, account management, and other progression systems (recommended if using other PlayFab services)

### Library and DLL Requirements

#### Required Libraries for Linking
```
Link these .lib files in your project:
- libHttpClient.lib
- PlayFabCore.lib 
- PlayFabServices.lib (optional, but recommended for additional PlayFab features)
- PlayFabGameSave.lib
- xgameruntime.lib
```

#### Required DLLs for Deployment
```
Deploy these .dll files with Steam builds:
- libHttpClient.dll
- PlayFabCore.dll
- PlayFabServices.dll (optional, but recommended)
- PlayFabGameSave.dll
- xgameruntime.dll
```

### Build System Configuration

#### MSBuild Setup
Configure your Visual Studio project to link the Unified SDK:

```xml
<!-- Link all required Unified SDK libraries -->
<AdditionalDependencies>
  libHttpClient.lib;
  PlayFabCore.lib;
  PlayFabServices.lib;
  PlayFabGameSave.lib;
  xgameruntime.lib;
  %(AdditionalDependencies)
</AdditionalDependencies>

<!-- Automatically deploy DLLs for Steam builds -->
<Target Name="CopyUnifiedSDKDlls" AfterTargets="Build" Condition="'$(SteamBuild)'=='true'">
  <ItemGroup>
    <UnifiedSDKDlls Include="$(GDK)\windows\bin\libHttpClient.dll" />
    <UnifiedSDKDlls Include="$(GDK)\windows\bin\PlayFabCore.dll" />
    <UnifiedSDKDlls Include="$(GDK)\windows\bin\PlayFabServices.dll" />
    <UnifiedSDKDlls Include="$(GDK)\windows\bin\PlayFabGameSave.dll" />
    <UnifiedSDKDlls Include="$(GDK)\windows\bin\xgameruntime.dll" />
  </ItemGroup>
  </ItemGroup>
  <Copy SourceFiles="@(UnifiedSDKDlls)" DestinationFolder="$(OutDir)" />
</Target>
```

**Migrating from earlier GDK?** Replace old paths like `$(GDK)\GRDK\...\include` with the new structure shown above.

#### CMake Setup
For CMake-based projects, configure dependencies and deployment:

```cmake
# Link all required Unified SDK libraries
target_link_libraries(${PROJECT_NAME} PRIVATE
    libHttpClient
    PlayFabCore
    PlayFabServices
    PlayFabGameSave
    xgameruntime
)

# Automatically deploy DLLs for Steam builds
if(STEAM_BUILD)
    set(UNIFIED_SDK_DLLS
        "${GDK_PATH}/windows/bin/libHttpClient.dll"
        "${GDK_PATH}/windows/bin/PlayFabCore.dll"
        "${GDK_PATH}/windows/bin/PlayFabServices.dll"
        "${GDK_PATH}/windows/bin/PlayFabGameSave.dll"
        "${GDK_PATH}/windows/bin/xgameruntime.dll"
    )
    
    foreach(DLL ${UNIFIED_SDK_DLLS})
        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
            ${DLL} $<TARGET_FILE_DIR:${PROJECT_NAME}>)
    endforeach()
endif()
```

### Code Implementation

#### Required Headers
Include the necessary Unified SDK headers in your project:

```cpp
// Essential headers for Game Saves implementation
#include <playfab/core/PFCore.h>
#include <playfab/services/PFServices.h>
#include <playfab/gamesave/PFGameSave.h>
#include <XGameRuntimeInit.h>
```

#### Initialization Sequence
Follow this initialization order for proper Game Saves setup:

```cpp
// 1. Initialize XGameRuntime (foundation for Xbox Live services)
HRESULT hr = XGameRuntimeInitialize();
if (FAILED(hr)) {
    // Handle initialization failure
    return hr;
}

// 2. Initialize PlayFab Core (authentication and entity management)
hr = PFInitialize(nullptr);
if (FAILED(hr)) {
    // Handle PlayFab Core initialization failure
    return hr;
}

// 3. Initialize PlayFab Services (optional - only if using other PlayFab services)
hr = PFServicesInitialize(nullptr);
if (FAILED(hr)) {
    // Handle PlayFab Services initialization failure
    return hr;
}

// 4. Create service configuration (connects to your PlayFab title)
PFServiceConfigHandle serviceConfigHandle{ nullptr };
hr = PFServiceConfigCreateHandle(
    "https://YOUR_TITLE_ID.playfabapi.com",    // Replace with your endpoint
    "YOUR_TITLE_ID",                           // Replace with your Title ID
    &serviceConfigHandle);
if (FAILED(hr)) {
    // Handle service config creation failure
    return hr;
}

// 5. Initialize Game Saves with your service configuration
hr = PFGameSaveFilesInitialize(serviceConfigHandle);
if (FAILED(hr)) {
    // Handle Game Saves initialization failure
    return hr;
}

// Game Saves is now ready for use!
```

> [!TIP]
> Get your Title ID and API endpoint from the [PlayFab Game Manager](https://developer.playfab.com) under your title's settings.

#### Proper Cleanup Sequence
When shutting down your application, clean up resources in reverse order:

```cpp
// Clean up Game Saves
PFGameSaveFilesUninitialize();

// Close service configuration
PFServiceConfigCloseHandle(serviceConfigHandle);
serviceConfigHandle = nullptr;

// Async cleanup for PlayFab Services (only if initialized)
XAsyncBlock async{};
HRESULT hr = PFServicesUninitializeAsync(&async);
hr = XAsyncGetStatus(&async, true);  // Wait for completion

// Async cleanup for PlayFab Core
hr = PFUninitializeAsync(&async);
hr = XAsyncGetStatus(&async, true);  // Wait for completion

// Clean up XGameRuntime
XGameRuntimeUninitialize();
```

> [!IMPORTANT]
> Always use the async cleanup pattern for PlayFab Services and Core to ensure proper resource release.

## 4. Other PlayFab Unified SDK Components

### Party and Multiplayer API Changes

While not directly required for Game Saves functionality, the October 2025 GDK also includes updated versions of PlayFab Party and PlayFab Multiplayer components as part of the Unified SDK. These components have new APIs that integrate better with the unified authentication system.

#### Key Changes from Standalone SDKs

**Authentication Integration**:
- **Legacy Pattern**: Previously, titles using standalone Party/Multiplayer SDKs had to manually manage `EntityID` and `EntityToken` from PlayFab login results and pass them to Party/Multiplayer APIs
- **Unified SDK Pattern**: Party and Multiplayer now accept `PFEntityHandle` directly, eliminating manual token management

**New APIs Available**:
- Party: New APIs that accept `PFEntityHandle` for user authentication
- Multiplayer: New APIs that accept `PFEntityHandle` for lobby and matchmaking operations

**Benefits of Migration** (if using Party/Multiplayer):
- Simplified authentication flow with automatic token refresh
- Consistent error handling patterns across all PlayFab components
- Unified memory management and async operation patterns

> [!NOTE]
> **Party and Multiplayer Components**: If your game uses PlayFab Party or Multiplayer, consider migrating to the new unified APIs that accept `PFEntityHandle` directly for improved integration. However, this is not required for Game Saves functionality - you can safely skip section 4 if you only use Game Saves.

## 5. Steam Deck Implementation

Steam Deck support for PlayFab Game Saves requires significant additional implementation beyond standard PC builds, including custom authentication flows, comprehensive UI callbacks, and careful sync strategies.

> [!IMPORTANT]
> **Steam Deck Implementation Complexity**: Steam Deck integration involves custom authentication flows, UI callback implementation, and critical sync behavior differences. Due to the complexity and length of implementation requirements, Steam Deck implementation is in its own [dedicated guide](steam-deck-implementation.md).

### Key Steam Deck Considerations

**Critical Sync Behavior Difference**:
- **Windows PC**: Game Saves runs out-of-process and can continue syncing after game shutdown
- **Steam Deck**: Game Saves runs in-process only and stops syncing when the game shuts down

**Implementation Requirements**:
- All Unified SDK DLLs must be deployed with your Steam build
- Custom XUser authentication flow with UI callbacks
- Registry configuration for non-retail sandbox testing
- Frequent sync patterns to prevent data loss

**Universal Sync Recommendations** (beneficial for all platforms):
While these patterns are required for Steam Deck, they're highly recommended for all platforms, especially handheld devices where sudden shutdowns are common:
- Sync save data frequently (after each level, checkpoint, or significant progress)
- Always sync before displaying "quit game" confirmations
- Consider background sync during gameplay transitions
- Implement sync progress indicators to ensure completion before shutdown

### Complete Steam Deck Implementation

For comprehensive Steam Deck implementation details, including:
- Detailed authentication flow setup
- Complete UI callback implementation
- Step-by-step initialization sequence
- Troubleshooting guide
- Sample code references

**See the dedicated [Steam Deck Implementation Guide](steam-deck-implementation.md)**

> [!TIP]
> Start with the requirements in this document first, then move to the Steam Deck guide for platform-specific implementation details.

## 6. Implementation Checklist

### Getting Started (New Implementations)

- [ ] **Set up October 2025 GDK** and verify installation
- [ ] **Configure build system** with correct GDK paths and library references
- [ ] **Add Unified SDK libraries** to your project linking configuration
- [ ] **Include required headers** in your source code
- [ ] **Implement initialization sequence** following the Unified SDK pattern
- [ ] **Set up DLL deployment** for Steam builds (4 required DLLs, 1 optional)
- [ ] **Test basic functionality** on your target platforms

### Migration (Existing Implementations)

- [ ] **Update build system paths** from old GDK structure to new layout
- [ ] **Replace standalone libraries** with Unified SDK components
- [ ] **Update header includes** to use new Unified SDK headers
- [ ] **Modify initialization sequence** to use new Unified SDK APIs
- [ ] **Update cleanup sequence** with proper async cleanup pattern
- [ ] **Add additional DLLs** to Steam deployment (1 DLL → 4-5 DLLs)
- [ ] **Verify functionality** remains intact after migration

### Build System Configuration

- [ ] **Include paths**: Set to `$(GDK)\windows\include` (or platform equivalent)
- [ ] **Library paths**: Set to `$(GDK)\windows\lib\x64` (or platform equivalent)
- [ ] **Link libraries**: Add required .lib files to linker dependencies (4 required, 1 optional)
- [ ] **DLL deployment**: Configure automatic copying for Steam builds
- [ ] **Platform detection**: Add logic if building for multiple platforms

### Code Implementation Tasks

- [ ] **Headers**: Include all required Unified SDK headers
- [ ] **Initialization**: Implement proper 5-step initialization sequence
- [ ] **Error handling**: Add appropriate error checking for each initialization step
- [ ] **Cleanup**: Implement reverse-order cleanup with async patterns
- [ ] **Configuration**: Replace hardcoded values with your PlayFab Title ID and endpoint

### Testing Requirements

- [ ] **Windows PC**: Verify Game Saves functionality
- [ ] **Steam Deck**: Complete implementation using the [Steam Deck Implementation Guide](steam-deck-implementation.md)
- [ ] **Microsoft Store**: Confirm no regression in functionality
- [ ] **Cross-platform**: Test save sync between all platforms (PC, Steam Deck, Xbox)

## 7. Resources and Support

### Documentation Links
- [Game Saves Overview](overview.md)
- [Game Saves Quickstart](quickstart.md)
- [Steam Deck Implementation Guide](steam-deck-implementation.md)

### Sample Code References
- **Windows Game Saves Sample**: [PlayFabGameSaveSample-Windows](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/All/PlayFabGameSaveSample-Windows)
  - `GameSaveIntegration.cpp/.h` - Core Game Saves integration
  - `SteamIntegration.cpp/.h` - Steam Deck specific implementation (see Steam Deck guide)
  - `GameSaveIntegrationUI.cpp/.h` - UI callback implementations (see Steam Deck guide)