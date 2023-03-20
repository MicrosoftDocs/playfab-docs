---
author: jasonsandlin
title: "PFProfilesEntityStatisticValueDictionaryEntry"
description: "Dictionary entry for an associative array with PFProfilesEntityStatisticValue values."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFProfilesEntityStatisticValueDictionaryEntry  

Dictionary entry for an associative array with PFProfilesEntityStatisticValue values.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityStatisticValueDictionaryEntry {  
    const char* key;  
    PFProfilesEntityStatisticValue const* value;  
} PFProfilesEntityStatisticValueDictionaryEntry;  
```
  
### Members  
  
**`key`** &nbsp; const char*  
*is null-terminated*  
  
TBD  
  
**`value`** &nbsp; [PFProfilesEntityStatisticValue](pfprofilesentitystatisticvalue.md) const*  
  
TBD  
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
