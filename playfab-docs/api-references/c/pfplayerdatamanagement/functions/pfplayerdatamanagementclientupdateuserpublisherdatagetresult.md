---
author: jasonsandlin
title: "PFPlayerDataManagementClientUpdateUserPublisherDataGetResult"
description: "Gets the result of a successful PFPlayerDataManagementClientUpdateUserPublisherDataAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFPlayerDataManagementClientUpdateUserPublisherDataGetResult  

Gets the result of a successful PFPlayerDataManagementClientUpdateUserPublisherDataAsync call.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementClientUpdateUserPublisherDataGetResult(  
    XAsyncBlock* async,  
    PFPlayerDataManagementUpdateUserDataResult* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; [PFPlayerDataManagementUpdateUserDataResult*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementupdateuserdataresult.md)  
*output*  
  
PFPlayerDataManagementUpdateUserDataResult object that will be populated with the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
