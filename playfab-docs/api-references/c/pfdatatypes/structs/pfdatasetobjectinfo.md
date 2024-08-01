---
author: jasonsandlin
title: "PFDataSetObjectInfo"
description: "PFDataSetObjectInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataSetObjectInfo  

PFDataSetObjectInfo data model.  

## Syntax  
  
```cpp
typedef struct PFDataSetObjectInfo {  
    const char* objectName;  
    const char* operationReason;  
    PFOperationTypes const* setResult;  
} PFDataSetObjectInfo;  
```
  
### Members  
  
**`objectName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the object.
  
**`operationReason`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional reason to explain why the operation was the result that it was.
  
**`setResult`** &nbsp; [PFOperationTypes](../../pftypes/enums/pfoperationtypes.md) const*  
*may be nullptr*  
  
(Optional) Indicates which operation was completed, either Created, Updated, Deleted or None.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
