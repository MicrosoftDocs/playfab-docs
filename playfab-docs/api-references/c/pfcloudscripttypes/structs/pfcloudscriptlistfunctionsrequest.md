---
author: jasonsandlin
title: "PFCloudScriptListFunctionsRequest"
description: "PFCloudScriptListFunctionsRequest data model. A title can have many functions, ListHttpFunctions will return a list of all the currently registered HTTP triggered functions for a given title."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFCloudScriptListFunctionsRequest  

PFCloudScriptListFunctionsRequest data model. A title can have many functions, ListHttpFunctions will return a list of all the currently registered HTTP triggered functions for a given title.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptListFunctionsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFCloudScriptListFunctionsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
