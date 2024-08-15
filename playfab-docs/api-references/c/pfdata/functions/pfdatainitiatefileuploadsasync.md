---
author: jasonsandlin
title: "PFDataInitiateFileUploadsAsync"
description: "Initiates file uploads to an entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataInitiateFileUploadsAsync  

Initiates file uploads to an entity's profile.  

## Syntax  
  
```cpp
HRESULT PFDataInitiateFileUploadsAsync(  
    PFEntityHandle entityHandle,  
    const PFDataInitiateFileUploadsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFDataInitiateFileUploadsRequest*](../../pfdatatypes/structs/pfdatainitiatefileuploadsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Returns URLs that may be used to upload the files for a profile 5 minutes. After using the upload calls FinalizeFileUploads must be called to move the file status from pending to live. See also FileAbortFileUploadsAsync, FileDeleteFilesAsync, FileFinalizeFileUploadsAsync, FileGetFilesAsync. When the asynchronous task is complete, call [PFDataInitiateFileUploadsGetResultSize](pfdatainitiatefileuploadsgetresultsize.md) and [PFDataInitiateFileUploadsGetResult](pfdatainitiatefileuploadsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
