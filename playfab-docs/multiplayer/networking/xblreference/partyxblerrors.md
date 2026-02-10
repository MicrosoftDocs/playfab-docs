---
author: ScottMunroMS
title: "PlayFab Party Xbox Live Helper Error Codes"
description: List of error codes used by the PlayFab Party's Xbox Live Helper Library
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/25/2026
---

# PlayFab Party Xbox Live Helper Library Error Codes
The following error codes are used by the PlayFab Party Xbox Live Helper Library:

## Xbox Live Helper Library errors
| Hex | Dec | Description |
| --- | --- | ----------- |
| 0x5000 | 20480 | Only one instance of PartyXblManager can exist at a time. |
| 0x5001 | 20481 | A user with this Xbox Live user ID already exists. |
| 0x5002 | 20482 | The chat user handle must reference a local chat user. |
| 0x5003 | 20483 | The title failed to provide a valid token and signature to the library. |
| 0x5004 | 20484 | An operation made on behalf of a local chat user was unauthorized. |
| 0x5005 | 20485 | An operation made on behalf of a local chat user was forbidden. |
| 0x5006 | 20486 | The Xbox Live service is temporarily unavailable. |
| 0x5007 | 20487 | The accessibility settings information for this local chat user aren't available. |
| 0x5009 | 20489 | The cross-network communication privacy setting for this local chat user isn't yet available. |
| 0x500B | 20491 | The network stack must be initialized before calling PartyXblManager::Initialize(); use the Microsoft Game Core XNetworkingGetConnectivityHint API to determine when the network stack is initialized. |
| 0x500C | 20492 | This Xbox Live user isn't currently signed in on this device. |
| 0x500D | 20493 | The GetTitlePlayersFromXboxLiveIDs response couldn't be parsed. |
| 0x500E | 20494 | The PlayFab service is temporarily unavailable. |
| 0x500F | 20495 | The specified correlation ID didn't match any outstanding requests. |
| 0x5014 | 20500 | Setting profiling callbacks after PartyXblManager initialization is forbidden. |
| 0x5015 | 20501 | The request failed because the Xbox Live token was invalid. |
| 0x5016 | 20502 | The request failed because the Xbox Live token was expired. |
