---
author: jasonsandlin
title: "PFDataObjectResult"
description: "PFDataObjectResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataObjectResult  

PFDataObjectResult data model.  

## Syntax  
  
```cpp
typedef struct PFDataObjectResult {  
    PFJsonObject dataObject;  
    const char* escapedDataObject;  
    const char* objectName;  
} PFDataObjectResult;  
```
  
### Members  
  
**`dataObject`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Un-escaped JSON object, if EscapeObject false or default.
  
**`escapedDataObject`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Escaped string JSON body of the object, if EscapeObject is true.
  
**`objectName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the object. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
