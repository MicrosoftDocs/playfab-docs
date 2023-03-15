---
author: jasonsandlin
title: "PFCatalogCreateUploadUrlsAsync"
description: "Creates one or more upload URLs which can be used by the client to upload raw file data."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogCreateUploadUrlsAsync  

Creates one or more upload URLs which can be used by the client to upload raw file data.  

## Syntax  
  
```cpp
HRESULT PFCatalogCreateUploadUrlsAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogCreateUploadUrlsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogCreateUploadUrlsRequest*](../../pfcatalogtypes/structs/pfcatalogcreateuploadurlsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure Storage Blob Service REST API pattern for uploading content. The response contains upload URLs and IDs for each file. The IDs and URLs returned must be added to the item metadata and committed using the CreateDraftItem or UpdateDraftItem Item APIs. If successful, call [PFCatalogCreateUploadUrlsGetResult](pfcatalogcreateuploadurlsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
