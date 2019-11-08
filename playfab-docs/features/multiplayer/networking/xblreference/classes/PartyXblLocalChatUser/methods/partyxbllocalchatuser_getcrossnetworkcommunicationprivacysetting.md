---
author: alexatxbox
title: "PartyXblLocalChatUser::GetCrossNetworkCommunicationPrivacySetting"
description: Gets the cross-network communication privacy setting for this chat user.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyXblLocalChatUser::GetCrossNetworkCommunicationPrivacySetting  

Gets the cross-network communication privacy setting for this chat user.  

## Syntax  
  
```cpp
PartyError GetCrossNetworkCommunicationPrivacySetting(  
    PartyXblCrossNetworkCommunicationPrivacySetting* setting  
)  
```  
  
### Parameters  
  
**`setting`** &nbsp; [PartyXblCrossNetworkCommunicationPrivacySetting*](../../../enums/partyxblcrossnetworkcommunicationprivacysetting.md)  
*library-allocated output*  
  
The output cross-network communication privacy setting.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyXblManager::GetErrorMessage()](../../PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
## Remarks  
  
A cross-network user is defined as a user of a non-Xbox Live gaming network.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblLocalChatUser](../partyxbllocalchatuser.md)  

  
  
