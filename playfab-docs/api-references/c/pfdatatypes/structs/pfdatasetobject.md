---
author: jasonsandlin
title: "PFDataSetObject"
description: "PFDataSetObject data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataSetObject  

PFDataSetObject data model.  

## Syntax  
  
```cpp
typedef struct PFDataSetObject {  
    PFJsonObject dataObject;  
    bool const* deleteObject;  
    const char* escapedDataObject;  
    const char* objectName;  
} PFDataSetObject;  
```
  
### Members  
  
**`dataObject`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Body of the object to be saved. If empty and DeleteObject is true object will be deleted if it exists, or no operation will occur if it does not exist. Only one of Object or EscapedDataObject fields may be used.
  
**`deleteObject`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Flag to indicate that this object should be deleted. Both DataObject and EscapedDataObject must not be set as well.
  
**`escapedDataObject`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Body of the object to be saved as an escaped JSON string. If empty and DeleteObject is true object will be deleted if it exists, or no operation will occur if it does not exist. Only one of DataObject or EscapedDataObject fields may be used.
  
**`objectName`** &nbsp; const char*  
*is null-terminated*  
  
Name of object. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
