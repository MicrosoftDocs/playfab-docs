---
author: jdeweyMSFT
title: "Party"
description: TBD
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 11/08/2019
---

# Party members  

  
## Classes  

| Class | Description |  
| --- | --- |  
| [PartyChatControl](classes/PartyChatControl/partychatcontrol.md) | The management class for chat operations. |  
| [PartyDevice](classes/PartyDevice/partydevice.md) | Represents a device across networks. |  
| [PartyEndpoint](classes/PartyEndpoint/partyendpoint.md) | Represents an endpoint in a network. |  
| [PartyInvitation](classes/PartyInvitation/partyinvitation.md) | Represents an invitation used to authenticate a user into a network. |  
| [PartyLocalChatControl](classes/PartyLocalChatControl/partylocalchatcontrol.md) | The management class for chat operations related to the local device. |  
| [PartyLocalDevice](classes/PartyLocalDevice/partylocaldevice.md) | Represents the local device. |  
| [PartyLocalEndpoint](classes/PartyLocalEndpoint/partylocalendpoint.md) | Represents a local endpoint. |  
| [PartyLocalUser](classes/PartyLocalUser/partylocaluser.md) | Represents a local user. |  
| [PartyManager](classes/PartyManager/partymanager.md) | The primary management class for interacting with the Party library. |  
| [PartyNetwork](classes/PartyNetwork/partynetwork.md) | Represents a network. |  
| [PartyTextToSpeechProfile](classes/PartyTextToSpeechProfile/partytexttospeechprofile.md) | Represents the voice profile used to synthesize speech. |  
  
## Callbacks  

| Callback | Description |  
| --- | --- |  
| [PartyAllocateMemoryCallback](callbacks/partyallocatememorycallback.md) | A callback invoked every time a new memory buffer must be dynamically allocated by the Party library. |  
| [PartyFreeMemoryCallback](callbacks/partyfreememorycallback.md) | A callback invoked every time a previously allocated memory buffer is no longer needed by the Party library and can be freed. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PartyDataBuffer](structs/partydatabuffer.md) | A data buffer. |  
| [PartyInvitationConfiguration](structs/partyinvitationconfiguration.md) | Invitation configuration data. |  
| [PartyLocalUdpSocketBindAddressConfiguration](structs/partylocaludpsocketbindaddressconfiguration.md) | The configuration used by the Party library to bind to a UDP socket. |  
| [PartyNetworkConfiguration](structs/partynetworkconfiguration.md) | Network configuration data. |  
| [PartyNetworkDescriptor](structs/partynetworkdescriptor.md) | A descriptor containing the data required for a device to connect to a network. |  
| [PartyRegion](structs/partyregion.md) | Represents a Party library region. |  
| [PartySendMessageQueuingConfiguration](structs/partysendmessagequeuingconfiguration.md) | Optional configuration parameters for modifying local queuing behavior when sending a message. |  
| [PartyTranslation](structs/partytranslation.md) | A translation. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
| [PartyAuthenticateLocalUserCompletedStateChange](structs/partyauthenticatelocalusercompletedstatechange.md) | Information specific to the *AuthenticateLocalUserCompleted* type of state change. |  
| [PartyChatControlCreatedStateChange](structs/partychatcontrolcreatedstatechange.md) | Information specific to the *ChatControlCreated* type of state change. |  
| [PartyChatControlDestroyedStateChange](structs/partychatcontroldestroyedstatechange.md) | Information specific to the *ChatControlDestroyed* type of state change. |  
| [PartyChatControlJoinedNetworkStateChange](structs/partychatcontroljoinednetworkstatechange.md) | Information specific to the *ChatControlJoinedNetwork* type of state change. |  
| [PartyChatControlLeftNetworkStateChange](structs/partychatcontrolleftnetworkstatechange.md) | Information specific to the *ChatControlLeftNetwork* type of state change. |  
| [PartyChatTextReceivedStateChange](structs/partychattextreceivedstatechange.md) | Information specific to the *ChatTextReceived* type of state change. |  
| [PartyConnectChatControlCompletedStateChange](structs/partyconnectchatcontrolcompletedstatechange.md) | Information specific to the *ConnectChatControlCompleted* type of state change. |  
| [PartyConnectToNetworkCompletedStateChange](structs/partyconnecttonetworkcompletedstatechange.md) | Information specific to the *ConnectToNetworkCompleted* type of state change. |  
| [PartyCreateChatControlCompletedStateChange](structs/partycreatechatcontrolcompletedstatechange.md) | Information specific to the *CreateChatControlCompleted* type of state change. |  
| [PartyCreateEndpointCompletedStateChange](structs/partycreateendpointcompletedstatechange.md) | Information specific to the *CreateEndpointCompleted* type of state change. |  
| [PartyCreateInvitationCompletedStateChange](structs/partycreateinvitationcompletedstatechange.md) | Information specific to the *CreateInvitationCompleted* type of state change. |  
| [PartyCreateNewNetworkCompletedStateChange](structs/partycreatenewnetworkcompletedstatechange.md) | Information specific to the *CreateNewNetworkCompleted* type of state change. |  
| [PartyDataBuffersReturnedStateChange](structs/partydatabuffersreturnedstatechange.md) | Information specific to the *DataBuffersReturned* type of state change. |  
| [PartyDestroyChatControlCompletedStateChange](structs/partydestroychatcontrolcompletedstatechange.md) | Information specific to the *DestroyChatControlCompleted* type of state change. |  
| [PartyDestroyEndpointCompletedStateChange](structs/partydestroyendpointcompletedstatechange.md) | Information specific to the *DestroyEndpointCompleted* type of state change. |  
| [PartyDestroyLocalUserCompletedStateChange](structs/partydestroylocalusercompletedstatechange.md) | Information specific to the *DestroyLocalUserCompleted* type of state change. |  
| [PartyDisconnectChatControlCompletedStateChange](structs/partydisconnectchatcontrolcompletedstatechange.md) | Information specific to the *DisconnectChatControlCompleted* type of state change. |  
| [PartyEndpointCreatedStateChange](structs/partyendpointcreatedstatechange.md) | Information specific to the *EndpointCreated* type of state change. |  
| [PartyEndpointDestroyedStateChange](structs/partyendpointdestroyedstatechange.md) | Information specific to the *EndpointDestroyed* type of state change. |  
| [PartyEndpointMessageReceivedStateChange](structs/partyendpointmessagereceivedstatechange.md) | Information specific to the *EndpointMessageReceived* type of state change. |  
| [PartyInvitationCreatedStateChange](structs/partyinvitationcreatedstatechange.md) | Information specific to the *InvitationCreated* type of state change. |  
| [PartyInvitationDestroyedStateChange](structs/partyinvitationdestroyedstatechange.md) | Information specific to the *InvitationDestroyed* type of state change. |  
| [PartyLeaveNetworkCompletedStateChange](structs/partyleavenetworkcompletedstatechange.md) | Information specific to the *LeaveNetworkCompleted* type of state change. |  
| [PartyLocalChatAudioInputChangedStateChange](structs/partylocalchataudioinputchangedstatechange.md) | Information specific to the *LocalChatAudioInputChanged* type of state change. |  
| [PartyLocalChatAudioOutputChangedStateChange](structs/partylocalchataudiooutputchangedstatechange.md) | Information specific to the *LocalChatAudioOutputChanged* type of state change. |  
| [PartyLocalUserRemovedStateChange](structs/partylocaluserremovedstatechange.md) | Information specific to the *LocalUserRemoved* type of state change. |  
| [PartyNetworkConfigurationMadeAvailableStateChange](structs/partynetworkconfigurationmadeavailablestatechange.md) | Information specific to the *NetworkConfigurationMadeAvailable* type of state change. |  
| [PartyNetworkDescriptorChangedStateChange](structs/partynetworkdescriptorchangedstatechange.md) | Information specific to the *NetworkDescriptorChanged* type of state change. |  
| [PartyNetworkDestroyedStateChange](structs/partynetworkdestroyedstatechange.md) | Information specific to the *NetworkDestroyed* type of state change. |  
| [PartyPopulateAvailableTextToSpeechProfilesCompletedStateChange](structs/partypopulateavailabletexttospeechprofilescompletedstatechange.md) | Information specific to the *PopulateAvailableTextToSpeechProfilesCompleted* type of state change. |  
| [PartyRegionsChangedStateChange](structs/partyregionschangedstatechange.md) | Information specific to the *RegionsChanged* type of state change. |  
| [PartyRemoteDeviceCreatedStateChange](structs/partyremotedevicecreatedstatechange.md) | Information specific to the *RemoteDeviceCreated* type of state change. |  
| [PartyRemoteDeviceDestroyedStateChange](structs/partyremotedevicedestroyedstatechange.md) | Information specific to the *RemoteDeviceDestroyed* type of state change. |  
| [PartyRemoteDeviceJoinedNetworkStateChange](structs/partyremotedevicejoinednetworkstatechange.md) | Information specific to the *RemoteDeviceJoinedNetwork* type of state change. |  
| [PartyRemoteDeviceLeftNetworkStateChange](structs/partyremotedeviceleftnetworkstatechange.md) | Information specific to the *RemoteDeviceLeftNetwork* type of state change. |  
| [PartyRemoveLocalUserCompletedStateChange](structs/partyremovelocalusercompletedstatechange.md) | Information specific to the *RemoveLocalUserCompleted* type of state change. |  
| [PartyRevokeInvitationCompletedStateChange](structs/partyrevokeinvitationcompletedstatechange.md) | Information specific to the *RevokeInvitationCompleted* type of state change. |  
| [PartySetChatAudioInputCompletedStateChange](structs/partysetchataudioinputcompletedstatechange.md) | Information specific to the *SetChatAudioInputCompleted* type of state change. |  
| [PartySetChatAudioOutputCompletedStateChange](structs/partysetchataudiooutputcompletedstatechange.md) | Information specific to the *SetChatAudioOutputCompleted* type of state change. |  
| [PartySetLanguageCompletedStateChange](structs/partysetlanguagecompletedstatechange.md) | Information specific to the *SetLanguageCompleted* type of state change. |  
| [PartySetTextChatOptionsCompletedStateChange](structs/partysettextchatoptionscompletedstatechange.md) | Information specific to the *PartySetTextChatOptionsCompleted* type of state change. |  
| [PartySetTextToSpeechProfileCompletedStateChange](structs/partysettexttospeechprofilecompletedstatechange.md) | Information specific to the *SetTextToSpeechProfileCompleted* type of state change. |  
| [PartySetTranscriptionOptionsCompletedStateChange](structs/partysettranscriptionoptionscompletedstatechange.md) | Information specific to the *SetTranscriptionOptionsCompleted* type of state change. |  
| [PartyStateChange](structs/partystatechange.md) | A generic, base structure representation of an event or change in state. |  
| [PartySynthesizeTextToSpeechCompletedStateChange](structs/partysynthesizetexttospeechcompletedstatechange.md) | Information specific to the *SynthesizeTextToSpeechCompleted* type of state change. |  
| [PartyVoiceChatTranscriptionReceivedStateChange](structs/partyvoicechattranscriptionreceivedstatechange.md) | Information specific to the *VoiceChatTranscriptionReceived* type of state change. |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PartyAudioDeviceSelectionType](enums/partyaudiodeviceselectiontype.md) | Options for selecting audio devices|  
| [PartyAudioInputState](enums/partyaudioinputstate.md) | States of an audio input associated with a local chat control.|  
| [PartyAudioOutputState](enums/partyaudiooutputstate.md) | States of an audio output associated with a local chat control.|  
| [PartyChatControlChatIndicator](enums/partychatcontrolchatindicator.md) | Audio states for a target chat control in relation to a local chat control.|  
| [PartyChatPermissionOptions](enums/partychatpermissionoptions.md) | Options for defining the communication relationship between two chat controls.|  
| [PartyDestroyedReason](enums/partydestroyedreason.md) | Reasons an object might be destroyed.|  
| [PartyEndpointStatistic](enums/partyendpointstatistic.md) | Types of statistics that can be retrieved for an endpoint.|  
| [PartyGender](enums/partygender.md) | Genders for text to speech profiles.|  
| [PartyInvitationRevocability](enums/partyinvitationrevocability.md) | Options for who may revoke an invitation.|  
| [PartyLocalChatControlChatIndicator](enums/partylocalchatcontrolchatindicator.md) | Audio states for a local chat control.|  
| [PartyLocalUdpSocketBindAddressOptions](enums/partylocaludpsocketbindaddressoptions.md) | Additional options to control how the Party library binds to the UDP socket specified by the [PartyLocalUdpSocketBindAddressConfiguration](structs/partylocaludpsocketbindaddressconfiguration.md) structure.|  
| [PartyLocalUserRemovedReason](enums/partylocaluserremovedreason.md) | Reasons for removing a local user from a network.|  
| [PartyMessageReceivedOptions](enums/partymessagereceivedoptions.md) | Flags describing how a message was received.|  
| [PartyNetworkStatistic](enums/partynetworkstatistic.md) | Types of statistics that can be retrieved for a network.|  
| [PartyOption](enums/partyoption.md) | Additional options that can be set to fine-tune Party library functionality.|  
| [PartySendMessageOptions](enums/partysendmessageoptions.md) | Options for controlling how a message is sent.|  
| [PartyStateChangeResult](enums/partystatechangeresult.md) | Results for operations that generate state changes.|  
| [PartyStateChangeType](enums/partystatechangetype.md) | The types of state changes that can occur.|  
| [PartySynthesizeTextToSpeechType](enums/partysynthesizetexttospeechtype.md) | Types of text-to-speech operations.|  
| [PartyTextChatOptions](enums/partytextchatoptions.md) | Text chat options.|  
| [PartyThreadId](enums/partythreadid.md) | Types of threads that Party library uses for internal purposes.|  
| [PartyTranslationReceivedOptions](enums/partytranslationreceivedoptions.md) | Flags describing how a translation was received.|  
| [PartyVoiceChatTranscriptionOptions](enums/partyvoicechattranscriptionoptions.md) | Voice chat transcription options.|  
| [PartyVoiceChatTranscriptionPhraseType](enums/partyvoicechattranscriptionphrasetype.md) | Types of transcription phrases.|  
