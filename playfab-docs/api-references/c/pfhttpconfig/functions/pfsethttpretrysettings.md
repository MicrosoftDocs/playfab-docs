---
author: jasonsandlin
title: "PFSetHttpRetrySettings"
description: "Sets global HTTP retry settings for the SDK."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFSetHttpRetrySettings  

Sets global HTTP retry settings for the SDK.  

## Syntax  
  
```cpp
HRESULT PFSetHttpRetrySettings(  
    const PFHttpRetrySettings* settings  
)  
```  
  
### Parameters  
  
**`settings`** &nbsp; [PFHttpRetrySettings*](../structs/pfhttpretrysettings.md)  
  
Pointer to retry settings.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFHttpConfig.h
  
## See also  
[PFHttpConfig members](../pfhttpconfig_members.md)  

  
  
