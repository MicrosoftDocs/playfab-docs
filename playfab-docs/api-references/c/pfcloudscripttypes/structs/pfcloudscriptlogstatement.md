---
author: jasonsandlin
title: "PFCloudScriptLogStatement"
description: "PFCloudScriptLogStatement data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptLogStatement  

PFCloudScriptLogStatement data model.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptLogStatement {  
    PFJsonObject data;  
    const char* level;  
    const char* message;  
} PFCloudScriptLogStatement;  
```
  
### Members  
  
**`data`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Optional object accompanying the message as contextual information.
  
**`level`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) 'Debug', 'Info', or 'Error'.
  
**`message`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Message property.
  
  
## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
