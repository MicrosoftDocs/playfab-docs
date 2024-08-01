---
title: Android getting started
author: debhaldarMS
description: Android supplement for PlayFab Party quickstart
ms.author: debh
ms.date: 08/05/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, party, networking, communication, prerequisites, Android
ms.localizationpriority: medium
---

# Android getting started

This document lists the basic prerequisites and requirements necessary to integrate PlayFab Party into your Android applications. Once you've set up your system according to this document, please have a look at the [Quickstart for PlayFab Party](quickstart.md) for getting set up with the building blocks of PlayFab Party.

## Prerequisites

Before you start this tutorial, please ensure that the following prerequisites have been met:

1. You created a [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).

1. You created a PlayFab Title and your title has been allow-listed for PlayFab Party.

1. You have Android Studio version 3.2 or higher installed.

1. Your app targets Android 4.4 (Kitkat) or higher.

1. You have the Android NDK 18.1.5063045 or higher installed.


1. You have access to the [PlayFab Party platforms repository](https://github.com/PlayFab/PlayFabParty/releases)


7. You have created an android signing cert and signed your app for deployment using the cert config.

## Including the required libraries and header files

You'll need to include the following header files from the [PlayFab Party distribution repository](https://github.com/PlayFab/PlayFabParty).


LIB Files

1. libParty.a
2. libcrypto.a
3. libssl.a

> [!NOTE]
> The SSL libraries are built from [Open SSL Version 1.1.1b-dev](https://github.com/openssl/openssl/tree/OpenSSL_1_1_1-stable). Please use an openSSL version that is 1.1.1b-dev or higher.

Header Includes

[Party Headers](https://github.com/PlayFab/PlayFabParty/tree/master/include)


> [!NOTE]
> In addition to the lib files and headers above, you'll also need the libs and headers for PlayFab SDK and any other platform-specific dependencies your app needs. Please take a look at the project file organization for the Android sample for more info.

## Steps to get PlayFab Party working on Android

Since the core Party library is written using C++, we'll need to make a simple JNI wrapper class to access the Party lib functionality. At a high level, you'll want a class that has access to Party API methods to create a network, connect to a network, and send messages across a network. We've achieved this in our demo app via the [NetworkManager Java class](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySample/demo/src/main/java/com/microsoft/playfab/party/sdk/NetworkManager.java).

```java

import android.util.Log;

public class NetworkManager {
    static {
        System.loadLibrary("partysample");
    }

    private MessageManager messageManager;

    private static NetworkManager networkManager;

    private NetworkManager() {
    }

    public static NetworkManager getInstance() {
        if (networkManager == null) {
            networkManager = new NetworkManager();
        }
        return networkManager;
    }

    public native boolean initialize(String name);

    public native boolean createAndConnectToNetwork(String type, String languageCode);

    public native boolean joinNetwork(String networkId);

    public native void leaveNetwork();

    public native void sendTextMessage(String message, boolean isTTS);

    public native void doWork();

    public native void getPlayerState();

    public native void setLanguage(int idx);

    public native void setPlayFabTitleID(String titleID);

    public void onNetworkCreated(String network) {
        Log.d(getClass().getSimpleName(), "onNetworkCreated: " + network);
        getMessageManager().sendNetworkCreatedMessage(network);
        getMessageManager().sendErrorMessage("Connected to network: " + network);
    }

    public void onMessageReceived(String sender, String message) {
        Log.d(getClass().getSimpleName(), "onMessageReceived: " + sender + ": " + message);
        getMessageManager().sendTextMsgReceivedMessage(sender, message, false);
    }

    public void onTranscriptMessageReceived(String sender, String message) {
        Log.d(getClass().getSimpleName(), "onTranscriptMessageReceived: " + sender + ": " + message);
        getMessageManager().sendTextMsgReceivedMessage(sender, message, true);
    }

    public void onPlayerJoined(String playerId, String name) {
        Log.d(getClass().getSimpleName(), "onPlayerJoined: " + playerId + ": " + name);
        getMessageManager().sendPlayerJoinMessage(playerId, name);
    }

    public void onPlayerLeft(String playerId) {
        Log.d(getClass().getSimpleName(), "onPlayerLeft: " + playerId);
        getMessageManager().sendPlayerLeftMessage(playerId);
    }

    public void toastMessage(String message) {
        getMessageManager().toastMessage(message);
    }

    public void resetChat(String error) {
        getMessageManager().sendResetMessage(error);
    }
    public void resetMessage() {
        getMessageManager().sendResetMessage("Left");
    }

    public void addErrorMessage(String message) {
        getMessageManager().sendErrorMessage(message);
    }

   public void updatePlayerState(String playerId, String state) {
        Log.d(getClass().getSimpleName(), "updatePlayerState: " + playerId + ": " + state);
        getMessageManager().sendPlayerStatusMessage(playerId, state);
    }

    public MessageManager getMessageManager() {
        return MessageManager.getInstance();
    }

}
```
The above JNI bridge is backed by a pure C++ implementation file that calls into the [NetworkManager.cpp](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp), which in turn calls the Party APIs.


Here's an example snippet that shows the various layers:

The NetworkManager Java interface exposes a method to join a Party Network.

```java
public native boolean joinNetwork(String networkId);
```

The implementation of the `joinNetwork` is in the C++ layer in [PartyDemo.cpp](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySample/demo/src/main/cpp/PartyDemo.cpp) shown below.


```cpp
JNIEXPORT jboolean JNICALL
    Java_com_microsoft_playfab_party_sdk_NetworkManager_joinNetwork(
        JNIEnv* env,
        jobject thiz,
        jstring networkId
        )
    {
        if (g_isRunning && g_initializeCompleted)
        {
            Managers::Get<NetworkManager>()->Initialize(g_playfabTitleId.c_str());
            const char* networkNameCStr = env->GetStringUTFChars(networkId, NULL);
            g_networkName = networkNameCStr;
            env->ReleaseStringUTFChars(networkId, networkNameCStr);
            g_isSpinDone = false;
            Managers::Get<PlayFabManager>()->GetDescriptor(
                    g_networkName,
                    [](std::string networkDescriptor)
                    {
                        SendSysLogToUI("OnGetDescriptorForConnectTo : %s", networkDescriptor.c_str());
                        g_networkDescriptor = networkDescriptor;
                        ReleaseSpin();
                    }
            );

            HoldSpin();
            // When network connection is not stable, waiting for ConnectToNetwork callback will cost longer time.
            // To avoid App UI busy waiting, return to UI after ConnectToNetwork returns.
            Managers::Get<NetworkManager>()->ConnectToNetwork(
                g_networkName.c_str(),
                g_networkDescriptor.c_str(),
                []()
                {
                    OnNetworkConnected(g_networkName);
                    SendSysLogToUI("OnConnectToNetwork succeeded");
                },
                [](PartyError error)
                {
                    SendSysLogToUI("OnConnectToNetworkFailed %s", GetErrorMessage(error));
                    ResetChat(GetErrorMessage(error));
                });

            return true;
        }
        else
        {
            SendSysLogToUI("Please waiting for initialization done.");
            return false;
        }
    }
```
In the code snippet above, the `joinNetwork` calls into `NetworkManager::CreateAndConnectToNetwork()` which in turn calls the raw Party API exposed in [Party.h](https://github.com/PlayFab/PlayFabParty/blob/docs/include/Party.h)

```cpp
void 
NetworkManager::CreateAndConnectToNetwork(
    const char *networkId, 
    std::function<void(std::string)> callback, 
    std::function<void(PartyError)> errorCallback
    )
{
    DEBUGLOG("NetworkManager::CreateAndConnectToNetwork()\n");

    PartyNetworkConfiguration cfg = {};

    // Setup the network to allow the maximum number of single-device players of any device type
    cfg.maxDeviceCount = c_maxNetworkConfigurationMaxDeviceCount;
    cfg.maxDevicesPerUserCount = 1;
    cfg.maxEndpointsPerDeviceCount = 1;
    cfg.maxUserCount = c_maxNetworkConfigurationMaxDeviceCount;
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

In a similar way, each method in the NetworkManager JNI interface is mapped to Party API via the PartyDemo and NetworkManager.

## Next steps

In this article we saw how to get started integrating the Party library into your Android application. Please refer to [Quickstart For PlayFab Party](quickstart.md) for getting set up with the rest of the building blocks of PlayFab Party.
