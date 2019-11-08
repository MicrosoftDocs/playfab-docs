---
author: alexatxbox
title: "PartyXblManager::GetErrorMessage"
description: Get the human-readable form of an error.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/08/2019
---

# PartyXblManager::GetErrorMessage  

Get the human-readable form of an error.  

## Syntax  
  
```cpp
PartyError GetErrorMessage(  
    PartyError error,  
    PartyString* errorMessage  
)  
```  
  
### Parameters  
  
**`error`** &nbsp; [PartyError](../../../../../networking/reference/typedefs.md)  
  
An error code.  
  
**`errorMessage`** &nbsp; [PartyString*](../../../../../networking/reference/typedefs.md)  
*library-allocated output*  
  
The output, human-readable error message.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise.
  
## Remarks  
  
These error messages are not localized and are only intended for developers, i.e. these error messages are not intended to be shown to users via UI.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  

  
  
