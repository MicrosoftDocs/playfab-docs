---
author: jasonsandlin
title: "PFCatalogUpdateCatalogConfigAsync"
description: "Updates the configuration for the catalog. Only Title Entities can call this API. There is a limit of 10 requests in 10 seconds for this API. More information about the Catalog Config can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/settings"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogUpdateCatalogConfigAsync  

Updates the configuration for the catalog. Only Title Entities can call this API. There is a limit of 10 requests in 10 seconds for this API. More information about the Catalog Config can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/settings  

## Syntax  
  
```cpp
HRESULT PFCatalogUpdateCatalogConfigAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogUpdateCatalogConfigRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogUpdateCatalogConfigRequest*](../../pfcatalogtypes/structs/pfcatalogupdatecatalogconfigrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_BILLING_INFORMATION_REQUIRED, E_PF_CATALOG_CONFIG_INVALID, E_PF_INVALID_ENTITY_TYPE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
