---
author: jasonsandlin
title: "PFMultiplayerServerBuildRegion"
description: "PFMultiplayerServerBuildRegion data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerBuildRegion  

PFMultiplayerServerBuildRegion data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerBuildRegion {  
    PFMultiplayerServerCurrentServerStats const* currentServerStats;  
    PFMultiplayerServerDynamicStandbySettings const* dynamicStandbySettings;  
    bool isAssetReplicationComplete;  
    int32_t maxServers;  
    int32_t const* multiplayerServerCountPerVm;  
    const char* region;  
    PFMultiplayerServerScheduledStandbySettings const* scheduledStandbySettings;  
    int32_t standbyServers;  
    const char* status;  
    PFMultiplayerServerAzureVmSize const* vmSize;  
} PFMultiplayerServerBuildRegion;  
```
  
### Members  
  
**`currentServerStats`** &nbsp; [PFMultiplayerServerCurrentServerStats](pfmultiplayerservercurrentserverstats.md) const*  
*may be nullptr*  
  
(Optional) The current multiplayer server stats for the region.
  
**`dynamicStandbySettings`** &nbsp; [PFMultiplayerServerDynamicStandbySettings](pfmultiplayerserverdynamicstandbysettings.md) const*  
*may be nullptr*  
  
(Optional) Optional settings to control dynamic adjustment of standby target.
  
**`isAssetReplicationComplete`** &nbsp; bool  
  
Whether the game assets provided for the build have been replicated to this region.
  
**`maxServers`** &nbsp; int32_t  
  
The maximum number of multiplayer servers for the region.
  
**`multiplayerServerCountPerVm`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Regional override for the number of multiplayer servers to host on a single VM of the build.
  
**`region`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The build region.
  
**`scheduledStandbySettings`** &nbsp; [PFMultiplayerServerScheduledStandbySettings](pfmultiplayerserverscheduledstandbysettings.md) const*  
*may be nullptr*  
  
(Optional) Optional settings to set the standby target to specified values during the supplied schedules.
  
**`standbyServers`** &nbsp; int32_t  
  
The target number of standby multiplayer servers for the region.
  
**`status`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The status of multiplayer servers in the build region. Valid values are - Unknown, Initialized, Deploying, Deployed, Unhealthy, Deleting, Deleted.
  
**`vmSize`** &nbsp; [PFMultiplayerServerAzureVmSize](../enums/pfmultiplayerserverazurevmsize.md) const*  
*may be nullptr*  
  
(Optional) Regional override for the VM size the build was created on.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
