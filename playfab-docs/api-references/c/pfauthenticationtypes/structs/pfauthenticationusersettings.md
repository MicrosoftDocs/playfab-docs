---
author: jasonsandlin
title: "PFAuthenticationUserSettings"
description: "PFAuthenticationUserSettings data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFAuthenticationUserSettings  

PFAuthenticationUserSettings data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationUserSettings {  
    bool gatherDeviceInfo;  
    bool gatherFocusInfo;  
    bool needsAttribution;  
} PFAuthenticationUserSettings;  
```
  
### Members  
  
**`gatherDeviceInfo`** &nbsp; bool  
  
Boolean for whether this player is eligible for gathering device info.
  
**`gatherFocusInfo`** &nbsp; bool  
  
Boolean for whether this player should report OnFocus play-time tracking.
  
**`needsAttribution`** &nbsp; bool  
  
Boolean for whether this player is eligible for ad tracking.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
