---
author: fschober-atg
title: "PlayFab Party Error Codes"
description: Error codes used by PlayFab Party APIs
ms.author: fschober
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/11/2022
---

# PlayFab Party Error Codes
The following error codes are used by the PlayFab Party APIs:

## Common errors
| Hex | Dec | Description |
| ------ | ------ | ------ |
| 0x0001 | 1 | Encountered unknown error. |
| 0x0002 | 2 | Failed to allocate memory. |
| 0x0003 | 3 | API not implemented. |
| 0x0004 | 4 | Invalid argument specified. |
| 0x0005 | 5 | Failed to create new thread. |
| 0x0006 | 6 | Failed to find specified resource. |
| 0x0007 | 7 | The operation is pending. |
| 0x0008 | 8 | Unmapped platform error. |
| 0x0009 | 9 | Unmapped messaging error. |
| 0x000A | 10 | The buffer passed is too small. |
| 0x000B | 11 | A component is in an invalid state to perform the requested operation. |
| 0x000C | 12 | A thread created in a suspended state couldn't be started. |
| 0x0018 | 24 | The specified PlayFab Entity ID is invalid. |
| 0x0020 | 32 | The PlayFab token is too large. |
| 0x0022 | 34 | The specified PlayFab Entity ID hasn't been provided to the Party library. |
| 0x0023 | 35 | The PlayFab entity token is malformed or otherwise invalid. |
| 0x0024 | 36 | The user isn't authorized to execute the operation. |
| 0x0026 | 38 | At least one data buffer with at least one byte must be provided. |
| 0x0029 | 41 | A specified argument was valid but support is unimplemented. |
| 0x002C | 44 | An error was encountered while validating the PlayFab entity token. |
| 0x002D | 45 | The provided network configuration struct was invalid. |
| 0x002E | 46 | The provided invitation failed to specify an identifier. |
| 0x002F | 47 | The provided invitation specified too many Entity IDs. |
| 0x0030 | 48 | The provided invitation's identifier was too long. |
| 0x0031 | 49 | The provided invitation's revocability was invalid. |
| 0x0032 | 50 | Another invitation with the provided identifier already exists in the network. |
| 0x0036 | 54 | This operation is already in progress. |
| 0x0039 | 57 | Insufficient buffer supplied to network transport. |
| 0x003A | 58 | Network interface not ready. |
| 0x003B | 59 | Network interface has failed. |
| 0x003C | 60 | Failed to bind because the local address is already in use. |
| 0x003D | 61 | Failed to complete the operation because a system limit was reached. |
| 0x003E | 62 | Network transport failed to complete operation because associated data was too large. |
| 0x003F | 63 | Failed to establish or maintain a connection to a network or remote peer. |
| 0x0040 | 64 | The remote side denied an incoming connection. |
| 0x0044 | 68 | A packet was dropped on the wire. |
| 0x0045 | 69 | A packet with malformed data was received. |
| 0x0046 | 70 | A duplicate handle was supplied to network transport. |
| 0x0048 | 72 | Network transport channel was terminated. |
| 0x0049 | 73 | Network transport link was remotely terminated. |
| 0x004A | 74 | Network transport link was locally terminated. |
| 0x004B | 75 | The network transport hostname isn't valid or couldn't be resolved. |
| 0x004C | 76 | Remote side forcibly closed socket. |
| 0x004E | 78 | Network transport operation timed out. |
| 0x0051 | 81 | A network transport link can't be created because one already exists to that remote address. |
| 0x0052 | 82 | An attempt to create a secure connection timed out. |
| 0x0053 | 83 | A request to a PlayFab service timed out. |
| 0x0054 | 84 | An internal error was encountered while processing a service request. |
| 0x0055 | 85 | The http connection was reset or terminated. |
| 0x0056 | 86 | The http operation was unexpectedly canceled. |
| 0x0057 | 87 | The http response was smaller than expected. |
| 0x0058 | 88 | The http response was larger than expected. |
| 0x005B | 91 | A platform operation provided a generic failure code. |
| 0x005C | 92 | The PlayFab entity token has expired. |
| 0x005D | 93 | The http request was throttled by the service. |
| 0x0069 | 105 | The http request failed due to an invalid certificate. |
| 0x006D | 109 | The target device isn't in the network. |
| 0x006F | 111 | The operation couldn't be completed because the neceessary DTLS handshake state already expired or was missing. |
| 0x0070 | 112 | The remote address for the link hasn't yet been set. |
| 0x0071 | 113 | The network transport operation isn't supported on this platform. |
| 0x0072 | 114 | An invalid platform type was encountered. |
| 0x0073 | 115 | The string couldn't be converted to a UUID. |
| 0x0077 | 119 | No network transport DTLS handshake data bytes were generated even after a retry. |
| 0x0078 | 120 | The local network transport device doesn't have the required secure transport enabled. |
| 0x0079 | 121 | The device described by the remote network transport address doesn't have the required secure transport enabled. |
| 0x007D | 125 | The network transport potential target didn't generate DTLS handshake data bytes. |
| 0x007F | 127 | Performing a network transport digest operation failed. |
| 0x0082 | 130 | A port number was required by network transport but was missing. |
| 0x0083 | 131 | No usable local network addresses exist for network transport. |
| 0x0085 | 133 | The PlayFab service detected a concurrent, conflicting change and couldn't complete the operation. Most commonly, this error is caused by multiple clients calling the same PlayFab API with the same PlayFab entity. |
| 0x0089 | 137 | Setting work mode after Party initialization is forbidden. |
| 0x008D | 141 | The operation couldn't be performed in the current work mode. |
| 0x008E | 142 | The operation couldn't be performed because it wasn't invoked from a thread in a COM multithreaded apartment. |
| 0x008F | 143 | Text moderation service isn't enabled for this title; please contact Microsoft to enable. |
| 0x0090 | 144 | The service encountered an error performing text moderation. |
| 0x0093 | 147 | Moderation of text chat on direct peer connections is unsupported. |
| 0x0095 | 149 | Setting profiling callbacks after Party initialization is forbidden. |
| 0x009E | 158 | The network transport operation needed resources that are currently busy. |
| 0x00A0 | 160 | The http request failed due to an error in the SSL certificate sent by the server. |
| 0x00A1 | 161 | The network transport hostname couldn't be resolved. |
| 0x00A2 | 162 | The network transport hostname didn't have any associated IP addresses. |
| 0x00A3 | 163 | Resolving the network transport hostname didn't return any results. |
| 0x00A9 | 169 | An operation failed due to an invalid URL. |
| 0x00AC | 172 | The system denied access permissions to bind the UDP socket or other network transport operation. |
| 0x00B9 | 185 | The entity type is not one of the currently supported types. |

## Client errors
| Hex | Dec | Description |
| ------ | ------ | ------ |
| 0x1000 | 4096 | The Party library must be initialized. |
| 0x1001 | 4097 | A user is already associated with the specified chat control. |
| 0x1002 | 4098 | The operation was called with an invalid handle. |
| 0x1003 | 4099 | Can't create local user; local user limit reached. |
| 0x1004 | 4100 | Can't create local user; local user already exists. |
| 0x1005 | 4101 | Only one PartyManager instance may exist at a time. |
| 0x1006 | 4102 | Can't connect to network; network already connected. |
| 0x1007 | 4103 | Internet connectivity error encountered. |
| 0x1008 | 4104 | Operation couldn't be performed because object is being destroyed. |
| 0x1009 | 4105 | Can't create another chat control; chat control limit reached. |
| 0x100C | 4108 | The thread affinity mask requested a processor that isn't selected for the process affinity mask. |
| 0x100E | 4110 | Information about the endpoint isn't yet available because the endpoint is still being created. |
| 0x1010 | 4112 | The request to create a network failed because there are no servers were available. |
| 0x1011 | 4113 | Failed to access the audio device. |
| 0x1012 | 4114 | Audio operation failed because it was provided an unsupported audio format. |
| 0x1013 | 4115 | The device handle must reference a local device. |
| 0x1014 | 4116 | The chat control handle must reference a local chat control. |
| 0x1015 | 4117 | The endpoint handle must reference a local endpoint. |
| 0x1016 | 4118 | The specified audio output is pending initialization. |
| 0x1017 | 4119 | The specified audio output was recognized but disabled. |
| 0x1018 | 4120 | The specified audio output was recognized but not present. |
| 0x1019 | 4121 | The specified audio output was recognized but currently unplugged. |
| 0x101A | 4122 | The allocation service is unavailable. |
| 0x101B | 4123 | Too many data buffers provided for sending a message. |
| 0x1022 | 4130 | The client couldn't find the specified endpoint ID. |
| 0x1023 | 4131 | The specified endpoint ID was invalid or out of range. |
| 0x1025 | 4133 | Can't create an endpoint because the limit specified by the network configuration has been reached. |
| 0x102C | 4140 | The endpoint list isn't yet available. |
| 0x102F | 4143 | Using a local target chat control is unsupported. |
| 0x1031 | 4145 | Too many target endpoints specified for sending a message. |
| 0x1034 | 4148 | The network handle provided doesn't own the provided endpoint handle. |
| 0x103E | 4158 | The client failed to resolve the network's IP address and port strings. |
| 0x103F | 4159 | The multiplayer server response specified an unexpected Azure region. |
| 0x1040 | 4160 | Attempted to create an endpoint or connect a chat control with an unauthenticated local user. |
| 0x1042 | 4162 | The serialized network descriptor isn't supported by this version of the Party library. |
| 0x1043 | 4163 | The network identifier is invalid. |
| 0x1044 | 4164 | The region name is invalid. |
| 0x1045 | 4165 | The network descriptor's opaque connection information is invalid. |
| 0x1046 | 4166 | The size of the serialized network descriptor string is too small to be deserialized into valid data. |
| 0x1049 | 4169 | The chat control is already in the specified network. |
| 0x104A | 4170 | The chat control isn't in the specified network. |
| 0x104B | 4171 | The opaque connection information isn't supported by this version of the Party library. |
| 0x104C | 4172 | The hostname contained in the network descriptor's opaque connection information was invalid. |
| 0x104D | 4173 | The port contained in the network descriptor's opaque connection information was invalid. |
| 0x104E | 4174 | The network configuration isn't available yet. |
| 0x104F | 4175 | The audio render volume was out of the allowable range [0.0, 1.0]. |
| 0x1051 | 4177 | Attempted to perform an invitation operation on behalf of an unauthenticated local user. |
| 0x1058 | 4184 | The provided target chat control list contained at least one duplicate chat control. |
| 0x1059 | 4185 | The provided target endpoint list contained at least one duplicate endpoint. |
| 0x105A | 4186 | A platform error resulted in failure to determine the preferred UI language. |
| 0x105B | 4187 | XAudio 2.7 debug version not installed on system (install the DirectX SDK Developer Runtime). |
| 0x105C | 4188 | XAudio 2.7 not installed on system (install the DirectX End-user Runtimes (June 2010)). |
| 0x105E | 4190 | Authentication was attempted for a user that is already authenticated. |
| 0x1062 | 4194 | The text-to-speech synthesis request was rejected by the service for being too large. |
| 0x1063 | 4195 | The text-to-speech synthesis request was throttled. |
| 0x1064 | 4196 | The text-to-speech synthesis request was unauthorized. |
| 0x1065 | 4197 | The text-to-speech synthesis request was canceled. |
| 0x1066 | 4198 | The provided text-to-speech synthesis string was longer than the max text-to-speech synthesis string length. |
| 0x1069 | 4201 | Parsing the transcription phrase text failed. |
| 0x106A | 4202 | The region list couldn't be determined. |
| 0x106B | 4203 | This version of the Party library isn't compatible with the PlayFab service. |
| 0x106C | 4204 | The hostname returned by the allocation request was invalid. |
| 0x106D | 4205 | The send message queuing priority wasn't within the allowed range. |
| 0x1071 | 4209 | The ping to the quality of service beacon timed out. |
| 0x1072 | 4210 | No supported regions were found. |
| 0x1073 | 4211 | The request provided to the PlayFab service was malformed. |
| 0x1074 | 4212 | The title isn't authorized to perform the operation. |
| 0x1075 | 4213 | Tried to send to a local target; loopback isn't yet supported. |
| 0x1079 | 4217 | The specified text to speech profile was invalid. |
| 0x107A | 4218 | Attempted to synthesize text without setting a text to speech profile. |
| 0x107B | 4219 | The provided gender wasn't recognized. |
| 0x107C | 4220 | The remote transcription operation failed. |
| 0x107D | 4221 | An invalid transcription error type was received. |
| 0x107E | 4222 | The specified text to speech profile identifier was too long. |
| 0x107F | 4223 | The specified text to speech profile name was too long. |
| 0x1080 | 4224 | The specified language code was too long. |
| 0x1081 | 4225 | The PlayFab service has throttled requests for this user. |
| 0x1082 | 4226 | The PlayFab service has throttled requests for this title. |
| 0x1083 | 4227 | Parsing the transcription hypothesis text failed. |
| 0x1084 | 4228 | The requested statistic list contained at least one duplicate statistic type. |
| 0x1085 | 4229 | The requested statistic list contained an unrecognized or unsupported statistic type. |
| 0x1086 | 4230 | This title isn't enabled for PlayFab Party use. Check the PlayFab game manager portal. |
| 0x1087 | 4231 | The request to populate text-to-speech profiles was canceled. |
| 0x1089 | 4233 | The service provided an invalid translation response. |
| 0x108A | 4234 | The network's configuration doesn't allow any more unique users. |
| 0x108B | 4235 | The network's configuration doesn't allow any more users on this device. |
| 0x108C | 4236 | The network's configuration doesn't allow this user to authenticate on any more devices. |
| 0x108D | 4237 | The network's configuration doesn't allow this device to connect because the maximum number of devices are already connected. |
| 0x108E | 4238 | The operation failed because it depended on a user authentication that also failed. |
| 0x108F | 4239 | An invalid translation result type was received. |
| 0x1090 | 4240 | Endpoints can't be created without a successfully authenticated user or an authentication in progress. |
| 0x1092 | 4242 | The request to populate text-to-speech profiles encountered an unhandled service error. |
| 0x1094 | 4244 | A translation request returned an unexpected response. |
| 0x1098 | 4248 | The audio device is already in use by another user. |
| 0x1099 | 4249 | The network descriptor is malformed because the checksum doesn't match the expected value. |
| 0x109A | 4250 | The serialized network descriptor is malformed because the checksum doesn't match the expected value. |
| 0x109B | 4251 | The network descriptor is a placeholder that can't be used on this device at this time. |
| 0x109C | 4252 | The serialized network descriptor isn't in an expected format. |
| 0x109E | 4254 | The create invitation operation was canceled. |
| 0x109F | 4255 | The revoke invitation operation was canceled. |
| 0x10A2 | 4258 | The operation couldn't be completed because the invitation doesn't exist. |
| 0x10A4 | 4260 | A quality of service beacon server region name was invalid. |
| 0x10A5 | 4261 | A quality of service beacon server hostname was invalid. |
| 0x10A6 | 4262 | The service returned more quality of service beacon server regions than are supported. |
| 0x10AA | 4266 | The network operation can't complete because creating the network failed. |
| 0x10AB | 4267 | Access to the specified audio output is restricted. |
| 0x10AC | 4268 | The audio device couldn't be initialized because the app doesn't have microphone focus. |
| 0x10AD | 4269 | No audio device was initialized because the app doesn't have microphone focus. |
| 0x10AE | 4270 | No audio devices could be found for the specified user. |
| 0x10AF | 4271 | A user was recognized, but no associated audio device was found. |
| 0x10BA | 4282 | The translation operation was canceled due to chat control destruction. |
| 0x10BC | 4284 | The service failed to validate the provided text-to-speech profile. |
| 0x10BD | 4285 | The service couldn't allocate a network because the requested version was invalid. |
| 0x10C7 | 4295 | This device was disconnected from the Party network because it had no authenticated users for an extended period of time. |
| 0x10C8 | 4296 | The audio device selection context was invalid. |
| 0x10C9 | 4297 | The chat text string must not be empty. |
| 0x10CB | 4299 | XAudio 2.8 and 2.9 not found. These libraries are built in to Windows 8 and Windows 10, respectively. |
| 0x10CD | 4301 | The requested operation can't be performed because the network is already being destroyed. |
| 0x10CE | 4302 | The audio device is already in use by another application and couldn't be initialized. |
| 0x10CF | 4303 | The audio device was removed during initialization. |
| 0x10D0 | 4304 | The Party module couldn't be found or loaded. |
| 0x10D1 | 4305 | The specified PartyOption is unsupported. |
| 0x10D2 | 4306 | The specified object type isn't supported for this PartyOption. |
| 0x10D4 | 4308 | The memory allocate callback and memory free callback must both be null or both be non-null. |
| 0x10D5 | 4309 | SetMemoryCallbacks has already been called and may not be called again for the lifetime of this process. |
| 0x10D7 | 4311 | The Cognitive Services token has expired but hasn't refreshed yet. |
| 0x10D8 | 4312 | The audio stream doesn't have enough space to handle the buffer. |
| 0x10DA | 4314 | The source text didn't contain any characters that could be synthesized. |
| 0x10DC | 4316 | User denied access to the audio device. |
| 0x10DF | 4319 | The specified PartyOption is recognized but not supported for this operation type (get/set). |
| 0x10E0 | 4320 | Failed to process the profanity tags in the transcription provided by the speech service. |
| 0x10E1 | 4321 | Failed to parse the string within the profanity tags indicated by the speech service. |
| 0x10E3 | 4323 | Failed to parse the transcription because it contained an XML tag reserved for the Party network protocol. |
| 0x10E5 | 4325 | The memory callbacks may not be set after any other API call has been made for the lifetime of the process. |
| 0x10E6 | 4326 | A request provided to the PlayFab service had invalid parameters. An invalid region may have been provided to CreateNewNetwork. |
| 0x10EA | 4330 | An unknown error code was returned by the PlayFab service. |
| 0x10EB | 4331 | An unexpected error code was returned by the PlayFab service. |
| 0x10EC | 4332 | An unexpected error code was returned by the PlayFab service with a 4XX response code. |
| 0x10ED | 4333 | An unexpected error code was returned by the PlayFab service with a 5XX response code. |
| 0x10FD | 4349 | The target endpoint list contained multiple endpoints while the statistic list contained a statistic type that only supports a single endpoint. |
| 0x10FE | 4350 | The target endpoint list contained a local endpoint while the statistic list contained a statistic type that only supports remote endpoints. |
| 0x110B | 4363 | The service couldn't allocate a network matching the request. The build alias may be set incorrectly. |
| 0x110D | 4365 | The language code can't be empty. |
| 0x110E | 4366 | The sum of sizes of shared property keys and values provided exceeded the maximum allowed size. |
| 0x110F | 4367 | A duplicate shared property key was provided. |
| 0x1110 | 4368 | An empty shared property value was provided. |
| 0x1112 | 4370 | The number of shared properties provided exceeded the maximum number allowed. |
| 0x1114 | 4372 | A shared property key exceeded the maximum allowed key length. |
| 0x1119 | 4377 | The party text chat filter level is invalid. |
| 0x111A | 4378 | A request provided to the PlayFab service had invalid parameters. An invalid region may have been provided to CreateNewNetwork. |
| 0x111E | 4382 | An empty shared property key was provided. |
| 0x1122 | 4386 | The quality of service beacon hostname couldn't be resolved. |
| 0x1123 | 4387 | The quality of service beacon hostname didn't have any associated IP addresses. |
| 0x1124 | 4388 | Resolving the quality of service beacon hostname didn't return any results. |
| 0x1128 | 4392 | The PartyRegionUpdateMode value is invalid. |
| 0x1129 | 4393 | The region update configuration refresh interval value is invalid. |
| 0x112A | 4394 | The region quality measurement total timeout value is invalid. |
| 0x112B | 4395 | The region quality measurement high latency hint value is invalid. |
| 0x112C | 4396 | The region quality measurement minimum required successful responses value is invalid. |
| 0x112D | 4397 | The region quality measurement ideal number of successful responses value is invalid. |

## Platform-specific errors
| Hex | Dec | Description |
| ------ | ------ | ------ |
| 0x3000 | 12288 | The thread affinity mask didn't specify any processors that are valid for XAudio2 to affinitize its threads to. |
| 0x3001 | 12289 | Unmapped XAudio2 error. |
| 0x3002 | 12290 | Audio operation failed because Windows audio service isn't running. |
| 0x3003 | 12291 | An unspecified platform error occurred when trying to read an environment variable. |
| 0x3004 | 12292 | Couldn't locate the audio device interface path. |
| 0x3005 | 12293 | Device selection type not supported on this platform. |
| 0x3006 | 12294 | Couldn't initialize the Android audio device. |
| 0x3009 | 12297 | The Android audio render device isn't ready. |
| 0x300B | 12299 | Couldn't find iOS audio unit. |
| 0x300C | 12300 | Couldn't set format to iOS audio unit. |
| 0x300E | 12302 | Couldn't initialize iOS audio unit. |
| 0x300F | 12303 | The thread affinity mask didn't specify any processors that are valid for Android to affinitize its threads to. |
| 0x3010 | 12304 | Failed to set the thread affinity. |
| 0x3011 | 12305 | No platform user was specified. |
| 0x3014 | 12308 | The Microsoft gaming runtime DLL wasn't found. |
| 0x3015 | 12309 | The Microsoft gaming runtime DLL doesn't support this version of the GDK. |
| 0x3016 | 12310 | Operation failed because the Microsoft gaming runtime requires an application window to be in the foreground. |
| 0x3017 | 12311 | The Microsoft gaming runtime is in a suspended state. |
| 0x3018 | 12312 | Can't add this user because the max number of users was already added to the Microsoft gaming runtime. |
| 0x3019 | 12313 | Microsoft gaming runtime operation failed because the user is signed out. |
| 0x301A | 12314 | The Microsoft gaming runtime needs UI to resolve an issue with a user. |
| 0x301B | 12315 | Deferral not available in the Microsoft gaming runtime. |
| 0x301C | 12316 | A user matching the ID wasn't found in the Microsoft gaming runtime. |
| 0x301D | 12317 | There isn't a default user for the Microsoft gaming runtime. |
| 0x301E | 12318 | The Microsoft gaming runtime failed to resolve a required user privilege. |
| 0x301F | 12319 | The Microsoft gaming XNetworking feature is unavailable. |
| 0x3020 | 12320 | The network stack must be initialized before calling PartyManager::Initialize(); use the Microsoft Game Core XNetworkingGetConnectivityHint API to determine when the network stack is initialized. |
| 0x3021 | 12321 | Callers must pass a port value of 0 when the PartyLocalUdpSocketBindAddressOptions::ExcludeGameCorePreferredUdpMultiplayerPort option is set. |
| 0x3022 | 12322 | It's invalid to pass PartyLocalUdpSocketBindAddressOptions::ExcludeGameCorePreferredUdpMultiplayerPort in all versions of PlayFab Party except for the Microsoft Game Core version. |
| 0x3023 | 12323 | The user and/or device aren't authorized to use the requested sandbox or aren't authorized to use the requested title in the current sandbox. |
| 0x3024 | 12324 | When using the Microsoft Game Core version of the library, it must be cleaned up when the title is suspended and re-initialized when the title is resumed. |
| 0x3030 | 12336 | The noise suppression model failed to initialize. |
