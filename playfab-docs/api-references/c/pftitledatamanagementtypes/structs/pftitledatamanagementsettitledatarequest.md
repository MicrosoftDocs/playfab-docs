---
author: jasonsandlin
title: "PFTitleDataManagementSetTitleDataRequest"
description: "PFTitleDataManagementSetTitleDataRequest data model. This API is designed to store title specific values which can be read, but not written to, by the client. For example, a developer could choose to store values which modify the user experience, such as enemy spawn rates, weapon strengths, movement speeds, etc. This allows a developer to update the title without the need to create, test, and ship a new build. This operation is additive. If a Key does not exist in the current dataset, it will be added with the specified Value. If it already exists, the Value for that key will be overwritten with the new Value."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementSetTitleDataRequest  

PFTitleDataManagementSetTitleDataRequest data model. This API is designed to store title specific values which can be read, but not written to, by the client. For example, a developer could choose to store values which modify the user experience, such as enemy spawn rates, weapon strengths, movement speeds, etc. This allows a developer to update the title without the need to create, test, and ship a new build. This operation is additive. If a Key does not exist in the current dataset, it will be added with the specified Value. If it already exists, the Value for that key will be overwritten with the new Value.  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementSetTitleDataRequest {  
    const char* key;  
    const char* value;  
} PFTitleDataManagementSetTitleDataRequest;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
Key we want to set a value on (note, this is additive - will only replace an existing key's value if they are the same name.) Keys are trimmed of whitespace. Keys may not begin with the '!' character.
  
**`value`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) New value to set. Set to null to remove a value.
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
