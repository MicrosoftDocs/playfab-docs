---
author: jasonsandlin
title: "PFCloudScriptExecuteFunctionRequest"
description: "PFCloudScriptExecuteFunctionRequest data model. Executes an Azure Function with the profile of the entity that is defined in the request."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptExecuteFunctionRequest  

PFCloudScriptExecuteFunctionRequest data model. Executes an Azure Function with the profile of the entity that is defined in the request.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptExecuteFunctionRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* functionName;  
    PFJsonObject functionParameter;  
    bool const* generatePlayStreamEvent;  
} PFCloudScriptExecuteFunctionRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
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

  
  
