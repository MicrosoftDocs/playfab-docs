---
author: jdeweyMSFT
title: "PartyDataBuffer"
description: "A data buffer."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyDataBuffer  

A data buffer.  

## Syntax  
  
```cpp
typedef struct PartyDataBuffer {  
    const void* buffer;  
    uint32_t bufferByteCount;  
} PartyDataBuffer  
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

  
  
