---
author: jasonsandlin
title: "PFProfilesGetProfileGetResultSize"
description: "Get the size in bytes needed to store the result of a GetProfile call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFProfilesGetProfileGetResultSize  

Get the size in bytes needed to store the result of a GetProfile call.  

## Syntax  
  
```cpp
HRESULT PFProfilesGetProfileGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFProfiles.h
  
## See also  
[PFProfiles members](../pfprofiles_members.md)  

  
  
