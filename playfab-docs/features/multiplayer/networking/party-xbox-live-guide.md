---
title: Xbox Live helper library for PlayFab Party
description: Xbox Live helper library for PlayFab Party
author: AlexAtXbox
ms.author: alstonge
ms.date: 9/11/2019
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, networking, xbox live
---

# Xbox Live Helper library overview

> [!IMPORTANT]
> This feature is currently in **Private Preview**.
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>

The Xbox Live Helper library for PlayFab Party is designed to help games using PlayFab Party meet [Xbox Live policies](https://docs.microsoft.com/gaming/xbox-live/xboxlive-policies) related to communication (XR-015 and XR-045).

## User creation and interaction with PlayFab Party

The Xbox Live Helper library can be used to retrieve the right `PartyChatPermissionOptions` for each of your players to ensure that each player's preferences and privileges related to online communications are respected. To do so, you will first need to create `PartyXblLocalChatUser` and `PartyXblChatUser` for each Xbox Live user actively participating in the gaming session.

While the [PlayFab CPP SDK](https://docs.microsoft.com/gaming/playfab/sdks/playfab-cpp/) can be used to obtain the `entityId` and `titlePlayerEntityToken` needed by `PartyManager::CreateLocalUser()`, the Xbox Live Helper library also provides `PartyXblManager::LoginToPlayFab()` for titles that wish to avoid taking on the extra dependency.

The following sample shows how the Xbox Live Helper library can help you create `PartyLocalUser` and `PartyLocalChatControl` objects, assuming that you have the Xbox Live User Id of all your local players.

```cpp
    PartyXblLocalChatUser* localChatUser;
    PartyError err = PartyXblManager::GetSingleton().CreateLocalChatUser(
        localXboxUserId,
        nullptr,
        &localChatUser);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("CreateLocalChatUser failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }

    err = PartyXblManager::GetSingleton().LoginToPlayFab(localChatUser, nullptr);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("LoginToPlayFab failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }
```

Shortly after calling `PartyXblManager::LoginToPlayFab()` you will receive a `PartyXblLoginToPlayFabCompletedStateChange` containing the result of the login operation.

```cpp
    PartyLocalUser* partyLocalUser;
    if (stateChange->stateChangeType == PartyXblStateChangeType::LoginToPlayFabCompleted)
    {
        auto loginToPlayFabCompleted = static_cast<PartyXblLoginToPlayFabCompletedStateChange*>(stateChange);
        if (loginToPlayFabCompleted->result == PartyXblStateChangeResult::Succeeded)
        {
            err = PartyManager::GetSingleton().CreateLocalUser(
                loginToPlayFabCompleted->entityId,
                loginToPlayFabCompleted->titlePlayerEntityToken,
                partyLocalUser));
            if (PARTY_FAILED(err))
            {
                DEBUGLOG("CreateLocalUser failed: %s\n", PartyManager::GetErrorMessage(err));
                return;
            }
        }
    }

    PartyLocalDevice* localDevice;
    err = PartyManager::GetSingleton().GetLocalDevice(&localDevice);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("GetLocalDevice failed: %s\n", PartyManager::GetErrorMessage(err));
        return;
    }

    PartyLocalChatControl* localChatControl;
    err = localDevice->CreateChatControl(partyLocalUser, nullptr, nullptr, &localChatControl);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("CreateChatControl failed: %s\n", PartyManager::GetErrorMessage(err));
        return;
    }

    // We can use the custom context on the PartyXblLocalChatUser to store the PartyLocalChatControl for easy access
    // in the future.
    localChatUser->SetCustomContext(localChatControl);
```

The `PartyXblLocalChatUser` object also exposes some of the accessibility preferences of the Xbox Live user. Titles can use this information to provide a better experience to its player by enabling some of Party's accessibility features right away.

```cpp
    PartyXblAccessibilitySettings accessibilitySettings;
    err = localChatUser->GetAccessibilitySettings(&accessibilitySettings);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("GetAccessibilitySettings failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }

    if (accessibilitySettings.speechToTextEnabled)
    {
        PartyVoiceChatTranscriptionOptions option = PartyVoiceChatTranscriptionOptions::TranscribeOtherChatControlsWithMatchingLanguages;
        m_localChatControl->SetTranscriptionOptions(option, nullptr);
    }
```

## Respecting an Xbox Live user's privacy settings and permissions

Per Xbox Live policies, titles must not allow communication over Xbox Live when the user's privacy or permissions do not allow it. The Xbox Live Helper library will help you achieve that by allowing you to query the most restrictive `PartyChatPermissionOptions` between two users allowed by Xbox Live policies. Anytime this value changes, a `PartyXblRequiredChatPermissionInfoChangedStateChange` will be generated by the library. The updated `PartyChatPermissionOptions` can be obtained by a call to `PartyXblLocalChatUser::GetRequiredChatPermissionInfo()`.

To start getting these updates, the library needs to track which remote Xbox Live users are currently participating in the gaming session. A common way to achieve this would be by adding every users in your [multiplayer session document](https://docs.microsoft.com/gaming/xbox-live/multiplayer/multiplayer-appendix/xbox-one-multiplayer-session-directory).

```cpp
    PartyXblChatUser* remoteChatUser;
    PartyError err = PartyXblManager::CreateRemoteChatUser(remoteXboxUserId, &remoteChatUser);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("CreateRemoteChatUser failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }

    // Once the chat control representing this remote Xbox Live user joins a network, we can use the custom context
    // on the PartyXblChatUser to store the chat control object for quick access in the future.
    remoteChatUser->SetCustomContext(m_remotePartyChatControl);
```

Creating a remote chat user will cause the library to send a web request to the Xbox Live privacy services and a `PartyXblRequiredChatPermissionInfoChangedStateChange` will notify you that an updated `PartyChatPermissionOptions` value is now available. The library will also subscribe to the (Real-Time Activity)[https://docs.microsoft.com/gaming/xbox-live/real-time-activity-service/real-time-activity-service_nav] service and will notify you of any updates through additional state changes.

```cpp
    // Wait for PartyXblRequiredChatPermissionInfoChangedStateChange
    if (stateChange->stateChangeType == PartyXblStateChangeType::RequiredChatPermissionInfoChanged)
    {
        auto chatPermissionChanged = static_cast<PartyXblRequiredChatPermissionInfoChangedStateChange*>(stateChange);

        PartyXblLocalChatUser* localChatUser = chatPermissionChanged->localChatUser;
        PartyXblChatUser* targetChatUser = chatPermissionChanged->targetChatUser;

        PartyXblChatPermissionInfo chatPermissionInfo;
        PartyError err = localChatUser->GetRequiredChatPermissionInfo(targetChatUser, &chatPermissionInfo);
        if (PARTY_FAILED(err))
        {
            DEBUGLOG("GetRequiredChatPermissionInfo failed: %s\n", PartyXblManager::GetErrorMessage(err));
            return;
        }

        PartyLocalChatControl* localChatControl;
        localChatUser->GetCustomContext(reinterpret_cast<void**>(&localChatControl));
        if (PARTY_FAILED(err))
        {
            DEBUGLOG("GetCustomContext failed: %s\n", PartyXblManager::GetErrorMessage(err));
            return;
        }

        PartyChatControl* targetChatControl;
        targetChatUser->GetCustomContext(reinterpret_cast<void**>(&targetChatControl));
        if (PARTY_FAILED(err))
        {
            DEBUGLOG("GetCustomContext failed: %s\n", PartyXblManager::GetErrorMessage(err));
            return;
        }

        localChatControl->SetPermission(targetChatControl, chatPermissionInfo.chatPermissionMask);
        if (PARTY_FAILED(err))
        {
            DEBUGLOG("SetPermission failed: %s\n", PartyXblManager::GetErrorMessage(err));
            return;
        }
    }

```

The `PartyXblChatPermissionInfo` structure contains two pieces of information:

- A `PartyChatPermissionOptions` mask that can be either passed as-is to `PartyLocalChatControl::SetPermission()` or that can be used as a binary mask if you already have a `PartyChatPermissionOptions` value that you would like to use but want to make sure that you are respecting Xbox Live policies.
- A `PartyXblChatPermissionMaskReason` value that provides extra information regarding the value of `PartyXblChatPermissionInfo::chatPermissionMask`

| **PartyXblChatPermissionMaskReason** | **Explanation** |
|:-----------|:----------------|
| NoRestriction        | There is no restriction currently applying to this chat permission.
| Determining          | Communication is restricted while the local user's communication privilege and privacy settings are being determined
| Privilege            | Communication is restricted due to the local user's communication privilege.
| Privacy              | Communication is restricted due to the local user's privacy settings in relation to the target chat user.
| InvalidTargetUser    | Communication is restricted because the target user was not recognized as valid by Xbox Live services.
| XboxLiveServiceError | The required chat permission could not be successfully determined due to issues with Xbox Live services.
| UnknownError         | The required chat permission could not be successfully determined due to an unknown internal error.

## Respecting cross network communication permissions

Titles that support cross-network play and communication between Xbox Live and non-Xbox Live players need to check communication permissions prior to allowing communication between those players. The Xbox Live Helper library provides this information through `PartyXblLocalChatUser::GetCrossNetworkCommunicationPrivacySetting()`. This method returns a `PartyXblCrossNetworkCommunicationPrivacySetting` enum with three possible value:

| **PartyXblCrossNetworkCommunicationPrivacySetting** | **Explanation** |
|:-----------|:----------------|
| Allowed    | This Xbox Live user's permissions are set to allow communication with all cross network players.
| FriendsOnly| This Xbox Live user's permissions are set to allow communication with cross network friend only.
| Disallowed | This Xbox Live user's permissions do not allow any communication with cross network players.

```cpp
    PartyXblCrossNetworkCommunicationPrivacySetting crossNetworkSetting;
    localChatUser->GetCrossNetworkCommunicationPrivacySetting(&crossNetworkSetting);

    if (crossNetworkSetting == PartyXblCrossNetworkCommunicationPrivacySetting::Disallowed)
    {
        m_localChatControl->SetPermissions(crossNetworkChatControl, PartyChatPermissionOptions::None);
    }
```

More information on XR-015 and how it pertains to cross network play and communication can be found [here](https://docs.microsoft.com/gaming/xbox-live/policies/xr015)

## Special consideration for Windows 10 and Windows 7

On Windows, the Xbox Live Helper library needs helps from the title to obtain Xbox Live tokens. The library will request tokens by generating `PartyXblTokenAndSignatureRequestedStateChange`. The title can use the [Xbox Authentication Library](https://docs.microsoft.com/gaming/xbox-live/using-xbox-live/auth/xal-overview) (XAL) to fulfill these requests. Offloading this work to the title ensures that it remains in full control of any UI handling and consent prompt that is normally associated with user authentication.

```cpp
    if (stateChange->stateChangeType == PartyXblStateChangeType::TokenAndSignatureRequested)
    {
        auto tokenAndSignatureRequested = static_cast<PartyXblTokenAndSignatureRequestedStateChange*>(stateChange);

        // Convert the headers to the format XAL expect
        std::vector<XalHttpHeader> xalHeaders;
        for (uint32_t i = 0; i < stateChange.headerCount; ++i)
        {
            xalHeaders.push_back({stateChange.headers[i].name, stateChange.headers[i].value});
        }

        XalUserGetTokenAndSignatureArgs args = {};
        args.method = stateChange.method;
        args.url = stateChange.url;
        args.headerCount = static_cast<uint32_t>(xalHeaders.size());
        args.headers = xalHeaders.data();
        args.bodySize = stateChange.bodySize;
        args.body = static_cast<const uint8_t*>(stateChange.body);
        args.forceRefresh = stateChange.forceRefresh != 0;
        args.allUsers = stateChange.allUsers != 0;

        XAsyncBlock* asyncBlock = new XAsyncBlock;
        asyncBlock->queue = m_queue;
        HRESULT hr = XalUserGetTokenAndSignatureSilentlyAsync(m_userHandle, &args, asyncBlock);
    }
```

For more guidance on how to retrieve token and signature using XAL, see the [Xbox Authentication Library documentation.](https://docs.microsoft.com/gaming/xbox-live/using-xbox-live/auth/xal-partner-token)

Once you have the token and signature, they can be provided to the Xbox Live Helper library by calling `PartyXblManager::CompleteGetTokenAndSignatureRequest()` with the same `correlationId` that was provided to the title through the state change.
