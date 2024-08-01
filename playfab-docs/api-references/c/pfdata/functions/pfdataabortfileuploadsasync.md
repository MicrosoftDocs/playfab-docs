---
author: jasonsandlin
title: "PFDataAbortFileUploadsAsync"
description: "Abort pending file uploads to an entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataAbortFileUploadsAsync  

Abort pending file uploads to an entity's profile.  

## Syntax  
  
```cpp
HRESULT PFDataAbortFileUploadsAsync(  
    PFEntityHandle entityHandle,  
    const PFDataAbortFileUploadsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFDataAbortFileUploadsRequest*](../../pfdatatypes/structs/pfdataabortfileuploadsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Aborts the pending upload of the requested files. See also FileDeleteFilesAsync, FileFinalizeFileUploadsAsync, FileGetFilesAsync, FileInitiateFileUploadsAsync. When the asynchronous task is complete, call [PFDataAbortFileUploadsGetResultSize](pfdataabortfileuploadsgetresultsize.md) and [PFDataAbortFileUploadsGetResult](pfdataabortfileuploadsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
