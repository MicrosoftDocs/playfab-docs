---
author: jdeweyMSFT
title: "PartyManager::GetErrorMessage"
description: Get the human-readable form of an error.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 08/05/2020
---

# PartyManager::GetErrorMessage  

Get the human-readable form of an error.  

## Syntax  
  
```cpp
PartyError GetErrorMessage(  
    PartyError error,  
    PartyString* errorMessage  
)  
```  
  
### Parameters  
  
**`error`** &nbsp; PartyError  
  
An error code.  
  
**`errorMessage`** &nbsp; [PartyString*](../../../typedefs.md)  
*library-allocated output*  
  
The output, human-readable error message. The memory for the returned string remains valid for the lifetime of the process.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise.
  
## Remarks  
  
These error messages are not localized and are only intended for developers, i.e. these error messages are not intended to be shown to users via UI.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  

  
  
