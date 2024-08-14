---
author: jdeweyMSFT
title: "PlayFab Party Typedefs"
description: Convenience typedefs defined for PlayFab Party
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/25/2019
---

# PlayFab Party Typedefs

The PlayFab Party library uses several typedefs for convenient declarations of arrays of core types. It also provides typedefs for a few basic types to add semantic meaning and aid in static analysis. Macros are  provided for dealing with `PartyError` return codes.

## Basic types

### PartyBool
The size of a C++ `bool` is implementation defined. `PartyBool` provides safe cross-platform serialization of boolean values.
```cpp
typedef uint8_t PartyBool;
```

### PartyError
Error codes are 32-bit unsigned integers returned as `PartyError`. The success code is defined, as are macros for determining if a error code represents success or failure.
```cpp
typedef _Return_type_success_(return == c_partyErrorSuccess) uint32_t PartyError;
static const PartyError c_partyErrorSuccess = 0;

#define PARTY_SUCCEEDED(partyError) ((partyError) == c_partyErrorSuccess)
#define PARTY_FAILED(partyError) (!PARTY_SUCCEEDED((partyError)))
```

### PartyString

A `PartyString` is a UTF-8 null-terminated `const char` array. The typedef exists in order to add an annotation for static analysis.

```cpp
typedef _Null_terminated_ const char * PartyString;
```

## Arrays

A number of structs and method parameters use constant arrays of core types. To simplify usage and declaration of these arrays, the following typedefs are provided.

```cpp
typedef class PartyEndpoint * const * PartyEndpointArray;
typedef class PartyLocalEndpoint * const * PartyLocalEndpointArray;
typedef class PartyDevice * const * PartyDeviceArray;
typedef class PartyInvitation * const * PartyInvitationArray;
typedef class PartyNetwork * const * PartyNetworkArray;
typedef class PartyChatControl * const * PartyChatControlArray;
typedef class PartyLocalChatControl * const * PartyLocalChatControlArray;
typedef class PartyTextToSpeechProfile * const * PartyTextToSpeechProfileArray;
typedef const struct PartyStateChange * const * PartyStateChangeArray;
typedef class PartyLocalUser * const * PartyLocalUserArray;
```

| Typedef | Core type |
| --- | --- |
| PartyEndpointArray | [PartyEndpoint](classes/PartyEndpoint/partyendpoint.md) |
| PartyLocalEndpointArray | [PartyLocalEndpoint](classes/PartyLocalEndpoint/partylocalendpoint.md) |
| PartyDeviceArray | [PartyDevice](classes/PartyDevice/partydevice.md) |
| PartyInvitationArray | [PartyInvitation](classes/PartyInvitation/partyinvitation.md) |
| PartyNetworkArray | [PartyNetwork](classes/PartyNetwork/partynetwork.md) |
| PartyChatControlArray | [PartyChatControl](classes/PartyChatControl/partychatcontrol.md) |
| PartyLocalChatControlArray | [PartyLocalChatControl](classes/PartyLocalChatControl/partylocalchatcontrol.md) |
| PartyTextToSpeechProfileArray | [PartyTextToSpeechProfile](classes/PartyTextToSpeechProfile/partytexttospeechprofile.md) |
| PartyStateChangeArray | [PartyStateChange](structs/partystatechange.md) |
| PartyLocalUserArray | [PartyLocalUser](classes/PartyLocalUser/partylocaluser.md) |

## Requirements

**Header:** Party.h

## See also
[Party members](party_members.md)

