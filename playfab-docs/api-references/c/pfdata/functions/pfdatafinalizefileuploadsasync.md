---
author: jasonsandlin
title: "PFDataFinalizeFileUploadsAsync"
description: "Finalize file uploads to an entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataFinalizeFileUploadsAsync  

Finalize file uploads to an entity's profile.  

## Syntax  
  
```cpp
HRESULT PFDataFinalizeFileUploadsAsync(  
    PFEntityHandle entityHandle,  
    const PFDataFinalizeFileUploadsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFDataFinalizeFileUploadsRequest*](../../pfdatatypes/structs/pfdatafinalizefileuploadsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Finalizes the upload of the requested files. Verifies that the files have been successfully uploaded and moves the file pointers from pending to live. See also FileAbortFileUploadsAsync, FileDeleteFilesAsync, FileGetFilesAsync, FileInitiateFileUploadsAsync. When the asynchronous task is complete, call [PFDataFinalizeFileUploadsGetResultSize](pfdatafinalizefileuploadsgetresultsize.md) and [PFDataFinalizeFileUploadsGetResult](pfdatafinalizefileuploadsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
