---
title: PlayFab Party Release Notes
author: ScottMunroMS
description: Release notes for PlayFab Party
ms.author: scmunro
ms.date: 05/15/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, party, release notes, multiplayer, networking
ms.localizationpriority: medium
---

# PlayFab Party Release Notes

> [!NOTE]
> Support for the XDK and Windows 7 platforms ended on August 1, 2023. No new PlayFab Party library updates will be released for those platforms. The PlayFab Party networking and voice services continue to operate with no impact to any titles currently using Windows 7 or XDK versions of the PlayFab Party library.

> [!NOTE]
> Support for 32-bit Android platforms (arm7 and x86) ended on October 19, 2023. No new PlayFab Party library updates will be released for those platforms. The PlayFab Party networking and voice services will continue to operate with no impact to any titles currently using the PlayFab Party library on 32-bit Android platforms.

## 1.10.22

May 15, 2026

### Bug fixes

- Fixed an issue where audio device switching could fail on macOS when connected to a Party network.

## 1.10.21

May 13, 2026

- Upgraded the Windows platform toolset used to build the library from v142 to v143.

### Bug fixes

- Fixed possible voice loss when transitioning between networks while audio manipulation is active.
- Fixed missing final speech-to-text transcription when an audio manipulation capture stream is active.
- Fixed a possible crash on shutdown when the process task queue was deleted before Party finished shutting down.
- Android: Fixed a possible crash when calling [`PartyManager::Initialize`](reference/classes/PartyManager/methods/partymanager_initialize.md) immediately after [`PartyManager::Cleanup`](reference/classes/PartyManager/methods/partymanager_cleanup.md).
- Android: Fixed a memory leak on [`PartyManager::Cleanup`](reference/classes/PartyManager/methods/partymanager_cleanup.md).
- Apple: Restored arm64 (Apple Silicon) support in the macOS universal binary, which was unintentionally dropped in a previous release.
- Fixed a possible use-after-free where internal HTTP tracking objects could be deleted before the backing async task completed.
- Linux: Prevented possible crashes caused by static libraries being clobbered when multiple shared objects link the same dependency.

## 1.10.18

March 26, 2026

-  Improved Linux linker hardening for PlayFab Party.

## 1.10.17

February 23, 2026

- Android: Fix Bluetooth microphones not working.
- Linux: Remove SafeStack.
- Apple: Hide OpenSSL symbols from Party.
- Nintendo Switch 2: Resolved TCP connection error when IP changes.

## 1.10.16

February 2, 2026

- GDK: Added support for environments that use in-proc GRTS.
- GDK: Added support for [`PartyAudioDeviceSelectionType::SystemDefault`](reference/enums/partyaudiodeviceselectiontype.md).

### Bug fixes

- Fixed possible crash in multinetwork transition scenarios. 

## 1.10.15

December 17, 2025

- Nintendo Switch 2: Added 10-second timeout for web requests.

## 1.10.14

December 9, 2025

- Changed the [`PartyNetwork::CreateEndpoint`](reference/classes/PartyNetwork/methods/partynetwork_createendpoint.md) PartyStatusChangeResult behavior to return `PartyServiceError` for transient errors that occur before the token expires, and to return `UserNotAuthorized` only when the token has expired.
- Android: Added support for 16-KB page sizes to satisfy the new [Android page size requirements](https://developer.android.com/guide/practices/page-sizes).


## 1.10.13

October 14, 2025

- Fixed an issue that caused the microphone to not function properly on iOS 26.
- Apple: Added support for Arm64.xcframework on iOS.

## 1.10.12

October 6, 2025

- Changed the [`PartyNetwork::CreateEndpoint`](reference/classes/PartyNetwork/methods/partynetwork_createendpoint.md) PartyStatusChangeResult behavior to return `PartyServiceError` for transient errors that occur before the token expires, and to return `UserNotAuthorized` only when the token has expired.
- Android: Added support for 16-KB page sizes to satisfy the new [Android page size requirements](https://developer.android.com/guide/practices/page-sizes).
- Apple: Added support for Arm64 simulator builds on iOS.

### Bug fixes
- Fixed an issue where the library can crash when [PartyManager::Cleanup](reference/classes/PartyManager/methods/partymanager_cleanup.md) is called.
- Apple: Added retry logic for microphone focus recovery after interruptions on iOS.
- Apple: Fixed a memory leak that could occur during Party voice chat and transcription.
- Apple: Fixed a potential freeze in PartyLocalChatControl when multiple remote players are connected across different platforms.
- Apple: Added support for Arm64 simulator builds on iOS.

## 1.10.9

March 11, 2025

- Nintendo Switch: Bug fix addressing a crash when loading DLLs of the shipping variant of the library with logging enabled.

## 1.10.8

January 24, 2025

- PlayStation&#174;4 and PlayStation&#174;5: Resolved a crash related to profanity masking on PlayStation platforms.

## 1.10.6

December 10, 2024

- PlayStation&#174;4 and PlayStation&#174;5: Resolved build warnings and errors for integration with C++14 and later versions.

## 1.10.5

November 18, 2024

- Fixed an issue where voice chat sometimes didn't work for users who stayed in a Party network after other users rejoined and left multiple times.
- Fixed an issue where [PartyLocalEndpoint::GetEndpointStatistics](reference/classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md) would report incorrect values for [PartyEndpointStatistic::CurrentlyQueuedSendMessages](reference/enums/partyendpointstatistic.md) and [PartyEndpointStatistic::CurrentlyQueuedSendMessageBytes](reference/enums/partyendpointstatistic.md) when used with direct peer connections.
- Fixed broken symlinks for the framework on macOS.
- Improved handling of log exceptions for non-Windows platforms during collection of SDK logs.

## 1.10.4

November 12, 2024

- PlayStation&#174;4 and PlayStation&#174;5: Resolved crashes related to mutex operations and endpoint state changes during creation and destruction.

## 1.10.3

October 14, 2024

- Added support for up to 128 devices per network. For more information, see [Scalable networks](party-features.md#scalable-networks-up-to-128-devices-per-network).
- Increased `c_maxNetworkConfigurationMaxDeviceCount` from 32 to 128.
- Updated internal diagnostics.
- Updated build settings for security hardening.
- Fixed an issue with exposed OpenSSL symbols on the macOS platform.

## 1.10.2

September 18, 2024

### Bug fixes

- Fixed an issue where the library might crash when it establishes direct peer connections in networks with three or more devices.

## 1.10.0

August 5, 2024

- Added support for `game_server` entities, so servers can connect to Party networks via the SDK and be securely identified by game clients. After authenticating a `game_server` entity via `AuthenticateGameServerWithCustomId`, it can be added as a local user via [PartyManager::CreateLocalUserWithEntityType](reference/classes/PartyManager/methods/partymanager_createlocaluserwithentitytype.md).
- Added methods for determining the entity type associated with each entity in the library. For more information, see [PartyLocalUser::GetEntityType](reference/classes/PartyLocalUser/methods/partylocaluser_getentitytype.md), [PartyEndpoint::GetEntityType](reference/classes/PartyEndpoint/methods/partyendpoint_getentitytype.md), and [PartyChatControl::GetEntityType](reference/classes/PartyChatControl/methods/partychatcontrol_getentitytype.md).
- Added a direct peer connectivity option that enables direct peer connections between `title_player` and `game_server` entities while disallowing direct peer connections between `title_player` entities and other `title_player` entities. For more information, see [PartyDirectPeerConnectivityOptions::OnlyServers](reference/enums/partydirectpeerconnectivityoptions.md).
- Added methods to retrieve a convenient list of endpoints based on filters. For more information, see [PartyNetwork::GetEndpointsByUserType](reference/classes/PartyNetwork/methods/partynetwork_getendpointsbyusertype.md).
- Updated memory allocations by third party libraries used in PlayFab Party on PlayStation&#174;4 and, PlayStation&#174;5 that were using default allocators have been updated to use Party's memory callbacks. Titles using [PartyManager::SetMemoryCallbacks](reference/classes/PartyManager/methods/partymanager_setmemorycallbacks.md) to configure title-specific memory allocation functions allocations will now see and have control over these allocations.

### Bug fixes

- Fixed an issue where the library might crash on Windows or Xbox while the process is terminating.
- Addressed spurious direct peer connection failures after a previous connection attempt failed in certain cases for non Windows platforms.
- Fixed an issue where the DestroyNetwork event wasn't fired during repeated Party network creation and destroying.

### Known issues

- The library might occasionally crash when establishing direct peer connections in networks with three or more devices.

## 1.9.5

May 3, 2024

- Addressed intermittent fatal errors reported in [PartyRegionsChangedStateChange](reference/structs/partyregionschangedstatechange.md) and other operations by Windows devices using features such as connection sharing.
- Fixed a potential crash on Windows and Xbox if process shuts down shortly after starting to use Party.
- Fixed a bug where [`PartyChatControl`](reference/classes/PartyChatControl/partychatcontrol.md) resources would sometimes not be freed up after calling [PartyLocalDevice::DestroyChatControl](reference/classes/PartyLocalDevice/methods/partylocaldevice_destroychatcontrol.md) and would only be released after calling [PartyManager::Cleanup](reference/classes/PartyManager/methods/partymanager_cleanup.md).
- Android: Resolved duplicate class error when Party and Multiplayer are used in the same app.

## 1.9.4

March 20, 2024

- Fixed a bug where [`PartyLocalDevice::CreateChatControl`](reference/classes/PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md) would fail on PlayStation&#174;4 and, PlayStation&#174;5 when Ukrainian is set as the console's language.

“PlayStation” is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.9.3

March 14, 2024

- Fixed a potential use-after-free bug when speech-to-text is enabled.
- Fixed a potential crash when direct peer connections are enabled.
- Improved internal diagnostics.

## 1.9.2

March 5, 2024

- Patched audio render bug on Linux platform. Linux clients can now fully hear other platform clients.

## 1.9.1

February 5, 2024

- Added [`PartyOption::RegionUpdateConfiguration`](reference/enums/partyoption.md) and [`PartyOption::RegionQualityMeasurementConfiguration`](reference/enums/partyoption.md) for advanced control over when and how the Party library performs automatic region discovery and connection quality measurements.

## 1.8.11

November 13, 2023

- Fixed a bug where a crash might occur when a client tries to leave a network on Nintendo Switch.

## 1.8.10

October 19, 2023

This release updates the minimum SDK version and target SDK version for PlayFab Party Apple and Android platforms.

For Apple platforms, we follow [Apple's Xcode guidelines](https://developer.apple.com/support/xcode/) with the release of Xcode 15.
- iOS
    - The Minimum Deployment Target has been increased from iOS 10 to iOS 12.
    - The Target Deployment Version has been increased from iOS 16 to iOS 17.

- macOS
    - The Target Deployment Version has been increased from macOS 13.3 to macOS 14.
    - The Minimum Deployment Target was lowered from macOS 12.3 to macOS 10.13 in release v.1.8.8.

For Android platforms, we follow [Google's target API guidelines](https://developer.android.com/google/play/requirements/target-sdk).
- Android
    - The Minimum SDK Version has been increased from Android API 19 to Android API 21.
    - The Target SDK Version has been increased from Android API 28 to Android API 34.
    - The Compile SDK Version has been increased from Android API 28 to Android API 34.
    - Support for 32-bit Android platforms (arm7 and x86) ended on October 19, 2023. No new PlayFab Party library updates will be released for those platforms. The PlayFab Party networking and voice services will continue to operate with no impact to any titles currently using the PlayFab Party library on 32-bit Android platforms.

If you experience any issues with integrating these packages, [please file a PlayFab Support Ticket](../../pricing/support.md).

## 1.8.9

October 20, 2023

- Implemented shared properties for endpoints. Shared properties may be set when creating an endpoint via
[`PartyNetwork::CreateEndpoint`](reference/classes/PartyNetwork/methods/partynetwork_createendpoint.md). A shared
property may be retrieved using [`PartyEndpoint::GetSharedProperty`](reference/classes/PartyEndpoint/methods/partyendpoint_getsharedproperty.md).
- Improved audio packet queuing to reduce perceived chat audio latency in some scenarios.
- Upgraded internal version of the Opus codec.
- Fixed a low frequency crash.
- Improved internal diagnostics.
- Removed support for Windows 7.

This version of the NuGet package adds a dependency on PartyWin.dll at compile-time rather than dynamically loading a
platform-specific version of the DLL at runtime. PartyWin7.dll is no longer included in the NuGet and should no longer
be distributed as part of a title.

## 1.8.5

June 28, 2023

### Bug fixes

- Fixed a bug where [`PartyLocalChatControl::SetAudioRenderVolume`](reference/classes/PartyLocalChatControl/methods/partylocalchatcontrol_setaudiorendervolume.md) wouldn't properly work for Nintendo Switch, PlayStation&#174;4 and, PlayStation&#174;5.

“PlayStation” is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.8.3

June 2, 2023

- PlayFab Party version 1.8 released for Nintendo Switch with all bug fixes and new features since the last Nintendo Switch release (version 1.7.15).

## 1.8.2

May 30, 2023

### Bug fixes
- Fixed a bug where the PlayFab Party library would require the macOS version to be at least 13.1. The new release sets the minimum macOS version to 12.3. 

## 1.8.0

May 8, 2023

- Added an option for configuring the maximum number of direct peer connections the device attempts to establish to other devices. For more information, see [`PartyOption::LocalDeviceMaxDirectPeerConnections`](reference/enums/partyoption.md).
- iOS, Android: Added support for enabling noise suppression on audio captured from a local chat control. For more information, see [`PartyLocalChatControl::SetVoiceAudioOptions`](reference/classes/PartyLocalChatControl/methods/partylocalchatcontrol_setvoiceaudiooptions.md).

### Bug fixes
- Fixed a bug where the library could leak memory due to internal diagnostic tracking when the user's entity token expires.

## 1.7.23

April 1, 2023

- Added support for Real-Time Audio Manipulation on PlayStation&#174;5 platform.

## 1.7.22

March 30, 2023

### Bug fixes
- Fixed a bug where Party could crash if it wasn't cleaned up before the host process started exiting.
- Changed behavior for peer-to-peer connection to fall back to a relayed connection if the link is disconnected unexpectedly. The previous behavior would disconnect both the devices from the network.

## 1.7.20

February 8, 2023

### Bug fixes

- Fixed a bug where audio from 44.1-kHz microphones may sound distorted. 
- Improved diagnostic error messages for network errors reported by [PartyManager::GetErrorMessage()](reference/classes/PartyManager/methods/partymanager_geterrormessage.md).

## 1.7.19

November 11, 2022

### Bug fixes

- Fixed a bug that failed to open a Web request after a certain point in time on Linux. 

## 1.7.17

October 7, 2022

### Bug fixes

- Fixed a bug where a crash might occur when a chat control is connected to a network on iOS. 
- Fixed a bug where a crash might occur when enabling iOS log.

## 1.7.16

September 27, 2022

### New Bundle release for macOS

- Added .bundle for Unity plug-in loading and native macOS development.

### Bug fixes
- Fixed a bug where a crash might occur when enabling macOS log.

## 1.7.14

August 12, 2022

### New SDKs for Linux and macOS

- Added native support for PlayFab Party on Linux and macOS, enabling game developers to create cross-platform or multiplatform real-time multiplayer experiences on even more platforms. For links to these and other SDK releases, see [PlayFab Party SDKs](party-sdks.md).

August 11, 2022

- Introduces PlayFab Party for Linux

## 1.7.11
June 24, 2022
### Bug fixes

- Fixed an issue where a single memory allocation would still remain following a call to `PartyManager::Cleanup()`.

## 1.7.8
April 21, 2022
### Bug fixes

- Fixed an issue where memory wasn't fully cleaned up when `PartyManager::Cleanup()` was called.
- Fixed an issue where calling `PartyLocalChatControl::SetAudioInput()` or `PartyLocalChatControl::SetAudioOutput()` with the same audio device selection would unnecessarily result in the library reinitializing the audio device. 

## 1.7.7
March 16, 2022
### Bug fixes

- PlayStation&#174;4, PlayStation&#174;5: Fixed a crash that occurred when there was no audio device after the audio devices were removed.
- Switch: Fixed an issue that caused web requests to fail when multiple PlayFab transactions were triggered.

“PlayStation” is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## 1.7.6
February 8, 2022
### Performance improvements

- Windows, XDK, Nintendo Switch, PlayStation 4, PlayStation 5: Removed two worker threads and perform relevant work on a pre-existing, lower frequency work thread. The Microsoft Game Development Kit (GDK) version of the library already had this coalesced work behavior.

### Bug fixes

- iOS, Android, Switch, PlayStation 4, PlayStation 5, and Stadia: Fixed a small amount of memory allocated during initialization not being properly freed during cleanup.
- Avoid reporting PartyChatTextReceivedOptions::FilteredDueToError flag in PartyChatTextReceivedStateChange when text moderation isn't enabled.

## 1.7.5
September 30, 2021
### Bug fixes

- Fixed an issue where some 16 kHz microphones weren't working.
- Fixed an issue where microphone permission changes weren't handled on Windows.
- Fixed a memory leak in some `PartyManager::CreateNewNetwork()` failure conditions.
- Fixed an occasional crash in `PartyLocalEndpoint::GetEndpointStatistics()`.

## 1.7.0
June 29, 2021
### New profiling hooks and chat control indicators

- Developers interested in where time is spent in internal library functions can now configure optional method entrance and exit callbacks to hook into their preferred high-performance instrumentation method. For more information, see [`PartyManager::SetProfilingCallbacksForMethodEntryExit`](reference/classes/PartyManager/methods/partymanager_setprofilingcallbacksformethodentryexit.md). In this release, the callbacks are only supported for Windows, Xbox One XDK, and Microsoft Game Core platforms.
- New NoRemoteInput and RemoteAudioInputMuted chat control indicators provide more granularity on currently silent audio state. For more information, see [`PartyChatControlChatIndicator`](reference/enums/partychatcontrolchatindicator.md).

### Endpoint message behavior improvements

- The ['PartySendMessageQueuingConfiguration'](reference/structs/partysendmessagequeuingconfiguration.md) `timeoutInMilliseconds` field is now also evaluated by the transparent cloud relay if forced to queue messages before forwarding because of differing network conditions or responsiveness of the remote targets.
- When fully authenticated into a network, sending to a 0-entry array correctly targets the exact set of all remote endpoints the library currently reports in the network at that time. Endpoints being created while the message is in the process of transmitting are no longer potentially included.

## 1.6.1

### Bug fixes

- Fixed a bug where a crash might occur when a chat control connects to a network while that same chat control is disconnecting from another network.

## 1.6.0
April 12, 2021
### New thread control and text moderation features

- The library's work can now run manually on game-controlled threads. For more information, see [`PartyManager::SetWorkMode`](reference/classes/PartyManager/methods/partymanager_setworkmode.md).
- Offensive text chat can now optionally be filtered. For more information, see [Using text moderation](../../community/voice-communications/concepts-text-moderation.md).

### Explicit enum numbering in the header

- Enum values in the header now have explicit numbering.

## 1.5.13
March 26, 2021
### Bug fixes

- Fixed a bug where audio cuts out on iOS devices using Bluetooth headsets.
- Fixed a bug where an incorrect error code is generated when the app doesn't have permission to activate a microphone on Windows platforms.
- Fixed a bug where an unhealthy device isn't refreshed unless something else forces a refresh.
- Fixed a bug where a crash might occur when dereferencing a send channel's user data after the source endpoint associated with that channel becomes invalid.
- Fixed a bug where clients experience silent failures if a remote chat control doesn't have a language code.

## 1.5.10

### Bug fixes

- Fixed a bug where the library might fail to initialize on some Windows devices due to a mismatch between the processor affinity of the process and the library's default thread affinity.
- Fixed a bug where the library might not provide errors when an operation fails due to an internal web request failure.
- Fixed a bug where a crash might occur when direct peer connectivity is enabled and the library attempts to establish direct peer connectivity to another device.
- Fixed a bug that might result in crackling or distorted audio.

## 1.5.1
September 05, 2020

### Bug fix

- Fixed a bug where the library fails to activate the microphone on iOS.

## 1.5.0

### New direct peer-to-peer connectivity, latency, and speech-to-text features

- Direct peer-to-peer connectivity is now supported in the Windows 10 and Microsoft Game Core versions of the library. For more information, see [Using direct peer-to-peer connectivity](concepts-direct-peer-connectivity.md).
- The round trip latency between the local device and a remote device can now be queried through the library. For more information, see [`PartyEndpointStatistic::AverageDeviceRoundTripLatencyInMilliseconds`](reference/enums/partyendpointstatistic.md)
- Speech-to-text profanity masking can now be disabled. For more information, see [`PartyVoiceChatTranscriptionOptions::DisableProfanityMasking`](reference/enums/partyvoicechattranscriptionoptions.md).

### Android and iOS audio bug fixes

- Android: Bluetooth manager will be initialized the first time `PartyLocalDevice::CreateChatControl()` is called, rather than when `PartyManager::Initialize()` is called.
- iOS: Fixed a minor sound artifact when `PartyManager::Initialize()` is called.

## 1.4.13

### Windows 8.1 dependency issue

This release removes an unnecessary dependency on api-ms-win-core-version-l1-1-1.dll that prevented previous versions from working on Windows 8.1

## 1.4.8
April 30, 2020
### TLS1.2

- The transcription stack has been updated to use TLS1.2 on Windows 7, Android, and iOS. Upgrade if you make use of any of these platforms as TLS1.1 support will be deprecated by [Azure Speech Services](https://azure.microsoft.com/updates/azuretls12/) beginning in September 2020. All other platforms already support TLS1.2 and no upgrade is necessary.

### Bug fixes
- Fixed a bug where the `languageCode` field in the `PartyCreateChatControlCompletedStateChange` struct wasn't being populated.
- Fixed a bug that was artificially inflating the latency measurements reported by `PartyManager::GetRegions()`.
- Fixed a bug that allowed `PartyManager::SetMemoryCallbacks()` to be called at unsafe times.
- Fixed a bug where calling `PartyManager::DestroyLocalUser()` with a `PartyLocalUser` in a `PartyNetwork` would generate a `PartyLocalUserRemovedStateChange` with an incorrect value in the removedReason field, `PartyLocalUserRemovedReason::RemoveLocalUser`, instead of the correct value, `PartyLocalUserRemovedReason::DestroyLocalUser`.

### Misc changes
- The bandwidth used by chat data has been reduced.
- More descriptive error codes and error messages are now provided when sandbox issues are encountered on Xbox.
- `PartyManager::Initialize()` now fails if an empty PlayFab Title ID is provided.
- Passing invalid PlayFab Entity Tokens to `PartyManager::CreateLocalUser()` will now result in more descriptive error messages in the state change results for operations that rely on a valid token.
- Typos in the header documentation have been fixed.
- A more descriptive error code and error message are now provided when an invalid region is passed to `PartyManager::CreateNewNetwork()`.
- The documentation for the lifetimes of `PartyString` values has been clarified for the structures and interfaces in Party.h.
- The documentation for `PartyManager::Cleanup()` was clarified to explain it isn't a thread-safe call.
- A more descriptive error code and error message are provided when `PartyManager::ConnectToNetwork()` asynchronously fails with internet connectivity errors.

## 1.3.0

### Chat API changes

* The real-time audio manipulation functions, which can be used to modify outgoing or incoming voice chat audio, are implemented for Windows and Xbox. For more information, see [Using real-time audio manipulation to apply custom voice effects](../../community/voice-communications/concepts-realtime-audio-manipulation.md).
* The chat permission options have more options for optionally configuring text-to-speech and microphone audio permissions independently. For more information, see [`PartyChatPermissionOptions`](reference/enums/partychatpermissionoptions.md).
* This breaks compatibility with previous releases of the Xbox Live Helper library. This release is compatible with version 1.2.0 of the Xbox Live Helper library. For more information, see the [Xbox Live Helper Library release notes](party-xboxlive-relnotes.md).
* Each transcription state change now indicates whether it represents text-to-speech or microphone audio. For more information, see [`PartyVoiceChatTranscriptionReceivedStateChange`](reference/structs/partyvoicechattranscriptionreceivedstatechange.md).


## 1.2.2

### iOS changes

- Adds support for the volume control API.

## 1.2.0

### Android changes

- Adds support for the volume control API.
- Removes audio focus handling from the library. Host applications are now expected to implement their own focus handling logic.

## 1.0.2

- Fixed crash in background telemetry.

## 1.0.1

### Party API changes

#### PartyManager::SetMemoryCallbacks Changes

This release of Party adds fixes for `PartyManager::SetMemoryCallbacks()` and also restrictions about when this API is safe to call. Check the reference documentation of the API in Party.h for details.

#### Removal of PartyStateChangeResult::TitleCreateNetworkThrottled

The `PartyStateChangeResult` value `TitleCreateNetworkThrottled` has been removed from the API, since the Party library never generates it.

## 0.7.0-prerelease

### Windows packaging changes

This release of Party introduces a new NuGet package, [Microsoft.PlayFab.PlayFabParty.Cpp.Windows](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.Windows), which replaces and deprecates the NuGet packages specific to Windows 10 and Windows 7 (Microsoft.PlayFab.PlayFabParty.Cpp.Win10 and Microsoft.PlayFab.PlayFabParty.Cpp.Win7, respectively). The new unified Windows NuGet package contains two new DLLs, PartyWin.dll (supports Windows 8.1 and up) and PartyWin7.dll (only for use on Windows 7). With the new Windows unified NuGet package, the correct Party DLL is loaded based on runtime detection of the OS version, so both PartyWin.dll and PartyWin7.dll should be included in the game distribution package.

### Android changes

The Android flavor now uses a shared object for Party (libparty.so) instead of a static library (libparty.a).

This release also contains Android-specific bug fixes for audio device selection.

### iOS changes

The iOS flavor of Party now has the framework package included for dynamically loading libparty instead of the statically built libparty.a.

### API changes

#### UpdateEntityToken API

This release of Party makes a change related to the handling of PlayFab entity tokens. In the previous version, the game provided Party with a user's entity token in the `PartyManager::CreateLocalUser()` API. Thereafter, Party internally refreshed the entity token and kept it up to date.

In this version, the internal token refreshing behavior has been removed and replaced by a new API, `PartyLocalUser::UpdateEntityToken()`. The caller is now responsible for monitoring the expiration of the entity token provided to `PartyManager::CreateLocalUser()` and `PartyLocalUser::UpdateEntityToken()`. When the token is nearing or past the expiration time, a new token should be obtained by performing a PlayFab login operation and provided to the Party library by calling `PartyLocalUser::UpdateEntityToken()`. It's recommended to acquire a new token when the previously supplied token is halfway through its validity period. On platforms that enter a low power state or pause application execution for a long time, the token might be prevented from being refreshed before it expires. The token should be checked for expiration once execution resumes.

The rough flow is as follows:

1. The game calls a `LoginWith*` PlayFab API
1. The response from PlayFab contains the entity token and also the expiration time
1. Provide the token information to Party with the `PartyManager::CreateLocalUser()` API, as before
1. [New] Make note of the expiration time in order to know when to refresh it
1. [New] At halfway through the token's expiration time (or soonest opportunity after that time), acquire a fresh token by calling `LoginWith*` again and track the new token's expiration time
1. [New] Call `PartyLocalUser::UpdateEntityToken()` to pass in the new token to Party

Additional notes:
- The act of acquiring an entity token doesn't invalidate any previously obtained entity tokens. They remain valid until they expire.
- The internal refreshing functionality was removed because most games are expected to make their own PlayFab calls. Having both the game and the Party library fetch entity tokens causes unnecessary service load to manage two sets of tokens.

#### Chat API Changes

The `PartyVoiceChatTranscriptionReceivedStateChange` now includes a `languageCode` field, which indicates the language of the transcription.

The `PartyChatTextReceivedStateChange` now includes a `languageCode` field, which indicates the language of the chat text. The `languageCode` field will be populated when chat text translation has been enabled via `PartyLocalChatControl::SetTextChatOptions()`.

## 0.6.0-prerelease

Added support for iOS, Android, and Nintendo Switch platforms.

For more information, see the following links:

[iOS/Android](https://github.com/PlayFab/PlayFabParty/releases)

<!--[Nintendo Switch](https://github.com/PlayFab/PlayFabPartySwitch/releases)-->


## 0.5.0-prerelease

### API changes

#### Accessible Chat
* Added support for text-to-speech narration. (see `PartyLocalChatControl::SetTextToSpeechProfile()`)
* Added more options for controlling when speech-to-text occurs. (see `PartyLocalChatControl::SetTranscriptionOptions()`)
* Added text-to-text translation to the API, although it isn't yet supported. (see `PartyLocalChatControl::SetTextChatOptions()`)
* Reduced text-to-speech bandwidth and memory usage.

#### Network access control
* `PartyNetwork::SetAccessControlList()` and related methods have been removed from the API. Use the new `PartyInvitation` class and related methods to create open invitations or grant access to specific PlayFab users to your Party networks.


## 0.4.6-prerelease

### API changes

Added new public API `PartyLocalUser::UpdateEntityToken()`.


## 0.2.0-prerelease

### API changes

* `PartyManager::Initialize` now requires a valid PlayFab Title ID to be passed in.
