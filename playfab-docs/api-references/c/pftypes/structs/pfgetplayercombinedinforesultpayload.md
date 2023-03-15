---
author: jasonsandlin
title: "PFGetPlayerCombinedInfoResultPayload"
description: "PFGetPlayerCombinedInfoResultPayload data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGetPlayerCombinedInfoResultPayload  

PFGetPlayerCombinedInfoResultPayload data model.  

## Syntax  
  
```cpp
typedef struct PFGetPlayerCombinedInfoResultPayload {  
    PFUserAccountInfo const* accountInfo;  
    PFCharacterInventory const* characterInventories;  
    uint32_t characterInventoriesCount;  
    PFCharacterResult const* characterList;  
    uint32_t characterListCount;  
    PFPlayerProfileModel const* playerProfile;  
    PFStatisticValue const* playerStatistics;  
    uint32_t playerStatisticsCount;  
    uint32_t titleDataCount;  
    uint32_t userDataCount;  
    uint32_t userDataVersion;  
    PFItemInstance const* userInventory;  
    uint32_t userInventoryCount;  
    uint32_t userReadOnlyDataCount;  
    uint32_t userReadOnlyDataVersion;  
    uint32_t userVirtualCurrencyCount;  
    uint32_t userVirtualCurrencyRechargeTimesCount;  
} PFGetPlayerCombinedInfoResultPayload;  
```
  
### Members  
  
**`accountInfo`** &nbsp; [PFUserAccountInfo](pfuseraccountinfo.md) const*  
*may be nullptr*  
  
(Optional) Account information for the user. This is always retrieved.
  
**`characterInventories`** &nbsp; [PFCharacterInventory](pfcharacterinventory.md) const*  
*array of size `characterInventoriesCount`*  
  
(Optional) Inventories for each character for the user.
  
**`characterInventoriesCount`** &nbsp; uint32_t  
  
Count of characterInventories
  
**`characterList`** &nbsp; [PFCharacterResult](pfcharacterresult.md) const*  
*array of size `characterListCount`*  
  
(Optional) List of characters for the user.
  
**`characterListCount`** &nbsp; uint32_t  
  
Count of characterList
  
**`playerProfile`** &nbsp; [PFPlayerProfileModel](pfplayerprofilemodel.md) const*  
*may be nullptr*  
  
(Optional) The profile of the players. This profile is not guaranteed to be up-to-date. For a new player, this profile will not exist.
  
**`playerStatistics`** &nbsp; [PFStatisticValue](pfstatisticvalue.md) const*  
*array of size `playerStatisticsCount`*  
  
(Optional) List of statistics for this player.
  
**`playerStatisticsCount`** &nbsp; uint32_t  
  
Count of playerStatistics
  
**`titleDataCount`** &nbsp; uint32_t  
*array of size `titleDataCount`*  
  
(Optional) Title data for this title.
  
**`userDataCount`** &nbsp; uint32_t  
*array of size `userDataCount`*  
  
(Optional) User specific custom data.
  
**`userDataVersion`** &nbsp; uint32_t  
  
The version of the UserData that was returned.
  
**`userInventory`** &nbsp; [PFItemInstance](pfiteminstance.md) const*  
*array of size `userInventoryCount`*  
  
(Optional) Array of inventory items in the user's current inventory.
  
**`userInventoryCount`** &nbsp; uint32_t  
  
Count of userInventory
  
**`userReadOnlyDataCount`** &nbsp; uint32_t  
*array of size `userReadOnlyDataCount`*  
  
(Optional) User specific read-only data.
  
**`userReadOnlyDataVersion`** &nbsp; uint32_t  
  
The version of the Read-Only UserData that was returned.
  
**`userVirtualCurrencyCount`** &nbsp; uint32_t  
*array of size `userVirtualCurrencyCount`*  
  
(Optional) Dictionary of virtual currency balance(s) belonging to the user.
  
**`userVirtualCurrencyRechargeTimesCount`** &nbsp; uint32_t  
*array of size `userVirtualCurrencyRechargeTimesCount`*  
  
(Optional) Dictionary of remaining times and timestamps for virtual currencies.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
