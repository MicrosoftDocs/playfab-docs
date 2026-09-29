---
author: jasonsandlin
title: "PFGetHttpRetrySettings"
description: "Gets the current HTTP retry settings for the SDK."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGetHttpRetrySettings  

Gets the current HTTP retry settings for the SDK.  

## Syntax  
  
```cpp
HRESULT PFGetHttpRetrySettings(  
    PFHttpRetrySettings* settings  
)  
```  
  
### Parameters  
  
**`settings`** &nbsp; [PFHttpRetrySettings*](../structs/pfhttpretrysettings.md)  
*output*  
  
Pointer to retry settings that will be populated.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFHttpConfig.h
  
## See also  
[PFHttpConfig members](../pfhttpconfig_members.md)  

  
  
