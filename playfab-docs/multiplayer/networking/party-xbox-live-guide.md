---
title: Xbox Live helper library for PlayFab Party
description: Xbox Live helper library for PlayFab Party
author: ScottMunroMS
ms.author: scmunro
ms.date: 07/14/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, xbox live
---

# Xbox Live Helper library overview
The Xbox Live Helper library for PlayFab Party is designed to help games using PlayFab Party meet [Xbox Live policies](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview) related to communication (XR-015 and XR-045). The Xbox Live Helper library is available on [Nuget.org](https://www.nuget.org/profiles/PlayFab).

## Compatibility with the PlayFab Party library

While we strive to minimize breaking changes in our APIs, some changes made to the PlayFab Party API might cause the Xbox Live Helper library to return erroneous values. Refer to the below table to ensure that your libraries' version are compatible.

| Xbox Live Helper Library <br> version | PlayFab Party Version <br> 1.0.1 | PlayFab Party Version <br> 1.3.0+ |
|---------------------------------------|:--------------------------------:|:--------------------------------:|
| **1.0.1**                             | ✔                               |                                  |
| **1.1.0**                             | ✔                               |                                  |
| **1.2.0**                             |                                 | ✔                                |
| **1.2.5**                             |                                 | ✔                                |

## Keeping Track of Xbox Live Users

The PlayFab Party Xbox Live Helper library must be explicitly informed of the Xbox Live users currently participating in the Party session. It is recommended that titles inform the library by listening for changes to their [multiplayer session document](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview) and reflecting that roster in the Xbox Live Helper library via `PartyXblManager::CreateLocalChatUser` and `PartyXblManager::CreateRemoteChatUser`.

For local users:
```cpp
void
OnLocalXboxUserAddedToMPSD(
    uint64_t xboxUserId
    )
{
    PartyXblLocalChatUser* localChatUser;
    PartyError err = PartyXblManager::GetSingleton().CreateLocalChatUser(xboxUserId, nullptr, &localChatUser);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("CreateLocalChatUser failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }
}
```

At this point, if a PartyLocalChatControl already exists for the corresponding local Xbox user, you can associate it with this PartyXblLocalChatUser via the SetCustomContext methods.

```cpp
    localChatControl->SetCustomContext(localChatUser);
    localChatUser->SetCustomContext(localChatControl);
```

Otherwise you can use this new PartyXblLocalChatUser to generate the chat control and associate them then. See [Creating PartyLocalChatControls from PartyXblLocalChatUsers](#creating-partylocalchatcontrols-from-partyxbllocalchatusers) for more information.

For remote users:
```cpp
void
OnRemoteXboxUserAddedToMPSD(
    uint64_t xboxUserId
    )
{
    PartyXblChatUser* remoteChatUser;
    PartyError err = PartyXblManager::GetSingleton().CreateRemoteChatUser(remoteXboxUserId, &remoteChatUser);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("CreateRemoteChatUser failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }
```

At this point, if a PartyChatControl already exists for the corresponding remote Xbox user, you can associate it with this PartyXblChatUser via the SetCustomContext methods.

```cpp
    remoteChatControl->SetCustomContext(remoteChatUser);
    remoteChatUser->SetCustomContext(remoteChatControl);
```

Bear in mind that updates to the session document and updates to the list of remote chat controls may not be ordered, and you may require similar association logic when processing `PartyChatControlCreatedStateChange` updates for remote chat controls.

For both local and remote chat users it's important to keep in mind that the core Party library identifies users and chat controls via PlayFab Entity IDs where as the Xbox Live helper library identifies chat users with Xbox User IDs. Therefore translating between the two is often necessary. Refer to [Mapping between Xbox Live User IDs and PlayFab Entity IDs](#mapping-between-xbox-live-user-ids-and-playfab-entity-ids) for more information.

## Creating PartyLocalChatControls from PartyXblLocalChatUsers

`PartyXblLocalChatUser` objects are often only useful when associated with `PartyLocalUser` and `PartyLocalChatControl` objects in the Party library. Generating `PartyLocalUser` and `PartyLocalChatControl` objects, requires titles to log in their users to PlayFab and retrieve their user's `entityId` and `titlePlayerEntityToken`. Login can be performed via the [PlayFab CPP SDK](../../../sdks/playfab-cpp/index.md), but if a title intends to use Xbox Live credentials to log into PlayFab, they may use `PartyXblManager::LoginToPlayFab` to avoid pulling in an extra dependency.

The following sample shows how the Xbox Live Helper library can help you create `PartyLocalUser` and `PartyLocalChatControl` objects, from `PartyXblLocalChatUser` objects. For more information on creating `PartyXblLocalChatUser` objects, see [Keeping Track of Xbox Live Users](#keeping-track-of-xbox-live-users).

```cpp
    err = PartyXblManager::GetSingleton().LoginToPlayFab(localChatUser, nullptr);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("LoginToPlayFab failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }
```

Shortly after calling `PartyXblManager::LoginToPlayFab` you will receive a `PartyXblLoginToPlayFabCompletedStateChange` containing the result of the login operation.

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

## Respecting an Xbox Live user's accessibility preferences

The `PartyXblLocalChatUser` object exposes some of the accessibility preferences of the Xbox Live user which are relevant to Party chat sessions. Titles can use this information to provide a better experience to their players by enabling some of Party's accessibility features right away.

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

Per Xbox Live policies, titles must not allow communication over Xbox Live when the user's privacy or permissions do not allow it. The Xbox Live Helper library helps you achieve that by allowing you to query the most restrictive `PartyChatPermissionOptions` between two users allowed by Xbox Live policies. Anytime this value changes, a `PartyXblRequiredChatPermissionInfoChangedStateChange` will be generated by the library. The updated `PartyChatPermissionOptions` can be obtained by a call to `PartyXblLocalChatUser::GetRequiredChatPermissionInfo()`.

```cpp
    PartyXblChatUser* remoteChatUser;
    PartyError err = PartyXblManager::GetSingleton().CreateRemoteChatUser(remoteXboxUserId, &remoteChatUser);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("CreateRemoteChatUser failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }

    // Once the chat control representing this remote Xbox Live user joins a network, we can use the custom context
    // on the PartyXblChatUser to store the chat control object for quick access in the future.
    remoteChatUser->SetCustomContext(m_remotePartyChatControl);
```

The Xbox Live helper library tracks the privacy and privilege settings for each remote chat user in relation to each local chat user by communicating with Xbox Live privacy services. Additionally, the library will listen for changes to these settings by subscribing to [Real-Time Activity](/gaming/gdk/_content/gc/live/features/general/rta/live-rta-nav) updates. When new remote chat users are added or when the privacy and privilege relationship between a local chat user and an existing remote chat user changes, a `PartyXblRequiredChatPermissionInfoChangedStateChange` will be generated to notify you that an updated `PartyChatPermissionOptions` value is now available.

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

## Respecting cross-network communication permissions

Titles that support cross-network play and communication between Xbox Live and non-Xbox Live players need to check communication permissions prior to allowing communication between those players. The Xbox Live Helper library provides this information through `PartyXblLocalChatUser::GetCrossNetworkCommunicationPrivacySetting()`. This method returns a `PartyXblCrossNetworkCommunicationPrivacySetting` enum with three possible value:

| **PartyXblCrossNetworkCommunicationPrivacySetting** | **Explanation** |
|:-----------|:----------------|
| Allowed    | This Xbox Live user's permissions are set to allow communication with all cross-network players.
| FriendsOnly| This Xbox Live user's permissions are set to allow communication with cross-network friend only.
| Disallowed | This Xbox Live user's permissions do not allow any communication with cross-network players.

```cpp
    PartyXblCrossNetworkCommunicationPrivacySetting crossNetworkSetting;
    localChatUser->GetCrossNetworkCommunicationPrivacySetting(&crossNetworkSetting);

    if (crossNetworkSetting == PartyXblCrossNetworkCommunicationPrivacySetting::Disallowed)
    {
        m_localChatControl->SetPermissions(crossNetworkChatControl, PartyChatPermissionOptions::None);
    }
```

More information on XR-015 and how it pertains to cross-network play and communication can be found [here](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview)

## Mapping between Xbox Live User IDs and PlayFab Entity IDs

Many Xbox Live titles using PlayFab Party need to translate between Xbox Live Users IDs (used throughout the Xbox Live ecosystem) and PlayFab Entity IDs (used by PlayFab Party). Using `PartyXblManager::GetEntityIdsFromXboxLiveUserIds`, titles can retrieve a list of PlayFab Entity IDs corresponding to a given list of Xbox Live User IDs. Titles are expected to already have a list of Xbox Live User IDs through the use of an external roster service, like the [Multiplayer Session Directory](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview). By associating the Xbox Live User IDs from the roster with their PlayFab Entity IDs, we can construct a mapping of all PlayFab Entity IDs corresponding to your game session's roster. This mapping can then be used to associate `PartyEndpoint` and `PartyChatControl` objects with their corresponding Xbox Live users.

> [!NOTE]
> Each Xbox Live User ID will only map to a PlayFab Entity ID if this Xbox Live user has already been linked to a PlayFab account. A PlayFab account is automatically created and linked the first time `PartyXblManager::LoginToPlayFab` is called for a given Xbox user. Alternatively, consumers of the PlayFab SDK can use the [LoginWithXbox](/rest/api/playfab/client/authentication/login-with-xbox?view=playfab-rest&preserve-view=true) API to achieve the same results.

The local `PartyXblLocalChatUser` will be used to authenticate with PlayFab. If the user was not previously logged in to PlayFab with a call to `PartyXblManager::LoginToPlayFab`, the Xbox Live Helper library will need to authenticate the user in the background.

```cpp
    uint32_t userCount;
    PartyXblChatUserArray chatUsers;
    PartyError err = PartyXblManager::GetSingleton().GetChatUsers(&userCount, &users);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("GetChatUsers failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }

    // The list of remote Xbox Live User IDs. This can be populated with arbitrary IDs
    // std::vector<uint64_t> remoteXboxLiveUserIds = {2533274792693551, 2814659110958830};
    //
    // but can also be pulled from the list of remote chat users
    std::vector<uint64_t> remoteXboxLiveUserIds;
    for (uint32_t i = 0; i < userCount; ++i)
    {
        PartyXblChatUser* chatUser = users[i];

        PartyXblLocalChatUser* localChatUser;
        err = chatUser->GetLocal(&localChatUser);
        if (PARTY_FAILED(err))
        {
            DEBUGLOG("PartyChatUser(0x%p)::GetLocal failed: %s\n", chatUser, PartyXblManager::GetErrorMessage(err));
            return;
        }

        if (localChatUser != nullptr)
        {
            continue; // ignore local users
        }

        uint64_t userId;
        err = chatUser->GetXboxUserId(&userId);
        if (PARTY_FAILED(err))
        {
            DEBUGLOG("PartyChatUser(0x%p)::GetXboxUserId failed: %s\n", chatUser, PartyXblManager::GetErrorMessage(err));
            return;
        }

        remoteXboxLiveUserIds.push_back(userId);
    }

    err = PartyXblManager::GetSingleton().GetEntityIdsFromXboxLiveUserIds(
        remoteXboxLiveUserIds.size(),
        remoteXboxLiveUserIds.data(),
        localChatUser,
        nullptr);
    if (PARTY_FAILED(err))
    {
        DEBUGLOG("GetEntityIdsFromXboxLiveUserIds failed: %s\n", PartyXblManager::GetErrorMessage(err));
        return;
    }
```

Shortly after calling `PartyXblManager::GetEntityIdsFromXboxLiveUserIds` you will receive a `PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange` containing the result of the operation. This result can be used to construct or update your mappings.

```cpp
    // Wait for PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange
    if (stateChange->stateChangeType == PartyXblStateChangeType::GetEntityIdsFromXboxLiveUserIdsCompleted)
    {
        std::vector<std::pair<uint64_t, std::string>> cachedXboxUserIdToPlayFabEntityIdMap;

        auto getEntityIdsFromXboxLiveUserIdsResult = static_cast<PartyXblGetEntityIdsFromXboxLiveUserIdsCompletedStateChange*>(stateChange);
        for (uint32_t i = 0; i < getEntityIdsFromXboxLiveUserIdsResult.entityIdMappingCount; ++i)
        {
            const PartyXblXboxUserIdToPlayFabEntityIdMapping& idMapping = getEntityIdsFromXboxLiveUserIdsResult.entityIdMappings[i];

            Log("   Xbox Live User ID: %llu", idMapping.xboxLiveUserId);
            if (strlen(idMapping.playfabEntityId)) != 0)
            {
                Log("    PlayFab Entity ID: %s", idMapping.playfabEntityId);
                cachedXboxUserIdToPlayFabEntityIdMap.emplace_back(idMapping.xboxLiveUserId, idMapping.playfabEntityId);
            }
            else
            {
                // This Xbox Live User did not have a linked PlayFab Account.
                Log("    PlayFab Entity ID: NOT FOUND");
            }
        }

        m_cachedXboxUserIdToPlayFabEntityIdMap = std::move(cachedXboxUserIdToPlayFabEntityIdMap);
```

With such a mapping, titles can recognize when a Party object represents an Xbox Live user.

```cpp
uint64_t
GetXboxUserIdFromPlayFabEntityId(
    PartyString entityId
    )
{
    for (const std::pair<uint64_t, std::string>& idMapping : m_cachedXboxUserIdToPlayFabEntityIdMap)
    {
        const std::string& entityIdForXboxUserId = idMapping.second;
        if (entityIdForXboxUserId == entityId)
        {
            return idMapping.first;
        }
    }

    // Failed to find a matching Xbox User ID. This Entity ID does not represent an Xbox Live user.
    return 0;
}
```

## Special considerations for Windows

On Windows, the Xbox Live Helper library needs helps from the title to obtain Xbox Live tokens. The library will request tokens by generating `PartyXblTokenAndSignatureRequestedStateChange`. The title can use the [Xbox Authentication Library](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview) (XAL) to fulfill these requests. Offloading this work to the title ensures that it remains in full control of any UI handling and consent prompt that is normally associated with user authentication.

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

For more guidance on how to retrieve token and signature using XAL, see the [Xbox Authentication Library documentation.](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview)

Once you have the token and signature, they can be provided to the Xbox Live Helper library by calling `PartyXblManager::CompleteGetTokenAndSignatureRequest()` with the same `correlationId` that was provided to the title through the state change.
