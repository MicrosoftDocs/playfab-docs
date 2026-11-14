---
author: ScottMunroMS
title: "PartyXblHttpHeader"
description: "Information about an HTTP header."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblHttpHeader  

Information about an HTTP header.  

## Syntax  
  
```cpp
struct PartyXblHttpHeader {  
    PartyString name;  
    PartyString value;  
}  
```
  
### Members  
  
**`name`** &nbsp; [PartyString](../../reference/typedefs.md)  
  
The header's name.
  
**`value`** &nbsp; [PartyString](../../reference/typedefs.md)  
  
The header's value.
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
