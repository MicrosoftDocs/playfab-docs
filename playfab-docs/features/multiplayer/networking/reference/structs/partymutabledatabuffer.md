---
author: jdeweyMSFT
title: "PartyMutableDataBuffer"
description: "A data buffer that can be modified by the app."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyMutableDataBuffer  

A data buffer that can be modified by the app.  

## Syntax  
  
```cpp
struct PartyMutableDataBuffer {  
    void* buffer;  
    uint32_t bufferByteCount;  
}  
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

  
  
