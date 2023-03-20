---
author: jasonsandlin
title: "PFCatalogPublishDraftItemAsync"
description: "Initiates a publish of an item from the working catalog to the public catalog."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogPublishDraftItemAsync  

Initiates a publish of an item from the working catalog to the public catalog.  

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
  
The call kicks off a workflow to publish the item to the public catalog. The Publish Status API should be used to monitor the publish job. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
