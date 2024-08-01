---
author: jasonsandlin
title: "PFHCHttpCallCreate"
description: "Creates an HTTP call handle."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallCreate  

Creates an HTTP call handle.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallCreate(  
    PFHCCallHandle* call  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle*  
*output*  
  
The handle of the HTTP call.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
First create a HTTP handle using PFHCHttpCallCreate(). Then call PFHCHttpCallRequestSet*() to prepare the PFHCCallHandle. Then call PFHCHttpCallPerformAsync() to perform HTTP call using the PFHCCallHandle. This call is asynchronous, so the work will be done on a background thread and will return via the callback. The perform call is asynchronous, so the work will be done on a background thread which calls XTaskQueueDispatch(..., XTaskQueuePort::Work). The results will return to the callback on the thread that calls XTaskQueueDispatch(..., XTaskQueuePort::Completion), then get the result of the HTTP call by calling PFHCHttpCallResponseGet*() to get the HTTP response of the PFHCCallHandle. When the PFHCCallHandle is no longer needed, call PFHCHttpCallCloseHandle() to free the memory associated with the PFHCCallHandle.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
