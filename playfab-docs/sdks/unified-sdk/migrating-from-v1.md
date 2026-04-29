---
title: "Migration Guide: PlayFab Standalone SDK (v1) to PlayFab Unified SDK (v2)"
author: Jeffrey-Shi
description: Complete guide for migrating from PlayFab v1 SDKs to the new Unified SDK v2
ms.author: jeffshi
ms.date: 09/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playfab sdk, unified sdk, migration, v2
ms.localizationpriority: medium
---

# Migration Guide: PlayFab Standalone SDK (v1) to PlayFab Unified SDK (v2)

This guide helps you migrate from the older PlayFab v1 SDKs to the new PlayFab Unified SDK v2. The unified SDK consolidates previously separate SDKs (Core, Services, Party, Multiplayer) into a single, integrated solution with improved interoperability and simplified authentication.

## Overview of Changes

The PlayFab Unified SDK v2 introduces several key improvements:

- **Unified architecture**: All PlayFab services (Core, Services, Party, Multiplayer, GameSave) are integrated into a single SDK
- **Simplified authentication**: One login provides access to all PlayFab services through entity handles
- **Automatic token management**: No more manual token refresh or entity ID management
- **Improved interoperability**: Seamless communication between different PlayFab services
- **Streamlined project structure**: Single SDK installation instead of multiple separate packages

## Project Structure Changes

### For GDK Users

**Legacy layout (GDK 2504 and earlier):**
- Separate extensions for each SDK component
- Individual include and library folders: PlayFab.Services.Cpp, PlayFab.Party.Cpp, PlayFab.Multiplayer.Cpp
- Each service had distinct ExtensionLibrary names in GDK
- Multiple downloads required for different PlayFab services from GitHub

**New layout (GDK 2510 and onward):**
- Single unified PlayFab SDK
- Platform-organized structure with subfolders (xbox, windows, etc.)
- All headers consolidated in one includes folder (Core, Services, Multiplayer, Party, GameSave)
- Combined libraries in unified lib folder

#### Updating Your Project References

During the transition period (GDK 2510), both old and new SDKs coexist. To migrate:

1. **Remove old references**: Delete references to PlayFab.Services.Cpp, PlayFab.Party.Cpp, and other individual SDK extensions
2. **Add unified reference**: Reference the new PlayFab Unified SDK or update include/library paths to the unified locations
3. **Plan for future**: Microsoft will remove old folders in future GDK releases (possibly by 2026), so update project files accordingly

### For GitHub/Standalone Users

- Replace multiple SDK downloads with the single unified SDK package
- Update project paths to use the new platform-organized folder structure


## Authentication and Entity Handling

The concept of entities and entity tokens exists in both versions, but how you use them has been simplified in v2.

### Token Management Changes

**PlayFab Standalone SDKs (v1) Approach:**
- Manual token retrieval using `PFAuthenticationGetEntityTokenAsync`
- Manual token refresh when tokens expire
- Passing entity ID and token strings to other services (e.g., `PartyCreateLocalUser(entityId, entityToken, ...)`)

**PlayFab Unified SDK (v2) Approach:**
- Automatic token management by the Core SDK
- Background token refresh before expiry
- Pass `PFEntityHandle` directly to other services (e.g., `PartyCreateLocalUser(partyHandle, entityHandle, ...)`)

### Migration Steps for Authentication

1. **Remove manual token management**: Delete code that manually retrieves or checks PlayFab tokens
2. **Store entity handles**: Keep the `PFEntityHandle` from login and use it across all PlayFab services
3. **Update service calls**: Replace entity ID/token parameters with entity handles
4. **Handle re-authentication**: Use `PFAuthenticationReLogin*Async` APIs for re-authentication scenarios

## Breaking API Changes by Component

### PlayFab Core

**Migration Impact**: Minimal changes required

- Most Core service calls remain unchanged
- Update include paths to point to unified SDK headers

### PlayFab Services

**Migration Impact**: Minimal changes required

- Most Service calls remain unchanged
- Update include paths to point to unified SDK headers

### PlayFab Party (Networking/Voice)

**Migration Impact**: Small changes required

#### Initialization Changes

**v1 Initialization:**
```cpp
PartyInitialize("YOUR_PLAYFAB_TITLE_ID");
```

**v2 Initialization:**
```cpp
PARTY_INITIALIZATION_CONFIGURATION config{};
config.titleId = "YOUR_PLAYFAB_TITLE_ID";
config.memoryCallbacks = nullptr; // Use default or provide custom allocator
config.threadPool = nullptr;      // Use PlayFab Core queue or provide custom XTaskQueue
PartyInitialize(&config, &g_partyHandle);
```

#### Local User Creation Changes

**v1 Approach:**
```cpp
PartyCreateLocalUser(entityId, entityToken, &localUser);
```

**v2 Approach:**
```cpp
PartyCreateLocalUser(partyHandle, entityHandle, &localUser);
```

#### Migration Steps for Party

1. **Update initialization**: Replace simple `PartyInitialize()` call with configuration struct approach
2. **Remove token retrieval**: Delete any code that manually gets entity ID/token for Party
3. **Pass entity handles**: Use `PFEntityHandle` directly instead of string parameters
4. **Remove token refresh logic**: Delete code that periodically checks or refreshes Party tokens
5. **Update dependencies**: Ensure PlayFab Core is initialized before `PartyInitialize()`
6. **Remove Xbox-specific calls**: Replace `PartyXblManagerInitialize()` with generic `PartyInitialize()` on Xbox

### PlayFab Multiplayer (Lobby & Matchmaking)

**Migration Impact**: Small changes required

Core concepts (Lobby, matchmaking Ticket) remain the same, but functions now expect entity handles instead of strings.

#### Lobby Operations Changes

**v1 Approach:**
```cpp
PFLobbyJoin(lobbyHandle, playfabId, entityToken, ...);
```

**v2 Approach:**
```cpp
PFLobbyJoin(lobbyHandle, entityHandle, ...);
```

#### Migration Steps for Multiplayer

1. **Update function calls**: Replace PlayFab ID and entity token parameters with `PFEntityHandle`
2. **Remove authentication steps**: Delete separate "Authenticate Multiplayer" calls
3. **Initialize explicitly**: Call `PFMultiplayerInitialize()` and potentially `PFMultiplayerStartProcessing()`
4. **Update matchmaking**: Use entity handles in matchmaking ticket creation

## General Migration Checklist

### Code Updates

- [ ] **Update include paths**: Point to unified SDK include directory
- [ ] **Update library linking**: Link unified libraries instead of separate ones
- [ ] **Remove deprecated functions**: Delete calls to removed functions like `PartyCreateLocalUserWithEntityType`
- [ ] **Replace manual token management**: Remove token caching and refresh logic
- [ ] **Update initialization order**: Ensure PlayFab Core initializes before other services

### Testing Checklist

After migration, verify each subsystem:

- [ ] **Authentication**: Login returns valid entity handle
- [ ] **Lobby operations**: Create/join lobbies work correctly
- [ ] **Party networking**: Players can connect and communicate across machines
- [ ] **Error handling**: All PlayFab calls handle errors appropriately
- [ ] **Multi-user scenarios**: Multiple local users work if applicable

### Common Issues and Solutions

**Compiler errors about missing parameters**: 
- Check if function signatures changed to require `PFEntityHandle`
- Ensure you're passing the entity handle instead of string IDs

**Runtime authentication failures**:
- Verify PlayFab Core is initialized before other services
- Check that login completes before creating local users in Party/Multiplayer

**Performance regressions**:
- Rare, but verify v2 doesn't introduce issues in performance-critical code paths

## Benefits of Migration

### Code Simplification

- **Reduced complexity**: Remove workaround code for v1's service separation
- **Unified error handling**: All PlayFab services use consistent error reporting
- **Centralized authentication**: One login flow for all PlayFab features

### Improved Interoperability

- **Seamless integration**: Adding new PlayFab features requires minimal setup
- **Better multi-user support**: Unified SDK handles multiple local users more effectively
- **Consistent entity model**: Same authentication approach across all services

### Future-Proofing

- **Active development**: v2 is the actively maintained version
- **New features**: Future PlayFab capabilities will target the unified SDK
- **Long-term support**: v1 SDKs will eventually be deprecated

## Next Steps

1. **Update project structure**: Migrate to unified SDK layout
2. **Refactor authentication**: Implement entity handle-based approach
3. **Test thoroughly**: Validate all PlayFab functionality works correctly
4. **Clean up code**: Remove deprecated v1 workarounds and manual token management
5. **Monitor performance**: Ensure migration doesn't introduce performance issues

For additional help, refer to the PlayFab Unified SDK documentation and samples for your specific platform.