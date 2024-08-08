---
author: jdeweyMSFT
title: "PlayFab Party Xbox Live Helper Typedefs"
description: Convenience typedefs defined for PlayFab Party's Xbox Live Helper Library
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2019
---

# PlayFab Party Xbox Live Helper Libary Typedefs

The Party Xbox Live Helper Library uses several typedefs for convenient declarations of arrays of core types. Additional [typedefs](../reference/typedefs.md) provided by PlayFab Party are used within the PlayFab Party Xbox Live Helper Library.


## Arrays

A number of structs and method parameters use constant arrays of core types. To simplify usage and declaration of these arrays, the following typedefs are provided.

```cpp
typedef const struct PartyXblStateChange * const * PartyXblStateChangeArray;
typedef class PartyXblChatUser * const * PartyXblChatUserArray;
```

| Typedef | Core type |
| --- | --- |
| PartyXblStateChangeArray | [PartyXblStateChange](structs/partyxblstatechange.md) |
| PartyXblChatUserArray | [PartyLocalUser](classes/PartyXblChatUser/partyxblchatuser.md) |

## Requirements

**Header:** PartyXboxLive.h

## See also
[Party typedefs](../reference/typedefs.md)

