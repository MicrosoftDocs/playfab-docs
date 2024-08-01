---
author: jasonsandlin
title: "PFAccountManagementServerDeletePlayerAsync"
description: "Removes a user's player account from a title and deletes all associated data"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerDeletePlayerAsync  

Removes a user's player account from a title and deletes all associated data  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerDeletePlayerAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementDeletePlayerRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementDeletePlayerRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementdeleteplayerrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Deletes all data associated with the player, including statistics, custom data, inventory, purchases, virtual currency balances, characters and shared group memberships. Removes the player from all leaderboards and player search indexes. Does not delete PlayStream event history associated with the player. Does not delete the publisher user account that created the player in the title nor associated data such as username, password, email address, account linkages, or friends list. Note, this API queues the player for deletion and returns immediately. It may take several minutes or more before all player data is fully deleted. Until the player data is fully deleted, attempts to recreate the player with the same user account in the same title will fail with the 'AccountDeleted' error. This API must be enabled for use as an option in the game manager website. It is disabled by default. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_API_NOT_ENABLED_FOR_GAME_SERVER_ACCESS or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
