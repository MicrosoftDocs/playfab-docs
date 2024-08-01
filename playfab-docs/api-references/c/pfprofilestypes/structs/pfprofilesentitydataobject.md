---
author: jasonsandlin
title: "PFProfilesEntityDataObject"
description: "PFProfilesEntityDataObject data model. An entity object and its associated meta data."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesEntityDataObject  

PFProfilesEntityDataObject data model. An entity object and its associated meta data.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityDataObject {  
    PFJsonObject dataObject;  
    const char* escapedDataObject;  
    const char* objectName;  
} PFProfilesEntityDataObject;  
```
  
### Members  
  
**`dataObject`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Un-escaped JSON object, if DataAsObject is true.
  
**`escapedDataObject`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Escaped string JSON body of the object, if DataAsObject is default or false.
  
**`objectName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of this object.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
