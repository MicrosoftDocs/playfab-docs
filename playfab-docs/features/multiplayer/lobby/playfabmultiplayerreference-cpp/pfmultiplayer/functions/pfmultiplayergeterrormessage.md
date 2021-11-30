---
author: tomcoMSFT
title: "PFMultiplayerGetErrorMessage"
description: "Get the human-readable form of an error."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 10/28/2021
---

# PFMultiplayerGetErrorMessage  

Get the human-readable form of an error.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerGetErrorMessage(  
    HRESULT error,  
    const char** errorMessage  
)  
```  
  
### Parameters  
  
**`error`** &nbsp; HRESULT  
  
An error code.  
  
**`errorMessage`** &nbsp; char**  
*library-allocated output*  
  
The output, human-readable error message. The memory for the returned string remains valid for the lifetime of the process.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise.
  
## Remarks  
  
These error messages are not localized and are only intended for developers, i.e. these error messages are not intended to be shown to users via UI.
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  

  
  
