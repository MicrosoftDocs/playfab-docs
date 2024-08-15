---
author: jasonsandlin
title: "PFHCHttpCallResponseSetResponseBodyWriteFunction"
description: "Sets a custom callback function that will be used to write the response body when the HTTP call is performed. Using a custom write callback will cause subsequent calls to PFHCHttpCallResponseGetResponseBodyBytesSize, PFHCHttpCallResponseGetResponseBodyBytes, and PFHCHttpCallGetResponseBodyString to fail as these are mutually exclusive."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseSetResponseBodyWriteFunction  

Sets a custom callback function that will be used to write the response body when the HTTP call is performed. Using a custom write callback will cause subsequent calls to PFHCHttpCallResponseGetResponseBodyBytesSize, PFHCHttpCallResponseGetResponseBodyBytes, and PFHCHttpCallGetResponseBodyString to fail as these are mutually exclusive.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseSetResponseBodyWriteFunction(  
    PFHCCallHandle call,  
    PFHCHttpCallResponseBodyWriteFunction writeFunction,  
    void* context  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`writeFunction`** &nbsp; PFHCHttpCallResponseBodyWriteFunction  
  
The response body write function this call should use.  
  
**`context`** &nbsp; void*  
*optional*  
  
The context to associate with this write function.  
  
  
### Return value
Type: HRESULT
  
Result code of this API operation. Possible values are S_OK or E_INVALIDARG.
  
## Remarks  
  
This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
