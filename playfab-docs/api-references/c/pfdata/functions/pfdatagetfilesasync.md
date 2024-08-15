---
author: jasonsandlin
title: "PFDataGetFilesAsync"
description: "Retrieves file metadata from an entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataGetFilesAsync  

Retrieves file metadata from an entity's profile.  

## Syntax  
  
```cpp
HRESULT PFDataGetFilesAsync(  
    PFEntityHandle entityHandle,  
    const PFDataGetFilesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFDataGetFilesRequest*](../../pfdatatypes/structs/pfdatagetfilesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Returns URLs that may be used to download the files for a profile for a limited length of time. Only returns files that have been successfully uploaded, files that are still pending will either return the old value, if it exists, or nothing. See also FileAbortFileUploadsAsync, FileDeleteFilesAsync, FileFinalizeFileUploadsAsync, FileInitiateFileUploadsAsync. When the asynchronous task is complete, call [PFDataGetFilesGetResultSize](pfdatagetfilesgetresultsize.md) and [PFDataGetFilesGetResult](pfdatagetfilesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
