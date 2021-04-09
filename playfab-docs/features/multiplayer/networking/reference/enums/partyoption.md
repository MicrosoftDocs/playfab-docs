---
author: jdeweyMSFT
title: "PartyOption"
description: "Additional options that can be set to fine-tune Party library functionality."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 04/07/2021
---

# PartyOption  

Additional options that can be set to fine-tune Party library functionality.    

## Syntax  
  
```cpp
enum class PartyOption  : uint32_t  
{  
    LocalUdpSocketBindAddress = 0,  
    LocalDeviceDirectPeerConnectivityOptionsMask = 1,  
    TextChatFilterLevel = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| LocalUdpSocketBindAddress | An option used to configure how the Party library binds to a UDP socket.<br/><br/> To override this option, call [PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md) passing null for the object parameter, this value for the option parameter, and an optional pointer to a PartyLocalUdpSocketBindAddressConfiguration structure for the value. <br /><br /> To query this option, call [PartyManager::GetOption](../classes/PartyManager/methods/partymanager_getoption.md) passing null for the object parameter, this value for the option parameter, and a pointer to an output PartyLocalUdpSocketBindAddressConfiguration structure for the value.   <br /><br /> It's safe and recommended to override or query for this option prior to initializing the Party library. Overriding the local UDP socket bind address configuration will take effect the next time the Party library is initialized. It doesn't modify any Party library socket binding that has already been initialized. Similarly, querying retrieves the configuration that will be used with the next Party library initialization, not the value actively in use if already initialized. |  
| LocalDeviceDirectPeerConnectivityOptionsMask | An option for constraining the permitted direct peer connectivity between the local device and other devices in networks that allow attempting such connections.<br/><br/> When successfully authenticating an initial local user into a network with a [PartyNetworkConfiguration::directPeerConnectivityOptions](../structs/partynetworkconfiguration.md) field set to a value other than [PartyDirectPeerConnectivityOptions::None](partydirectpeerconnectivityoptions.md), or when a remote device authenticates into such a network, direct peer connectivity between this local device and the remote device(s) in the network may be attempted. The flags configured by this option can be used to further constrain the specific types of remote devices that are permitted to involve the local device in these attempts. All flags are evaluated using a bitwise AND operation. That is, a particular flag is actually only in effect for a given network's pair of devices if it's enabled in three places: the network's [PartyNetworkConfiguration](../structs/partynetworkconfiguration.md) structure, and *both* devices' respective local mask options. Even if the Party network permits direct peer connectivity of the relevant form, either device can unilaterally opt out of the IP address disclosure and direct connection attempts between them by not enabling the flag when overriding this option. <br /><br /> Direct peer connectivity is supported for the Windows 10 and Microsoft Game Core versions of the library. On those platforms, the default value for the local device mask when not yet set is ```PartyDirectPeerConnectivityOptions::AnyPlatformType | PartyDirectPeerConnectivityOptions::AnyEntityLoginProvider```. This means that such devices don't restrict any direct peer connectivity permitted by a network's [PartyNetworkConfiguration](../structs/partynetworkconfiguration.md) until explicitly overridden to be less permissive. For all other versions of the library, the default value for the local device mask is ```PartyDirectPeerConnectivityOptions::None``` and cannot be changed; attempting to change it via [PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md) will fail. This means that such devices will never attempt direct peer connectivity.   <br /><br /> To override this option, call [PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md) passing null for the object parameter, this value for the option parameter, and a pointer to a [PartyDirectPeerConnectivityOptions](partydirectpeerconnectivityoptions.md) variable containing all desired option flags.   <br /><br /> To query this option, call [PartyManager::GetOption](../classes/PartyManager/methods/partymanager_getoption.md) passing null for the object parameter, this value for the option parameter, and a pointer to a [PartyDirectPeerConnectivityOptions](partydirectpeerconnectivityoptions.md) variable into which the currently configured option flags should be written.   <br /><br /> It's recommended to override or query this option when not connected to any networks. The configured value takes effect the next time this device authenticates an initial user into a new network. It doesn't alter the settings already being used to participate in any existing networks. Similarly, querying retrieves the currently configured value that will be used with future networks, and not the value used with existing networks.   <br /><br /> It's also safe to override or query for this option prior to initializing the Party library. |  
| TextChatFilterLevel | An option for fine-tuning the level that chat text will be filtered at.<br/><br/> This feature only applies to incoming chat text detected as English. The filter level cannot be changed for other languages. <br /><br /> The filter level will apply to incoming chat text for all local chat controls on the client. Filtering must be enabled with [PartyLocalChatControl::SetTextChatOptions](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md) for at least one local chat control for this to have an effect on the chat text.   <br /><br /> To override this option, call [PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md) passing null for the object parameter, this value for the option parameter, and a pointer to a [PartyTextChatFilterLevel](partytextchatfilterlevel.md) variable containing the desired filter level.   <br /><br /> To query this option, call [PartyManager::GetOption](../classes/PartyManager/methods/partymanager_getoption.md) passing null for the object parameter, this value for the option parameter, and a pointer to a [PartyTextChatFilterLevel](partytextchatfilterlevel.md) variable into which the currently configured filter level should be written.   <br /><br /> It is safe to override or query for this option at any time. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md)  
[PartyManager::GetOption](../classes/PartyManager/methods/partymanager_getoption.md)  
[PartyLocalUdpSocketBindAddressConfiguration](../structs/partylocaludpsocketbindaddressconfiguration.md)  
[PartyNetworkConfiguration](../structs/partynetworkconfiguration.md)  
[PartyDirectPeerConnectivityOptions](partydirectpeerconnectivityoptions.md)
  
  
