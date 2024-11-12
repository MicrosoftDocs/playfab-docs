---
author: jdeweyMSFT
title: "PartyStateChangeType"
description: "The types of state changes that can occur in the Party library."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/11/2023
---

# PartyStateChangeType  

The types of state changes that can occur in the Party library.    

## Syntax  
  
```cpp
enum class PartyStateChangeType  : uint32_t  
{  
    RegionsChanged = 0,  
    DestroyLocalUserCompleted = 1,  
    CreateNewNetworkCompleted = 2,  
    ConnectToNetworkCompleted = 3,  
    AuthenticateLocalUserCompleted = 4,  
    NetworkConfigurationMadeAvailable = 5,  
    NetworkDescriptorChanged = 6,  
    LocalUserRemoved = 7,  
    RemoveLocalUserCompleted = 8,  
    CreateEndpointCompleted = 10,  
    DestroyEndpointCompleted = 11,  
    EndpointCreated = 12,  
    EndpointDestroyed = 13,  
    RemoteDeviceCreated = 14,  
    RemoteDeviceDestroyed = 15,  
    RemoteDeviceJoinedNetwork = 16,  
    RemoteDeviceLeftNetwork = 17,  
    LeaveNetworkCompleted = 19,  
    NetworkDestroyed = 20,  
    EndpointMessageReceived = 21,  
    DataBuffersReturned = 22,  
    CreateChatControlCompleted = 31,  
    DestroyChatControlCompleted = 32,  
    ChatControlCreated = 33,  
    ChatControlDestroyed = 34,  
    ChatTextReceived = 36,  
    VoiceChatTranscriptionReceived = 37,  
    SetChatAudioInputCompleted = 38,  
    SetChatAudioOutputCompleted = 39,  
    LocalChatAudioInputChanged = 40,  
    LocalChatAudioOutputChanged = 41,  
    SetTextToSpeechProfileCompleted = 42,  
    SynthesizeTextToSpeechCompleted = 43,  
    ChatControlJoinedNetwork = 46,  
    ChatControlLeftNetwork = 47,  
    ConnectChatControlCompleted = 48,  
    DisconnectChatControlCompleted = 49,  
    PopulateAvailableTextToSpeechProfilesCompleted = 50,  
    CreateInvitationCompleted = 51,  
    RevokeInvitationCompleted = 52,  
    InvitationCreated = 53,  
    InvitationDestroyed = 54,  
    SetTranscriptionOptionsCompleted = 56,  
    SetTextChatOptionsCompleted = 57,  
    ConfigureAudioManipulationVoiceStreamCompleted = 58,  
    ConfigureAudioManipulationCaptureStreamCompleted = 59,  
    ConfigureAudioManipulationRenderStreamCompleted = 60,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| RegionsChanged | The list of regions in which the title may create networks has changed.<br/><br/> The PartyStateChange object should be cast to a [PartyRegionsChangedStateChange](../structs/partyregionschangedstatechange.md) object for more information. |  
| DestroyLocalUserCompleted | The operation started by a previous call to [PartyManager::DestroyLocalUser()](../classes/PartyManager/methods/partymanager_destroylocaluser.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyDestroyLocalUserCompletedStateChange](../structs/partydestroylocalusercompletedstatechange.md) object for more information. |  
| CreateNewNetworkCompleted | The operation started by a previous call to [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyCreateNewNetworkCompletedStateChange](../structs/partycreatenewnetworkcompletedstatechange.md) object for more information. |  
| ConnectToNetworkCompleted | The operation started by a previous call to [PartyManager::ConnectToNetwork()](../classes/PartyManager/methods/partymanager_connecttonetwork.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyConnectToNetworkCompletedStateChange](../structs/partyconnecttonetworkcompletedstatechange.md) object for more information. |  
| AuthenticateLocalUserCompleted | The operation started by a previous call to [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyAuthenticateLocalUserCompletedStateChange](../structs/partyauthenticatelocalusercompletedstatechange.md) object for more information. |  
| NetworkConfigurationMadeAvailable | The network configuration associated with the PartyNetwork is now available.<br/><br/> The PartyStateChange object should be cast to a [PartyNetworkConfigurationMadeAvailableStateChange](../structs/partynetworkconfigurationmadeavailablestatechange.md) object for more information. |  
| NetworkDescriptorChanged | The network descriptor associated with the PartyNetwork changed.<br/><br/> The PartyStateChange object should be cast to a [PartyNetworkDescriptorChangedStateChange](../structs/partynetworkdescriptorchangedstatechange.md) object for more information. |  
| LocalUserRemoved | A local user has been removed from the network by a previous call to [PartyNetwork::RemoveLocalUser()](../classes/PartyNetwork/methods/partynetwork_removelocaluser.md) or [PartyManager::DestroyLocalUser()](../classes/PartyManager/methods/partymanager_destroylocaluser.md).<br/><br/> The PartyStateChange object should be cast to a [PartyLocalUserRemovedStateChange](../structs/partylocaluserremovedstatechange.md) object for more information. |  
| RemoveLocalUserCompleted | The operation to remove a local user started by a previous call to [PartyNetwork::RemoveLocalUser()](../classes/PartyNetwork/methods/partynetwork_removelocaluser.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyRemoveLocalUserCompletedStateChange](../structs/partyremovelocalusercompletedstatechange.md) object for more information. |  
| CreateEndpointCompleted | The operation started by a previous call to [PartyNetwork::CreateEndpoint()](../classes/PartyNetwork/methods/partynetwork_createendpoint.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyCreateEndpointCompletedStateChange](../structs/partycreateendpointcompletedstatechange.md) object for more information. |  
| DestroyEndpointCompleted | The operation started by a previous call to [PartyNetwork::DestroyEndpoint()](../classes/PartyNetwork/methods/partynetwork_destroyendpoint.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyDestroyEndpointCompletedStateChange](../structs/partydestroyendpointcompletedstatechange.md) object for more information. |  
| EndpointCreated | A new endpoint was created.<br/><br/> The PartyStateChange object should be cast to a [PartyEndpointCreatedStateChange](../structs/partyendpointcreatedstatechange.md) object for more information. |  
| EndpointDestroyed | An endpoint was destroyed.<br/><br/> The PartyStateChange object should be cast to a [PartyEndpointDestroyedStateChange](../structs/partyendpointdestroyedstatechange.md) object for more information. |  
| RemoteDeviceCreated | A new remote device was created.<br/><br/> The PartyStateChange object should be cast to a [PartyRemoteDeviceCreatedStateChange](../structs/partyremotedevicecreatedstatechange.md) object for more information. |  
| RemoteDeviceDestroyed | A remote device was destroyed.<br/><br/> The PartyStateChange object should be cast to a [PartyRemoteDeviceDestroyedStateChange](../structs/partyremotedevicedestroyedstatechange.md) object for more information. |  
| RemoteDeviceJoinedNetwork | A remote device joined a network.<br/><br/> The PartyStateChange object should be cast to a [PartyRemoteDeviceJoinedNetworkStateChange](../structs/partyremotedevicejoinednetworkstatechange.md) object for more information. |  
| RemoteDeviceLeftNetwork | A remote device left a network.<br/><br/> The PartyStateChange object should be cast to a [PartyRemoteDeviceLeftNetworkStateChange](../structs/partyremotedeviceleftnetworkstatechange.md) object for more information. |  
| LeaveNetworkCompleted | The operation started by a previous call to [PartyNetwork::LeaveNetwork()](../classes/PartyNetwork/methods/partynetwork_leavenetwork.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyLeaveNetworkCompletedStateChange](../structs/partyleavenetworkcompletedstatechange.md) object for more information. |  
| NetworkDestroyed | A network was destroyed.<br/><br/> The PartyStateChange object should be cast to a [PartyNetworkDestroyedStateChange](../structs/partynetworkdestroyedstatechange.md) object for more information. |  
| EndpointMessageReceived | A data send was received from an endpoint.<br/><br/> The PartyStateChange object should be cast to a [PartyEndpointMessageReceivedStateChange](../structs/partyendpointmessagereceivedstatechange.md) object for more information. |  
| DataBuffersReturned | The PartyDataBuffer set provided to SendMessage is no longer in use by the library.<br/><br/> The PartyStateChange object should be cast to a [PartyDataBuffersReturnedStateChange](../structs/partydatabuffersreturnedstatechange.md) object for more information. |  
| CreateChatControlCompleted | The operation started by a previous call to [PartyLocalDevice::CreateChatControl()](../classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyCreateChatControlCompletedStateChange](../structs/partycreatechatcontrolcompletedstatechange.md) object for more information. |  
| DestroyChatControlCompleted | The operation started by a previous call to [PartyLocalDevice::DestroyChatControl()](../classes/PartyLocalDevice/methods/partylocaldevice_destroychatcontrol.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyDestroyChatControlCompletedStateChange](../structs/partydestroychatcontrolcompletedstatechange.md) object for more information. |  
| ChatControlCreated | A new PartyChatControl was created.<br/><br/> The PartyStateChange object should be cast to a [PartyChatControlCreatedStateChange](../structs/partychatcontrolcreatedstatechange.md) object for more information. |  
| ChatControlDestroyed | A PartyChatControl was destroyed.<br/><br/> The PartyStateChange object should be cast to a [PartyChatControlDestroyedStateChange](../structs/partychatcontroldestroyedstatechange.md) object for more information. |  
| ChatTextReceived | Chat text has been received.<br/><br/> The PartyStateChange object should be cast to a [PartyChatTextReceivedStateChange](../structs/partychattextreceivedstatechange.md) object for more information. |  
| VoiceChatTranscriptionReceived | A voice chat transcription has been received.<br/><br/> The PartyStateChange object should be cast to a [PartyVoiceChatTranscriptionReceivedStateChange](../structs/partyvoicechattranscriptionreceivedstatechange.md) object for more information. |  
| SetChatAudioInputCompleted | The operation started by a previous call to [PartyLocalChatControl::SetAudioInput()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudioinput.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartySetChatAudioInputCompletedStateChange](../structs/partysetchataudioinputcompletedstatechange.md) object for more information. |  
| SetChatAudioOutputCompleted | The operation started by a previous call to [PartyLocalChatControl::SetAudioOutput()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudiooutput.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartySetChatAudioOutputCompletedStateChange](../structs/partysetchataudiooutputcompletedstatechange.md) object for more information. |  
| LocalChatAudioInputChanged | The state of an audio input associated with a local chat control changed.<br/><br/> The PartyStateChange object should be cast to a [PartyLocalChatAudioInputChangedStateChange](../structs/partylocalchataudioinputchangedstatechange.md) object for more information. |  
| LocalChatAudioOutputChanged | The state of an audio output associated with a local chat control changed.<br/><br/> The PartyStateChange object should be cast to a [PartyLocalChatAudioOutputChangedStateChange](../structs/partylocalchataudiooutputchangedstatechange.md) object for more information. |  
| SetTextToSpeechProfileCompleted | The operation started by a previous call to [PartyLocalChatControl::SetTextToSpeechProfile()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settexttospeechprofile.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartySetTextToSpeechProfileCompletedStateChange](../structs/partysettexttospeechprofilecompletedstatechange.md) object for more information. |  
| SynthesizeTextToSpeechCompleted | The operation started by a previous call to [PartyLocalChatControl::SynthesizeTextToSpeech()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_synthesizetexttospeech.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartySynthesizeTextToSpeechCompletedStateChange](../structs/partysynthesizetexttospeechcompletedstatechange.md) object for more information. Receiving a state change of this type indicates that the audio has been synthesized, not that the audio has been transmitted to anyone. |  
| ChatControlJoinedNetwork | The chat control joined a network.<br/><br/> The PartyStateChange object should be cast to a [PartyChatControlJoinedNetworkStateChange](../structs/partychatcontroljoinednetworkstatechange.md) object for more information. |  
| ChatControlLeftNetwork | The chat control left a network.<br/><br/> The PartyStateChange object should be cast to a [PartyChatControlLeftNetworkStateChange](../structs/partychatcontrolleftnetworkstatechange.md) object for more information. |  
| ConnectChatControlCompleted | The operation started by a previous call to [PartyNetwork::ConnectChatControl()](../classes/PartyNetwork/methods/partynetwork_connectchatcontrol.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyConnectChatControlCompletedStateChange](../structs/partyconnectchatcontrolcompletedstatechange.md) object for more information. |  
| DisconnectChatControlCompleted | The operation started by a previous call to [PartyNetwork::DisconnectChatControl()](../classes/PartyNetwork/methods/partynetwork_disconnectchatcontrol.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyDisconnectChatControlCompletedStateChange](../structs/partydisconnectchatcontrolcompletedstatechange.md) object for more information. |  
| PopulateAvailableTextToSpeechProfilesCompleted | The operation started by a previous call to [PartyLocalChatControl::PopulateAvailableTextToSpeechProfiles()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_populateavailabletexttospeechprofiles.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange](../structs/partypopulateavailabletexttospeechprofilescompletedstatechange.md) object for more information. |  
| CreateInvitationCompleted | The operation started by a previous call to [PartyNetwork::CreateInvitation()](../classes/PartyNetwork/methods/partynetwork_createinvitation.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyCreateInvitationCompletedStateChange](../structs/partycreateinvitationcompletedstatechange.md) object for more information. |  
| RevokeInvitationCompleted | The operation started by a previous call to [PartyNetwork::RevokeInvitation()](../classes/PartyNetwork/methods/partynetwork_revokeinvitation.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyRevokeInvitationCompletedStateChange](../structs/partyrevokeinvitationcompletedstatechange.md) object for more information. |  
| InvitationCreated | A new invitation was created.<br/><br/> The PartyStateChange object should be cast to a [PartyInvitationCreatedStateChange](../structs/partyinvitationcreatedstatechange.md) object for more information. |  
| InvitationDestroyed | An invitation was destroyed.<br/><br/> The PartyStateChange object should be cast to a [PartyInvitationDestroyedStateChange](../structs/partyinvitationdestroyedstatechange.md) object for more information. |  
| SetTranscriptionOptionsCompleted | The operation started by a previous call to [PartyLocalChatControl::SetTranscriptionOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settranscriptionoptions.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartySetTranscriptionOptionsCompletedStateChange](../structs/partysettranscriptionoptionscompletedstatechange.md) object for more information. |  
| SetTextChatOptionsCompleted | The operation started by a previous call to [PartyLocalChatControl::SetTextChatOptions()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartySetTextChatOptionsCompletedStateChange](../structs/partysettextchatoptionscompletedstatechange.md) object for more information. |  
| ConfigureAudioManipulationVoiceStreamCompleted | The operation started by a previous call to [PartyChatControl::ConfigureAudioManipulationVoiceStream()](../classes/PartyChatControl/methods/partychatcontrol_configureaudiomanipulationvoicestream.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyConfigureAudioManipulationVoiceStreamCompletedStateChange](../structs/partyconfigureaudiomanipulationvoicestreamcompletedstatechange.md) object for more information. |  
| ConfigureAudioManipulationCaptureStreamCompleted | The operation started by a previous call to [PartyLocalChatControl::ConfigureAudioManipulationCaptureStream()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationcapturestream.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyConfigureAudioManipulationCaptureStreamCompletedStateChange](../structs/partyconfigureaudiomanipulationcapturestreamcompletedstatechange.md) object for more information. |  
| ConfigureAudioManipulationRenderStreamCompleted | The operation started by a previous call to [PartyLocalChatControl::ConfigureAudioManipulationRenderStream()](../classes/PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationrenderstream.md) completed.<br/><br/> The PartyStateChange object should be cast to a [PartyConfigureAudioManipulationRenderStreamCompletedStateChange](../structs/partyconfigureaudiomanipulationrenderstreamcompletedstatechange.md) object for more information. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
