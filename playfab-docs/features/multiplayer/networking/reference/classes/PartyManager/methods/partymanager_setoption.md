---
author: jdeweyMSFT
title: "PartyManager::SetOption"
description: Configures an option to fine-tune Party library functionality.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::SetOption  

Configures an option to fine-tune Party library functionality.  

## Syntax  
  
```cpp
PartyError SetOption(  
    void* object,  
    PartyOption option,  
    const void* value  
)  
```  
  
### Parameters  
  
**`object`** &nbsp; void*  
*optional*  
  
The Party library object that may be required as context for different [PartyOption](../../../enums/partyoption.md) values.  
  
**`option`** &nbsp; [PartyOption](../../../enums/partyoption.md)  
  
The Party library option to configure.  
  
**`value`** &nbsp; void*  
*optional*  
  
A pointer to the value used to override `option`. If `value` is null, the option will be reset to its default value.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyOption](../../../enums/partyoption.md)  
[PartyManager::GetOption](partymanager_getoption.md)
  
  
