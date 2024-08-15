---
author: jasonsandlin
title: "PFCloudScriptExecuteEntityCloudScriptRequest"
description: "PFCloudScriptExecuteEntityCloudScriptRequest data model. Executes CloudScript with the entity profile that is defined in the request."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptExecuteEntityCloudScriptRequest  

PFCloudScriptExecuteEntityCloudScriptRequest data model. Executes CloudScript with the entity profile that is defined in the request.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptExecuteEntityCloudScriptRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* functionName;  
    PFJsonObject functionParameter;  
    bool const* generatePlayStreamEvent;  
    PFCloudScriptCloudScriptRevisionOption const* revisionSelection;  
    int32_t const* specificRevision;  
} PFCloudScriptExecuteEntityCloudScriptRequest;  
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
  
(Optional) Object that is passed in to the function as the first argument.
  
**`generatePlayStreamEvent`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Generate a 'entity_executed_cloudscript' PlayStream event containing the results of the function execution and other contextual information. This event will show up in the PlayStream debugger console for the player in Game Manager.
  
**`revisionSelection`** &nbsp; [PFCloudScriptCloudScriptRevisionOption](../enums/pfcloudscriptcloudscriptrevisionoption.md) const*  
*may be nullptr*  
  
(Optional) Option for which revision of the CloudScript to execute. 'Latest' executes the most recently created revision, 'Live' executes the current live, published revision, and 'Specific' executes the specified revision. The default value is 'Specific', if the SpecificRevision parameter is specified, otherwise it is 'Live'.
  
**`specificRevision`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The specific revision to execute, when RevisionSelection is set to 'Specific'.
  
  
## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
