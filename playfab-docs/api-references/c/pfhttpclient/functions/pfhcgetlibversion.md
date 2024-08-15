---
author: jasonsandlin
title: "PFHCGetLibVersion"
description: "Returns the version of the library."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCGetLibVersion  

Returns the version of the library.  

## Syntax  
  
```cpp
HRESULT PFHCGetLibVersion(  
    const char** version  
)  
```  
  
### Parameters  
  
**`version`** &nbsp; char**  
*library-allocated output*  
  
The UTF-8 encoded version of the library in the format of release_year.release_month.date.rev  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
