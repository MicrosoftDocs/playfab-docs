---
author: jasonsandlin
title: "PFMultiplayerServerListQosServersForTitleRequest"
description: "PFMultiplayerServerListQosServersForTitleRequest data model. Returns a list of quality of service servers for a title."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerListQosServersForTitleRequest  

PFMultiplayerServerListQosServersForTitleRequest data model. Returns a list of quality of service servers for a title.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerListQosServersForTitleRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* includeAllRegions;  
    const char* routingPreference;  
} PFMultiplayerServerListQosServersForTitleRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`includeAllRegions`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Indicates that the response should contain Qos servers for all regions, including those where there are no builds deployed for the title.
  
**`routingPreference`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Indicates the Routing Preference used by the Qos servers. The default Routing Preference is Microsoft.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
