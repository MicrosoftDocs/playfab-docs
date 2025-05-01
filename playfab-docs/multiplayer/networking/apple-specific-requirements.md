---
title: iOS and macOS getting started
author: debhaldarMS
description: iOS and macOS supplement for PlayFab Party quickstart
ms.author: debh
ms.date: 08/05/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, party, networking, communication
ms.localizationpriority: medium
---

# iOS and macOS getting started

This document lists the basic prerequisites and requirements necessary to integrate PlayFab Party into your iOS or macOS applications. After completing the platform specific steps, see the [Quickstart for PlayFab Party](quickstart.md) to finish getting started with PlayFab Party.

## Prerequisites
Before you start this tutorial, ensure that the following prerequisites have been met:

1. You've created a [PlayFab developer account](https://developer.playfab.com/en-us/sign-up)
2. You've created a PlayFab Title and your title has been allow-listed for PlayFab Party
3. You have Xcode version 10.2.1 or higher installed
4. You have access to the [PlayFab Party platforms repository](https://github.com/PlayFab/PlayFabParty)
5. You've created an apple developer account that can be used to sign your app for deployment.

NOTE: If you're planning to use the XCode simulator for testing, you'll need to target your application for 64-bit ($(ARCHS_STANDARD_64_BIT)) architecture. 32-bit simulators are currently not supported.

## Including the required libraries and header files

### Headers

* You'll need to include the following header files from the [PlayFab Party distribution repository] (https://github.com/PlayFab/PlayFabParty/releases).

### Frameworks

* You'll need to link your application against the following frameworks that are also found inside the PlayFab Party distribution packages.
    * iOS: PlayFabParty
    * macOS: PlayFabPartyMac

> [!NOTE]
> The SSL libs are built from [Open SSL version XXX](https://github.com/openssl/openssl/tree/OpenSSL_1_1_1-stable). Use an OpenSSL version that is XXX or higher

Header includes

[Party headers](https://github.com/PlayFab/PlayFabParty/tree/master/include)

In addition to the lib files and headers above, you'll also need the libs and headers for PlayFab SDK and any other platform-specific dependencies your app needs. Take a look at the project file organization for the iOS Sample for more info.

## Steps to get PlayFab Party working on iOS or macOS

Since the core Party library is written using C++, it's directly accessible from objective C++ code. For convenience, we've made a simple Objective-C++ wrapper class to access the Party lib functionality. At a high level, you'll want a class that has access to Party API methods to create a network, connect to a network, and send messages across a network. The [SimpleClientClass](https://github.com/PlayFab/PlayFabParty/blob/docs/iOS/PartySample/app/inc/SimpleClient.h) is shown as an example in our iOS demo app.


```obj-c
//
//  SimpleClient.h
//  chatdemo_ios

#import <Foundation/Foundation.h>
#import "ChatEventHandler.h"

@interface SimpleClient : NSObject

@property (nonatomic) id<ChatEventHandler> chatEventHandler;

-(void) initialize;
-(void) setHandler:(id<ChatEventHandler>) messageHandler;
-(void) signInLocalUser;

-(void) createNetwork:(NSString*) networkId;
-(void) joinNetwork:(NSString*) networkId;
-(void) leaveNetwork;

-(void) sendTextAsVoice:(NSString*) text;
-(void) sendTextMessage:(NSString*) text;
-(void) setLanguageCode:(int) languageIndex;
-(NSArray *) getLanguageOptions;
-(int) getDefaultLanguageIndex;

-(NSString*) getSelectedUserName;

-(void) tick;

+(void) globalInitialize;
+(void) globalShutdown;

@end

```

The above object bridge is backed by a pure C++ implementation file that calls into the [NetworkManager.cpp](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp) , which in turn calls the Party APIs.


Here's an example snippet that shows the various layers:

The SimpleClient Objective-C interface exposes a method to initialize PlayFab Party.

```obj-c
// In SimpleClient.h
-(void) createNetwork:(NSString*) networkId;
```

The implementation of the SimpleClient also includes a reference to the C++ object that calls into Party APIs via the network manager.

```obj-c
// In SimpleClient.mm

@interface SimpleClient ()

@end

@implementation SimpleClient

SimpleClientImpl* m_impl;
```

The SimpleClientImpl is a C++ class that class that does the heavy lifting of creating the Party network as shown in the code snippet below:

```cpp
void
SimpleClientImpl::CreateNetwork(
    std::string &networkId
    )
{
    if (g_isRunning && g_initializeCompleted)
    {
        Managers::Get<NetworkManager>()->Initialize(c_pfTitleId);
        m_messageHandler->OnStartLoading();
        Managers::Get<NetworkManager>()->CreateAndConnectToNetwork(
            networkId.c_str(),
            [this, networkId](std::string message)
            {
                this->SendSysLogToUI("create network: %s", message.c_str());
                Managers::Get<PlayFabManager>()->SetDescriptor(
                    networkId,
                    message, 
                    [this, message](void)
                    {
                        m_messageHandler->OnEndLoading();
                        this->SendSysLogToUI("set network descriptor %s", "successed");
                        std::string l_message = message;
                        m_messageHandler->OnNetworkCreated(l_message);
                    });
            },
            [this](PartyError error)
            {
                m_messageHandler->OnEndLoading();
                this->SendSysLogToUI("create network failed: %s", GetErrorMessage(error));
            });
    }
}
```

In the code snippet above, the SimpleClient calls into NetworkManager::CreateAndConnectToNetwork() which in turn calls the raw Party API exposed in [Party.h](https://github.com/PlayFab/PlayFabParty/blob/docs/include/Party.h)

```cpp
void 
NetworkManager::CreateAndConnectToNetwork(
    const char *networkId, 
    std::function<void(std::string)> callback, 
    std::function<void(PartyError)> errorCallback
    )
{
    DEBUGLOG("NetworkManager::CreateAndConnectToNetwork()\n");

    // Set the maximum number of devices allowed in a network to 16 devices
    constexpr uint8_t c_maxSampleNetworkDeviceCount = 16;
    static_assert(c_maxSampleNetworkDeviceCount <= c_maxNetworkConfigurationMaxDeviceCount, "Must be less than or equal to c_maxNetworkConfigurationMaxDeviceCount.");

    // Initialize network configuration for Party Network.
    PartyNetworkConfiguration cfg = {};
    cfg.maxDeviceCount = c_maxSampleNetworkDeviceCount;
    cfg.maxDevicesPerUserCount = 1;
    cfg.maxEndpointsPerDeviceCount = 1;
    cfg.maxUserCount = c_maxSampleNetworkDeviceCount;
    cfg.maxUsersPerDeviceCount = 1;

    //Get the uid from the local chat control
    PartyString uid = nullptr;
    PartyError err = m_localUser->GetEntityId(&uid);

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("GetUserIdentifier failed: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return;
    }

    // Setup the network invitation configuration to use the network id as an invitation id and allow anyone to join.
    PartyInvitationConfiguration invitationConfiguration{
        networkId,                                  // invitation identifier
        PartyInvitationRevocability::Anyone,        // revokability
        0,                                          // authorized user count
        nullptr                                     // authorized user list
    };

    // Initialize an empty network descriptor to hold the result of the following call.
    PartyNetworkDescriptor networkDescriptor = {};

    // Create a new network descriptor
    err = PartyManager::GetSingleton().CreateNewNetwork(
        m_localUser,                                // Local User
        &cfg,                                       // Network Config
        0,                                          // Region List Count
        nullptr,                                    // Region List
        &invitationConfiguration,                   // Invitation configuration
        nullptr,                                    // Async Identifier
        &networkDescriptor,                         // OUT network descriptor
        nullptr                                     // applied initialinvitationidentifier.
    );

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("CreateNewNetwork failed: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return;
    }

    // Connect to the new network
    if (InternalConnectToNetwork(networkDescriptor, networkId, errorCallback))
    {
        m_state = NetworkManagerState::WaitingForNetwork;
        m_onnetworkcreated = callback;
        m_onnetworkcreatederror = errorCallback;
        m_onnetworkconnectedError = errorCallback;
    }
}
```

In a similar way, each method in the SimpleClient Objective-C interface is mapped to Party API via the `SimpleClientImpl` and `NetworkManager`.

## Remarks
If PlayFab Party is intended to be used for voice chat, the application needs to be granted microphone access. To do this, ensure that the following property is added to the Info.plist file of the application.
```
<key>NSMicrophoneUsageDescription</key>
<string>The application requires access to the microphone for voice chat.</string>
```

## Next steps

After completing the platform specific steps to integrate the Party library into your iOS or macOS application, refer to [Quickstart for PlayFab Party](quickstart.md) to finish getting started with PlayFab Party.
