---
author: jasonsandlin
title: "PFGetPlayerCombinedInfoRequestParams"
description: "PFGetPlayerCombinedInfoRequestParams data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGetPlayerCombinedInfoRequestParams  

PFGetPlayerCombinedInfoRequestParams data model.  

## Syntax  
  
```cpp
typedef struct PFGetPlayerCombinedInfoRequestParams {  
    bool getCharacterInventories;  
    bool getCharacterList;  
    bool getPlayerProfile;  
    bool getPlayerStatistics;  
    bool getTitleData;  
    bool getUserAccountInfo;  
    bool getUserData;  
    bool getUserInventory;  
    bool getUserReadOnlyData;  
    bool getUserVirtualCurrency;  
    const char* const* playerStatisticNames;  
    uint32_t playerStatisticNamesCount;  
    PFPlayerProfileViewConstraints const* profileConstraints;  
    const char* const* titleDataKeys;  
    uint32_t titleDataKeysCount;  
    const char* const* userDataKeys;  
    uint32_t userDataKeysCount;  
    const char* const* userReadOnlyDataKeys;  
    uint32_t userReadOnlyDataKeysCount;  
} PFGetPlayerCombinedInfoRequestParams;  
```
  
### Members  
  
**`getCharacterInventories`** &nbsp; bool  
  
Whether to get character inventories. Defaults to false.
  
**`getCharacterList`** &nbsp; bool  
  
Whether to get the list of characters. Defaults to false.
  
**`getPlayerProfile`** &nbsp; bool  
  
Whether to get player profile. Defaults to false. Has no effect for a new player.
  
**`getPlayerStatistics`** &nbsp; bool  
  
Whether to get player statistics. Defaults to false.
  
**`getTitleData`** &nbsp; bool  
  
Whether to get title data. Defaults to false.
  
**`getUserAccountInfo`** &nbsp; bool  
  
Whether to get the player's account Info. Defaults to false.
  
**`getUserData`** &nbsp; bool  
  
Whether to get the player's custom data. Defaults to false.
  
**`getUserInventory`** &nbsp; bool  
  
Whether to get the player's inventory. Defaults to false.
  
**`getUserReadOnlyData`** &nbsp; bool  
  
Whether to get the player's read only data. Defaults to false.
  
**`getUserVirtualCurrency`** &nbsp; bool  
  
Whether to get the player's virtual currency balances. Defaults to false.
  
**`playerStatisticNames`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Specific statistics to retrieve. Leave null to get all keys. Has no effect if GetPlayerStatistics is false.
  
**`playerStatisticNamesCount`** &nbsp; uint32_t  
  
Count of playerStatisticNames
  
**`profileConstraints`** &nbsp; [PFPlayerProfileViewConstraints](pfplayerprofileviewconstraints.md) const*  
*may be nullptr*  
  
(Optional) Specifies the properties to return from the player profile. Defaults to returning the player's display name.
  
**`titleDataKeys`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Specific keys to search for in the custom data. Leave null to get all keys. Has no effect if GetTitleData is false.
  
**`titleDataKeysCount`** &nbsp; uint32_t  
  
Count of titleDataKeys
  
**`userDataKeys`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Specific keys to search for in the custom data. Leave null to get all keys. Has no effect if GetUserData is false.
  
**`userDataKeysCount`** &nbsp; uint32_t  
  
Count of userDataKeys
  
**`userReadOnlyDataKeys`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Specific keys to search for in the custom data. Leave null to get all keys. Has no effect if GetUserReadOnlyData is false.
  
**`userReadOnlyDataKeysCount`** &nbsp; uint32_t  
  
Count of userReadOnlyDataKeys
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
