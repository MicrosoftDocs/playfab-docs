---
author: jasonsandlin
title: "PFCatalogPublishDraftItemAsync"
description: "Initiates a publish of an item from the working catalog to the public catalog. You can use the GetItemPublishStatus API to track the state of the item publish."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogPublishDraftItemAsync  

Initiates a publish of an item from the working catalog to the public catalog. You can use the GetItemPublishStatus API to track the state of the item publish.  

## Syntax  
  
```cpp
HRESULT PFCatalogPublishDraftItemAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogPublishDraftItemRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogPublishDraftItemRequest*](../../pfcatalogtypes/structs/pfcatalogpublishdraftitemrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. The call kicks off a workflow to publish the item to the public catalog. The Publish Status API should be used to monitor the publish job. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_DATABASE_THROUGHPUT_EXCEEDED, E_PF_ITEM_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
