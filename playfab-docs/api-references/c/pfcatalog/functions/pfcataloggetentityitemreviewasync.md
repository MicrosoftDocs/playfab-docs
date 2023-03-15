---
author: jasonsandlin
title: "PFCatalogGetEntityItemReviewAsync"
description: "Gets the submitted review for the specified item by the authenticated entity."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetEntityItemReviewAsync  

Gets the submitted review for the specified item by the authenticated entity.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetEntityItemReviewAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetEntityItemReviewRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetEntityItemReviewRequest*](../../pfcatalogtypes/structs/pfcataloggetentityitemreviewrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
If successful, call [PFCatalogGetEntityItemReviewGetResult](pfcataloggetentityitemreviewgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
