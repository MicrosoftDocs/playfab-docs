---
author: jdeweyMSFT
title: "PartyMutableDataBuffer"
description: "A data buffer that can be modified by the app."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 02/10/2020
---

# PartyMutableDataBuffer  

A data buffer that can be modified by the app.  

## Syntax  
  
```cpp
typedef struct PartyMutableDataBuffer {  
    void* buffer;  
    uint32_t bufferByteCount;  
} PartyMutableDataBuffer  
```
  
### Members  
  
**`buffer`** &nbsp; void*  
*buffer of size `bufferByteCount` bytes*  
  
The data buffer.
  
**`bufferByteCount`** &nbsp; uint32_t  
  
The size of the buffer in bytes.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
