---
author: jdeweyMSFT
title: "PartyChatControl"
description: TBD
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyChatControl  

The management class for chat operations.  

## Syntax  
  
```cpp  
class PartyChatControl  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetLocal](methods/partychatcontrol_getlocal.md) | Gets the [PartyLocalChatControl](../PartyLocalChatControl/partylocalchatcontrol.md) version of this chat control. |  
| [GetDevice](methods/partychatcontrol_getdevice.md) | Returns the device this chat control is associated with. |  
| [GetEntityId](methods/partychatcontrol_getentityid.md) | Gets the PlayFab Entity ID of the user associated with this chat control. |  
| [GetNetworks](methods/partychatcontrol_getnetworks.md) | Gets the networks to which this chat control is connected. |  
| [GetCustomContext](methods/partychatcontrol_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this chat control object. |  
| [SetCustomContext](methods/partychatcontrol_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this chat control object. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  
[PartyLocalChatControl](../PartyLocalChatControl/partylocalchatcontrol.md)
  
  
  
