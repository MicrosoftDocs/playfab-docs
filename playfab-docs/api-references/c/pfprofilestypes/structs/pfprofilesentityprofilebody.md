---
author: jasonsandlin
title: "PFProfilesEntityProfileBody"
description: "PFProfilesEntityProfileBody data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFProfilesEntityProfileBody  

PFProfilesEntityProfileBody data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityProfileBody {  
    const char* avatarUrl;  
    time_t created;  
    const char* displayName;  
    PFEntityKey const* entity;  
    const char* entityChain;  
    const char* const* experimentVariants;  
    uint32_t experimentVariantsCount;  
    uint32_t filesCount;  
    const char* language;  
    const char* leaderboardMetadata;  
    PFEntityLineage const* lineage;  
    uint32_t objectsCount;  
    PFProfilesEntityPermissionStatement const* permissions;  
    uint32_t permissionsCount;  
    uint32_t statisticsCount;  
    int32_t versionNumber;  
} PFProfilesEntityProfileBody;  
```
  
### Members  
  
**`avatarUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Avatar URL for the entity.
  
**`created`** &nbsp; time_t  
  
The creation time of this profile in UTC.
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The display name of the entity. This field may serve different purposes for different entity types. i.e.: for a title player account it could represent the display name of the player, whereas on a character it could be character's name.
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`entityChain`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The chain of responsibility for this entity. Use Lineage.
  
**`experimentVariants`** &nbsp; const char* const*  
*array of size `experimentVariantsCount`*  
  
(Optional) The experiment variants of this profile.
  
**`experimentVariantsCount`** &nbsp; uint32_t  
  
Count of experimentVariants
  
**`filesCount`** &nbsp; uint32_t  
*array of size `filesCount`*  
  
(Optional) The files on this profile.
  
**`language`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The language on this profile.
  
**`leaderboardMetadata`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Leaderboard metadata for the entity.
  
**`lineage`** &nbsp; [PFEntityLineage](../../pftypes/structs/pfentitylineage.md) const*  
*may be nullptr*  
  
(Optional) The lineage of this profile.
  
**`objectsCount`** &nbsp; uint32_t  
*array of size `objectsCount`*  
  
(Optional) The objects on this profile.
  
**`permissions`** &nbsp; [PFProfilesEntityPermissionStatement](pfprofilesentitypermissionstatement.md) const*  
*array of size `permissionsCount`*  
  
(Optional) The permissions that govern access to this entity profile and its properties. Only includes permissions set on this profile, not global statements from titles and namespaces.
  
**`permissionsCount`** &nbsp; uint32_t  
  
Count of permissions
  
**`statisticsCount`** &nbsp; uint32_t  
*array of size `statisticsCount`*  
  
(Optional) The statistics on this profile.
  
**`versionNumber`** &nbsp; int32_t  
  
The version number of the profile in persistent storage at the time of the read. Used for optional optimistic concurrency during update.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
