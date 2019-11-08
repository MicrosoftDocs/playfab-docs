---
author: jdeweyMSFT
title: "Typedefs"
description: TBD
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# Typedefs

Party Xbox Live Helper library uses several typedefs for convenient declarations of arrays of core types. Additional [typedefs](../reference/typedefs.md) provided by PlayFab Party are used within the Party Xbox Live Helper API.

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

