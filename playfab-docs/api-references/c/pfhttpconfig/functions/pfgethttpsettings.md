---
author: jasonsandlin
title: "PFGetHttpSettings"
description: "Gets the current generic HTTP settings for the SDK."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGetHttpSettings  

Gets the current generic HTTP settings for the SDK.  

## Syntax  
  
```cpp
HRESULT PFGetHttpSettings(  
    PFHttpSettings* settings  
)  
```  
  
### Parameters  
  
**`settings`** &nbsp; [PFHttpSettings*](../structs/pfhttpsettings.md)  
*output*  
  
Pointer to generic settings that will be populated.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFHttpConfig.h
  
## See also  
[PFHttpConfig members](../pfhttpconfig_members.md)  

  
  
