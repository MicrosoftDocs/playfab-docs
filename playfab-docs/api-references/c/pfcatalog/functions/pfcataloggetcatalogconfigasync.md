---
author: jasonsandlin
title: "PFCatalogGetCatalogConfigAsync"
description: "Gets the configuration for the catalog. Only Title Entities can call this API. There is a limit of 100 requests in 10 seconds for this API. More information about the Catalog Config can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/settings"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogGetCatalogConfigAsync  

Gets the configuration for the catalog. Only Title Entities can call this API. There is a limit of 100 requests in 10 seconds for this API. More information about the Catalog Config can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/settings  

## Syntax  
  
```cpp
HRESULT PFCatalogGetCatalogConfigAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetCatalogConfigRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetCatalogConfigRequest*](../../pfcatalogtypes/structs/pfcataloggetcatalogconfigrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. When the asynchronous task is complete, call [PFCatalogGetCatalogConfigGetResultSize](pfcataloggetcatalogconfiggetresultsize.md) and [PFCatalogGetCatalogConfigGetResult](pfcataloggetcatalogconfiggetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
