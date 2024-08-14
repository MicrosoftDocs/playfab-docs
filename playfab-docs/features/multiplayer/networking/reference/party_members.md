---
author: jdeweyMSFT
title: "Party C/C++ API overview"
description: "Party C/C++ API overview"
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/29/2024
---

# Party C/C++ API overview

  
## Classes  

| Class | Description |  
| --- | --- |  
| [PartyAudioManipulationSinkStream](classes/PartyAudioManipulationSinkStream/partyaudiomanipulationsinkstream.md) | The management class for submitting audio to an audio sink stream. |  
| [PartyAudioManipulationSourceStream](classes/PartyAudioManipulationSourceStream/partyaudiomanipulationsourcestream.md) | The management class for obtaining audio from an audio source stream. |  
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
| [PartyProfilingMethodEntranceCallback](callbacks/partyprofilingmethodentrancecallback.md) | A callback invoked every time the Party library enters an instrumented method. |  
| [PartyProfilingMethodExitCallback](callbacks/partyprofilingmethodexitcallback.md) | A callback invoked every time the Party library is about to exit an instrumented method. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PartyAudioFormat](structs/partyaudioformat.md) | The format information needed to interpret Party audio data. |  
| [PartyAudioManipulationSinkStreamConfiguration](structs/partyaudiomanipulationsinkstreamconfiguration.md) | The configuration information needed to set up an audio sink stream. |  
| [PartyAudioManipulationSourceStreamConfiguration](structs/partyaudiomanipulationsourcestreamconfiguration.md) | The configuration information needed to set up an audio source stream. |  
| [PartyDataBuffer](structs/partydatabuffer.md) | A data buffer. |  
| [PartyInvitationConfiguration](structs/partyinvitationconfiguration.md) | Invitation configuration data. |  
| [PartyLocalUdpSocketBindAddressConfiguration](structs/partylocaludpsocketbindaddressconfiguration.md) | The configuration used by the Party library to bind to a UDP socket. |  
| [PartyMutableDataBuffer](structs/partymutabledatabuffer.md) | A data buffer that can be modified by the app. |  
| [PartyNetworkConfiguration](structs/partynetworkconfiguration.md) | Network configuration data. |  
| [PartyNetworkDescriptor](structs/partynetworkdescriptor.md) | A descriptor containing the data required for a device to connect to a network. |  
| [PartyProfilingMethodEntranceEventData](structs/partyprofilingmethodentranceeventdata.md) | Information specific to the *MethodEntrance* type of profiling event. |  
| [PartyProfilingMethodExitEventData](structs/partyprofilingmethodexiteventdata.md) | Information specific to the *MethodExit* type of profiling event. |  
| [PartyRegion](structs/partyregion.md) | Represents a Party library region. |  
| [PartyRegionQualityMeasurementConfiguration](structs/partyregionqualitymeasurementconfiguration.md) | The configuration used by the Party library to control region quality measurement behavior. |  
| [PartyRegionUpdateConfiguration](structs/partyregionupdateconfiguration.md) | The configuration used by the Party library to control how it performs automatic region discovery and connection quality measurement updates. |  
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
| [PartyConfigureAudioManipulationCaptureStreamCompletedStateChange](structs/partyconfigureaudiomanipulationcapturestreamcompletedstatechange.md) | Information specific to the *ConfigureAudioManipulationCaptureStreamCompleted* type of state change. |  
| [PartyConfigureAudioManipulationRenderStreamCompletedStateChange](structs/partyconfigureaudiomanipulationrenderstreamcompletedstatechange.md) | Information specific to the *ConfigureAudioManipulationRenderStreamCompleted* type of state change. |  
| [PartyConfigureAudioManipulationVoiceStreamCompletedStateChange](structs/partyconfigureaudiomanipulationvoicestreamcompletedstatechange.md) | Information specific to the *ConfigureAudioManipulationVoiceStreamCompleted* type of state change. |  
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
| [PartySetTextChatOptionsCompletedStateChange](structs/partysettextchatoptionscompletedstatechange.md) | Information specific to the *PartySetTextChatOptionsCompleted* type of state change. |  
| [PartySetTextToSpeechProfileCompletedStateChange](structs/partysettexttospeechprofilecompletedstatechange.md) | Information specific to the *SetTextToSpeechProfileCompleted* type of state change. |  
| [PartySetTranscriptionOptionsCompletedStateChange](structs/partysettranscriptionoptionscompletedstatechange.md) | Information specific to the *SetTranscriptionOptionsCompleted* type of state change. |  
| [PartyStateChange](structs/partystatechange.md) | A generic, base structure representation of an event or change in state in the Party library. |  
| [PartySynthesizeTextToSpeechCompletedStateChange](structs/partysynthesizetexttospeechcompletedstatechange.md) | Information specific to the *SynthesizeTextToSpeechCompleted* type of state change. |  
| [PartyVoiceChatTranscriptionReceivedStateChange](structs/partyvoicechattranscriptionreceivedstatechange.md) | Information specific to the *VoiceChatTranscriptionReceived* type of state change. |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PartyAudioDeviceSelectionType](enums/partyaudiodeviceselectiontype.md) | Options for selecting audio devices|  
| [PartyAudioInputState](enums/partyaudioinputstate.md) | States of an audio input associated with a local chat control.|  
| [PartyAudioOutputState](enums/partyaudiooutputstate.md) | States of an audio output associated with a local chat control.|  
| [PartyAudioSampleType](enums/partyaudiosampletype.md) | Types of Party audio samples.|  
| [PartyAudioSourceType](enums/partyaudiosourcetype.md) | Types of Party audio sources.|  
| [PartyChatControlChatIndicator](enums/partychatcontrolchatindicator.md) | Audio states for a target chat control in relation to a local chat control.|  
| [PartyChatPermissionOptions](enums/partychatpermissionoptions.md) | Options for defining the communication relationship between two chat controls.|  
| [PartyChatTextReceivedOptions](enums/partychattextreceivedoptions.md) | Flags describing the received text message in PartyChatTextReceivedStateChange.|  
| [PartyDestroyedReason](enums/partydestroyedreason.md) | Reasons an object might be destroyed.|  
| [PartyDeviceConnectionType](enums/partydeviceconnectiontype.md) | The type of connection used for transmitting endpoint message or chat data to a device.|  
| [PartyDirectPeerConnectivityOptions](enums/partydirectpeerconnectivityoptions.md) | Flags controlling the attempted use of direct peer-to-peer connectivity among devices in a network.|  
| [PartyEndpointLocationFilter](enums/partyendpointlocationfilter.md) | Categories of owning device locations of endpoints that can be used to filter the results returned by PartyNetwork::GetEndpointsByUserType().|  
| [PartyEndpointStatistic](enums/partyendpointstatistic.md) | Types of statistics that can be retrieved for an endpoint.|  
| [PartyEndpointUserTypeFilter](enums/partyendpointusertypefilter.md) | Categories of users associated with endpoints that can be used to filter the results returned by PartyNetwork::GetEndpointsByUserType().|  
| [PartyGender](enums/partygender.md) | Genders for text-to-speech profiles.|  
| [PartyInvitationRevocability](enums/partyinvitationrevocability.md) | Options for who may revoke an invitation.|  
| [PartyLocalChatControlChatIndicator](enums/partylocalchatcontrolchatindicator.md) | Audio states for a local chat control.|  
| [PartyLocalUdpSocketBindAddressOptions](enums/partylocaludpsocketbindaddressoptions.md) | Additional options to control how the Party library binds to the UDP socket specified by the [PartyLocalUdpSocketBindAddressConfiguration](structs/partylocaludpsocketbindaddressconfiguration.md) structure.|  
| [PartyLocalUserRemovedReason](enums/partylocaluserremovedreason.md) | Reasons for removing a local user from a network.|  
| [PartyMessageReceivedOptions](enums/partymessagereceivedoptions.md) | Flags describing how a message was received.|  
| [PartyNetworkStatistic](enums/partynetworkstatistic.md) | Types of statistics that can be retrieved for a network.|  
| [PartyOption](enums/partyoption.md) | Additional options that can be set to fine-tune Party library functionality.|  
| [PartyRegionUpdateMode](enums/partyregionupdatemode.md) | Configuration modes representing how the Party library performs automatic region discovery and connection quality measurement as part of the [PartyRegionUpdateConfiguration](structs/partyregionupdateconfiguration.md) structure.|  
| [PartySendMessageOptions](enums/partysendmessageoptions.md) | Options for controlling how a message is sent.|  
| [PartyStateChangeResult](enums/partystatechangeresult.md) | Results for Party library operations that generate state changes.|  
| [PartyStateChangeType](enums/partystatechangetype.md) | The types of state changes that can occur in the Party library.|  
| [PartySynthesizeTextToSpeechType](enums/partysynthesizetexttospeechtype.md) | Types of text-to-speech operations.|  
| [PartyTextChatFilterLevel](enums/partytextchatfilterlevel.md) | The level of filtering that applies to incoming text chat when text moderation is enabled with [PartyLocalChatControl::SetTextChatOptions](classes/PartyLocalChatControl/methods/partylocalchatcontrol_settextchatoptions.md).|  
| [PartyTextChatOptions](enums/partytextchatoptions.md) | Text chat options.|  
| [PartyThreadId](enums/partythreadid.md) | High-level categorization of internal processing tasks.|  
| [PartyTranslationReceivedOptions](enums/partytranslationreceivedoptions.md) | Flags describing how a translation was received.|  
| [PartyVoiceAudioOptions](enums/partyvoiceaudiooptions.md) | Voice audio options.|  
| [PartyVoiceChatTranscriptionOptions](enums/partyvoicechattranscriptionoptions.md) | Voice chat transcription options.|  
| [PartyVoiceChatTranscriptionPhraseType](enums/partyvoicechattranscriptionphrasetype.md) | Types of transcription phrases.|  
| [PartyWorkMode](enums/partyworkmode.md) | Configuration modes representing how the Party library will manage an internal processing task.|  
