---
author: jdeweyMSFT
title: "PartyManager::GetOption"
description: Retrieves an option used to fine-tune Party library functionality.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::GetOption  

Retrieves an option used to fine-tune Party library functionality.  

## Syntax  
  
```cpp
PartyError GetOption(  
    const void* object,  
    PartyOption option,  
    void* value  
)  
```  
  
### Parameters  
  
**`object`** &nbsp; void*  
*optional*  
  
The Party library object that may be required as context for different [PartyOption](../../../enums/partyoption.md) values.  
  
**`option`** &nbsp; [PartyOption](../../../enums/partyoption.md)  
  
The Party library option to retrieve.  
  
**`value`** &nbsp; void*  
*output*  
  
An output value to fill with the current `option` setting. If this option has not yet been overridden by a call to [PartyManager::SetOption()](partymanager_setoption.md), this method will retrieve that option's default value.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyOption](../../../enums/partyoption.md)  
[PartyManager::SetOption](partymanager_setoption.md)
  
  
