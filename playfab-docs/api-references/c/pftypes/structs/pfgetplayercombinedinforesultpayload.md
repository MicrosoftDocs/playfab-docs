---
author: jasonsandlin
title: "PFGetPlayerCombinedInfoResultPayload"
description: "PFGetPlayerCombinedInfoResultPayload data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
    PFStringDictionaryEntry const* titleData;  
    uint32_t titleDataCount;  
    PFUserDataRecordDictionaryEntry const* userData;  
    uint32_t userDataCount;  
    uint32_t userDataVersion;  
    PFItemInstance const* userInventory;  
    uint32_t userInventoryCount;  
    PFUserDataRecordDictionaryEntry const* userReadOnlyData;  
    uint32_t userReadOnlyDataCount;  
    uint32_t userReadOnlyDataVersion;  
    PFInt32DictionaryEntry const* userVirtualCurrency;  
    uint32_t userVirtualCurrencyCount;  
    PFVirtualCurrencyRechargeTimeDictionaryEntry const* userVirtualCurrencyRechargeTimes;  
    uint32_t userVirtualCurrencyRechargeTimesCount;  
} PFGetPlayerCombinedInfoResultPayload;  
```
  
### Members  
  
**`accountInfo`** &nbsp; [PFUserAccountInfo](pfuseraccountinfo.md) const*  
*may be nullptr*  
  
(Optional) Account information for the user. This is always retrieved.
  
**`characterInventories`** &nbsp; [PFCharacterInventory](pfcharacterinventory.md) const*  
*may be nullptr*  
  
(Optional) Inventories for each character for the user.
  
**`characterInventoriesCount`** &nbsp; uint32_t  
  
Count of characterInventories
  
**`characterList`** &nbsp; [PFCharacterResult](pfcharacterresult.md) const*  
*may be nullptr*  
  
(Optional) List of characters for the user.
  
**`characterListCount`** &nbsp; uint32_t  
  
Count of characterList
  
**`playerProfile`** &nbsp; [PFPlayerProfileModel](pfplayerprofilemodel.md) const*  
*may be nullptr*  
  
(Optional) The profile of the players. This profile is not guaranteed to be up-to-date. For a new player, this profile will not exist.
  
**`playerStatistics`** &nbsp; [PFStatisticValue](pfstatisticvalue.md) const*  
*may be nullptr*  
  
(Optional) List of statistics for this player.
  
**`playerStatisticsCount`** &nbsp; uint32_t  
  
Count of playerStatistics
  
**`titleData`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) Title data for this title.
  
**`titleDataCount`** &nbsp; uint32_t  
  
Count of titleData
  
**`userData`** &nbsp; PFUserDataRecordDictionaryEntry const*  
*may be nullptr*  
  
(Optional) User specific custom data.
  
**`userDataCount`** &nbsp; uint32_t  
  
Count of userData
  
**`userDataVersion`** &nbsp; uint32_t  
  
The version of the UserData that was returned.
  
**`userInventory`** &nbsp; [PFItemInstance](pfiteminstance.md) const*  
*may be nullptr*  
  
(Optional) Array of inventory items in the user's current inventory.
  
**`userInventoryCount`** &nbsp; uint32_t  
  
Count of userInventory
  
**`userReadOnlyData`** &nbsp; PFUserDataRecordDictionaryEntry const*  
*may be nullptr*  
  
(Optional) User specific read-only data.
  
**`userReadOnlyDataCount`** &nbsp; uint32_t  
  
Count of userReadOnlyData
  
**`userReadOnlyDataVersion`** &nbsp; uint32_t  
  
The version of the Read-Only UserData that was returned.
  
**`userVirtualCurrency`** &nbsp; PFInt32DictionaryEntry const*  
*may be nullptr*  
  
(Optional) Dictionary of virtual currency balance(s) belonging to the user.
  
**`userVirtualCurrencyCount`** &nbsp; uint32_t  
  
Count of userVirtualCurrency
  
**`userVirtualCurrencyRechargeTimes`** &nbsp; PFVirtualCurrencyRechargeTimeDictionaryEntry const*  
*may be nullptr*  
  
(Optional) Dictionary of remaining times and timestamps for virtual currencies.
  
**`userVirtualCurrencyRechargeTimesCount`** &nbsp; uint32_t  
  
Count of userVirtualCurrencyRechargeTimes
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
