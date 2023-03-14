---
author: jasonsandlin
title: "PFCloudScriptExecuteFunctionRequest"
description: "PFCloudScriptExecuteFunctionRequest data model. Executes an Azure Function with the profile of the entity that is defined in the request."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCloudScriptExecuteFunctionRequest  

PFCloudScriptExecuteFunctionRequest data model. Executes an Azure Function with the profile of the entity that is defined in the request.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptExecuteFunctionRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* functionName;  
    PFJsonObject functionParameter;  
    bool const* generatePlayStreamEvent;  
} PFCloudScriptExecuteFunctionRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
**`functionName`** &nbsp; const char*  
*is null-terminated*  
  
The name of the CloudScript function to execute.
  
**`functionParameter`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Object that is passed in to the function as the FunctionArgument field of the FunctionExecutionContext data structure.
  
**`generatePlayStreamEvent`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Generate a 'entity_executed_cloudscript_function' PlayStream event containing the results of the function execution and other contextual information. This event will show up in the PlayStream debugger console for the player in Game Manager.
  
  
## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
