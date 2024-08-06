---
author: jdeweyMSFT
title: "PartyDataBuffer"
description: "A data buffer."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyDataBuffer  

A data buffer.  

## Syntax  
  
```cpp
struct PartyDataBuffer {  
    const void* buffer;  
    uint32_t bufferByteCount;  
}  
```
  
### Members  
  
**`buffer`** &nbsp; const void*  
*buffer of size `bufferByteCount` bytes*  
  
The data buffer.
  
**`bufferByteCount`** &nbsp; uint32_t  
  
The size of the buffer in bytes.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
