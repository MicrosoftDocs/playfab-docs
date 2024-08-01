---
author: jasonsandlin
title: "PFProfilesEntityDataObjectDictionaryEntry"
description: "Dictionary entry for an associative array with PFProfilesEntityDataObject values."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesEntityDataObjectDictionaryEntry  

Dictionary entry for an associative array with PFProfilesEntityDataObject values.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityDataObjectDictionaryEntry {  
    const char* key;  
    PFProfilesEntityDataObject const* value;  
} PFProfilesEntityDataObjectDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
TBD  
  
**`value`** &nbsp; [PFProfilesEntityDataObject](pfprofilesentitydataobject.md) const*  
  
TBD  
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
