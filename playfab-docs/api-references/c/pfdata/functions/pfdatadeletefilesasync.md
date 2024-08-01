---
author: jasonsandlin
title: "PFDataDeleteFilesAsync"
description: "Delete files on an entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataDeleteFilesAsync  

Delete files on an entity's profile.  

## Syntax  
  
```cpp
HRESULT PFDataDeleteFilesAsync(  
    PFEntityHandle entityHandle,  
    const PFDataDeleteFilesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFDataDeleteFilesRequest*](../../pfdatatypes/structs/pfdatadeletefilesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Deletes the requested files from the entity's profile. See also FileAbortFileUploadsAsync, FileFinalizeFileUploadsAsync, FileGetFilesAsync, FileInitiateFileUploadsAsync. When the asynchronous task is complete, call [PFDataDeleteFilesGetResultSize](pfdatadeletefilesgetresultsize.md) and [PFDataDeleteFilesGetResult](pfdatadeletefilesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
