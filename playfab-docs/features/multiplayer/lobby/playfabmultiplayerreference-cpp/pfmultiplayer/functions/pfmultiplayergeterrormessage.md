---
author: ScottMunroMS
title: "PFMultiplayerGetErrorMessage"
description: PFMultiplayerGetErrorMessage will get the human-readable form of an error. The memory for the returned string remains valid for the lifetime of the process.
ms.author: scmunro
ms.topic: reference
ms.service: playfab
ms.date: 03/11/2022
---

# PFMultiplayerGetErrorMessage  

Get the human-readable form of an error.  

## Syntax  
  
```cpp
const char * PFMultiplayerGetErrorMessage(  
    HRESULT error  
)  
```  
  
### Parameters  
  
**`error`** &nbsp; HRESULT  
  
An error code.  
  
  
### Return value
Type: const char *
  
The human-readable error message. The memory for the returned string remains valid for the lifetime of the process.
  
## Remarks  
  
These error messages are not localized and are only intended for developers, i.e. these error messages are not intended to be shown to users via UI.
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  

  
  
