---
author: jasonsandlin
title: "PFCatalogReportItemAsync"
description: "Submit a report for an item, indicating in what way the item is inappropriate."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogReportItemAsync  

Submit a report for an item, indicating in what way the item is inappropriate.  

## Syntax  
  
```cpp
HRESULT PFCatalogReportItemAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogReportItemRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogReportItemRequest*](../../pfcatalogtypes/structs/pfcatalogreportitemrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
