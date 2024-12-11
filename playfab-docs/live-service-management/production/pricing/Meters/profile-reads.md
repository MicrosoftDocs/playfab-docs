---
title: Profile Reads Meter API Description
author: joannaleecy
description: This file details the APIs that cause profile reads meter to increment.
ms.author: joanlee
ms.date: 11/04/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Profile Reads

Profile includes any data stored related to the player profile, entity profile, character profile, groups, and inventory. Profile data is information that applies to an individual player, group of players, or items, and is stored as Key/Value Pairs (KVPs) by PlayFab. 

The following APIs cause the Profile read meter to increment.

## Admin APIs

- [CheckLimitedEditionItemAvailability](/rest/api/playfab/admin/player-item-management/check-limited-edition-item-availability?view=playfab-rest&preserve-view=true)
    Checks the global count for the limited edition item.

- [GetAllSegments](/rest/api/playfab/admin/play-stream/get-all-segments?view=playfab-rest&preserve-view=true)
    Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change.

- [ExportMasterPlayerData](/rest/api/playfab/admin/account-management/export-master-player-data?view=playfab-rest&preserve-view=true)
    Exports all associated data of a master player account.

- [GetCatalogItems](/rest/api/playfab/admin/title-wide-data-management/get-catalog-items?view=playfab-rest&preserve-view=true)
    Retrieves the specified version of the title's catalog of virtual goods, including all defined properties.

- [GetContentList](/rest/api/playfab/admin/content/get-content-list?view=playfab-rest&preserve-view=true)
    List all contents of the title and get statistics such as size.

- [GetDataReport](/rest/api/playfab/admin/player-data-management/get-data-report?view=playfab-rest&preserve-view=true)
    Retrieves a download URL for the requested report.

- [GetPlayerSegments](/rest/api/playfab/admin/play-stream/get-player-segments?view=playfab-rest&preserve-view=true)
    List all segments that a player currently belongs to at this moment in time.
    
- [GetPlayerTags](/rest/api/playfab/admin/play-stream/get-player-tags?view=playfab-rest&preserve-view=true)
    Get all tags with a given Namespace (optional) from a player profile.

- [GetPolicy](/rest/api/playfab/admin/authentication/get-policy?view=playfab-rest&preserve-view=true)
    Gets the requested policy.

- [GetPublisherData](/rest/api/playfab/admin/title-wide-data-management/get-publisher-data?view=playfab-rest&preserve-view=true)
    Retrieves the key-value store of custom publisher settings.

- [GetRandomResultTables](/rest/api/playfab/admin/title-wide-data-management/get-random-result-tables?view=playfab-rest&preserve-view=true)
    Retrieves the random drop table configuration for the title.

- [GetStoreItems](/rest/api/playfab/admin/title-wide-data-management/get-store-items?view=playfab-rest&preserve-view=true)
    Retrieves the set of items defined for the specified store, including all prices defined.

- [GetTitleData](/rest/api/playfab/admin/title-wide-data-management/get-title-data?view=playfab-rest&preserve-view=true)
    Retrieves the key-value store of custom title settings which can be read by the client.

- [GetUserAccountInfo](Retrieves the relevant details for a specified user, based upon a match against a supplied unique identifier)
    Retrieves the relevant details for a specified user, based upon a match against a supplied unique identifier.

- [GetUserBans](/rest/api/playfab/admin/account-management/get-user-bans?view=playfab-rest&preserve-view=true)
    Gets all bans for a user.

- [GetUserData](/rest/api/playfab/admin/player-data-management/get-user-data?view=playfab-rest&preserve-view=true)
    Retrieves the title-specific custom data for the user which is readable and writable by the client.

- [GetUserInternalData](/rest/api/playfab/admin/player-data-management/get-user-internal-data?view=playfab-rest&preserve-view=true)
    Retrieves the title-specific custom data for the user which cannot be accessed by the client.

- [GetUserInventory](/rest/api/playfab/admin/player-item-management/get-user-inventory?view=playfab-rest&preserve-view=true)
    Retrieves the specified user's current inventory of virtual goods

- [GetUserPublisherData](/rest/api/playfab/admin/player-data-management/get-user-publisher-data?view=playfab-rest&preserve-view=true)
    Retrieves the publisher-specific custom data for the user which is readable and writable by the client.

- [GetUserPublisherInternalData](/rest/api/playfab/admin/player-data-management/get-user-publisher-internal-data?view=playfab-rest&preserve-view=true)
    Retrieves the publisher-specific custom data for the user which cannot be accessed by the client.

- [GetUserPublisherReadOnlyData](/rest/api/playfab/admin/player-data-management/get-user-publisher-read-only-data?view=playfab-rest&preserve-view=true)
    Retrieves the publisher-specific custom data for the user which can only be read by the client.

- [GetUserReadOnlyData](/rest/api/playfab/admin/player-data-management/get-user-read-only-data?view=playfab-rest&preserve-view=true)
    Retrieves the title-specific custom data for the user which can only be read by the client.

- [ListVirtualCurrencyTypes](/rest/api/playfab/admin/title-wide-data-management/list-virtual-currency-types?view=playfab-rest&preserve-view=true)
    Retuns the list of all defined virtual currencies for the title

- [GetPlayerIdFromAuthToken](/rest/api/playfab/admin/account-management/get-player-id-from-auth-token?view=playfab-rest&preserve-view=true)
    Gets a player's ID from an auth token.

- [GetPlayersInSegment](/rest/api/playfab/admin/play-stream/get-players-in-segment?view=playfab-rest&preserve-view=true)
    Allows for paging through all players in a given segment. This API creates a snapshot of all player profiles that match the segment definition at the time of its creation and lives through the Total Seconds to Live, refreshing its life span on each subsequent use of the Continuation Token. Profiles that change during the course of paging will not be reflected in the results. AB Test segments are currently not supported by this operation.
    
- [GetExperiments](/rest/api/playfab/experimentation/experimentation/get-experiments?view=playfab-rest&preserve-view=true)
    Gets the details of all experiments for a title.
    
- [GetLatestScorecard](/rest/api/playfab/experimentation/experimentation/get-latest-scorecard?view=playfab-rest&preserve-view=true)
    Gets the latest scorecard of the experiment for the title.
    
- [GetTreatmentAssignment](/rest/api/playfab/experimentation/experimentation/get-treatment-assignment?view=playfab-rest&preserve-view=true)
    Gets the treatment assignments for a player for every running experiment in the title
    
## Client APIs

- [GetAllUsersCharacters](/rest/api/playfab/client/characters/get-all-users-characters?view=playfab-rest&preserve-view=true)
    Lists all of the characters that belong to a specific user. CharacterIds are not globally unique; characterId must be evaluated with the parent PlayFabId to guarantee uniqueness.

- [GetCatalogItems](/rest/api/playfab/client/title-wide-data-management/get-catalog-items?view=playfab-rest&preserve-view=true)
    Retrieves the specified version of the title's catalog of virtual goods, including all defined properties.

- [GetCharacterData](/rest/api/playfab/client/character-data/get-character-data?view=playfab-rest&preserve-view=true)
    Retrieves the title-specific custom data for the character which is readable and writable by the client.

- [GetCharacterInventory](/rest/api/playfab/client/player-item-management/get-character-inventory?view=playfab-rest&preserve-view=true)
    Retrieves the specified character's current inventory of virtual goods.

- [GetCharacterLeaderboard](/rest/api/playfab/client/characters/get-character-leaderboard?view=playfab-rest&preserve-view=true)
    Retrieves a list of ranked characters for the given statistic, starting from the indicated point in the leaderboard.

- [GetCharacterReadOnlyData](/rest/api/playfab/client/character-data/get-character-read-only-data?view=playfab-rest&preserve-view=true)
    Retrieves the title-specific custom data for the character which can only be read by the client.

- [GetCharacterStatistics](/rest/api/playfab/client/characters/get-character-statistics?view=playfab-rest&preserve-view=true)
    Retrieves the details of all title-specific statistics for the user.

- [GetFriendLeaderboard](/rest/api/playfab/client/player-data-management/get-friend-leaderboard?view=playfab-rest&preserve-view=true)
    Retrieves a list of ranked friends of the current player for the given statistic, starting from the indicated point in the leaderboard.

- [GetFriendLeaderboardAroundPlayer](/rest/api/playfab/client/player-data-management/get-friend-leaderboard-around-player?view=playfab-rest&preserve-view=true)
    Retrieves a list of ranked friends of the current player for the given statistic, centered on the requested PlayFab user. If PlayFabId is empty or null will return currently logged in user.

- [GetFriendsList](/rest/api/playfab/client/friend-list-management/get-friends-list?view=playfab-rest&preserve-view=true)
    Retrieves the current friend list for the local user, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.

- [GetLeaderboard](/rest/api/playfab/client/player-data-management/get-leaderboard?view=playfab-rest&preserve-view=true)
    Retrieves a list of ranked users for the given statistic, starting from the indicated point in the leaderboard.

- [GetLeaderboardAroundCharacter](/rest/api/playfab/client/characters/get-leaderboard-around-character?view=playfab-rest&preserve-view=true)
    Retrieves a list of ranked characters for the given statistic, centered on the requested Character ID.

- [GetLeaderboardAroundPlayer](/rest/api/playfab/client/player-data-management/get-leaderboard-around-player?view=playfab-rest&preserve-view=true)
        Retrieves a list of ranked users for the given statistic, centered on the requested player. If PlayFabId is empty or null will return currently logged in user.

- [GetLeaderboardForUserCharacters](/rest/api/playfab/client/characters/get-leaderboard-for-user-characters?view=playfab-rest&preserve-view=true)
    Retrieves a list of all of the user's characters for the given statistic.

- [GetPaymentToken](/rest/api/playfab/client/player-item-management/get-payment-token?view=playfab-rest&preserve-view=true)
    For payments flows where the provider requires playfab (the fulfiller) to initiate the transaction, but the client completes the rest of the flow. In the Xsolla case, the token returned here will be passed to Xsolla by the client to create a cart. Poll GetPurchase using the returned OrderId once you've completed the payment.

- [GetPlayerProfile](/rest/api/playfab/client/account-management/get-player-profile?view=playfab-rest&preserve-view=true)
    Retrieves the player's profile.

- [GetPlayerSegments](/rest/api/playfab/client/play-stream/get-player-segments?view=playfab-rest&preserve-view=true)
    List all segments that a player currently belongs to at this moment in time.

- [GetPlayerStatistics](/rest/api/playfab/client/player-data-management/get-player-statistics?view=playfab-rest&preserve-view=true)
    Retrieves the indicated statistics (current version and values for all statistics, if none are specified), for the local player.

- [GetPlayerStatisticVersions](/rest/api/playfab/client/player-data-management/get-player-statistic-versions?view=playfab-rest&preserve-view=true)
    Retrieves the information on the available versions of the specified statistic.

- [GetPlayerTags](/rest/api/playfab/client/play-stream/get-player-tags?view=playfab-rest&preserve-view=true)
    Get all tags with a given Namespace (optional) from a player profile.

- [GetPlayerTrades](/rest/api/playfab/client/trading/get-player-trades?view=playfab-rest&preserve-view=true)
    Gets all trades the player has either opened or accepted, optionally filtered by trade status.

- [GetPlayFabIDsFromFacebookIDs](/rest/api/playfab/client/account-management/get-playfab-ids-from-facebook-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.

- [GetPlayFabIDsFromFacebookInstantGamesIds](/rest/api/playfab/client/account-management/get-playfab-ids-from-facebook-instant-games-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Facebook Instant Game identifiers.

- [GetPlayFabIDsFromGameCenterIDs](/rest/api/playfab/client/account-management/get-playfab-ids-from-game-center-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Game Center identifiers (referenced in the Game Center Programming Guide as the Player Identifier).

- [GetPlayFabIDsFromGenericIDs](/rest/api/playfab/client/account-management/get-playfab-ids-from-generic-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of generic service identifiers. A generic identifier is the service name plus the service-specific ID for the player, as specified by the title when the generic identifier was added to the player account.

- [GetPlayFabIDsFromGoogleIDs](/rest/api/playfab/client/account-management/get-playfab-ids-from-google-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Google identifiers. The Google identifiers are the IDs for the user accounts, available as "id" in the Google+ People API calls.

- [GetPlayFabIDsFromKongregateIDs](/rest/api/playfab/client/account-management/get-playfab-ids-from-kongregate-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Kongregate identifiers. The Kongregate identifiers are the IDs for the user accounts, available as "user_id" from the Kongregate API methods(ex: http://developers.kongregate.com/docs/client/getUserId).

- [GetPlayFabIDsFromNintendoSwitchDeviceIds](/rest/api/playfab/client/account-management/get-playfab-ids-from-nintendo-switch-device-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Nintendo Switch identifiers.

- [GetPlayFabIDsFromPSNAccountIDs](/rest/api/playfab/client/account-management/get-playfab-ids-from-psn-account-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of PlayStation&#8482;Network identifiers.

- [GetPlayFabIDsFromSteamIDs](/rest/api/playfab/client/account-management/get-playfab-ids-from-steam-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile IDs for the user accounts, available as SteamId in the Steamworks Community API calls.

- [GetPlayFabIDsFromTwitchIDs](/rest/api/playfab/client/account-management/get-playfab-ids-from-twitch-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Twitch identifiers. The Twitch identifiers are the IDs for the user accounts, available as "_id" from the Twitch API methods (ex: https://github.com/justintv/Twitch-API/blob/master/v3_resources/users.md#get-usersuser).

- [GetPlayFabIDsFromXboxLiveIDs](/rest/api/playfab/client/account-management/get-playfab-ids-from-xbox-live-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers.

- [GetPublisherData](/rest/api/playfab/client/title-wide-data-management/get-publisher-data?view=playfab-rest&preserve-view=true)
    Retrieves the key-value store of custom publisher settings.

- [GetPurchase](/rest/api/playfab/client/player-item-management/get-purchase?view=playfab-rest&preserve-view=true)
    Retrieves a purchase along with its current PlayFab status. Returns inventory items from the purchase that are still active.

- [GetSharedGroupData](/rest/api/playfab/client/shared-group-data/get-shared-group-data?view=playfab-rest&preserve-view=true)
    Retrieves data stored in a shared group object, as well as the list of members in the group. Non-members of the group may use this to retrieve group data, including membership, but they will not receive data for keys marked as private. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](../../social/groups/using-shared-group-data.md).

- [GetStoreItems](/rest/api/playfab/client/title-wide-data-management/get-store-items?view=playfab-rest&preserve-view=true)
    Retrieves the set of items defined for the specified store, including all prices defined.

- [GetTitleData](/rest/api/playfab/client/title-wide-data-management/get-title-data?view=playfab-rest&preserve-view=true)
    Retrieves the key-value store of custom title settings

- [GetAccountInfo](/rest/api/playfab/client/account-management/get-account-info?view=playfab-rest&preserve-view=true)
    Retrieves the user's PlayFab account details.

- [LoginWithAndroidDeviceID](/rest/api/playfab/client/authentication/login-with-android-device-id?view=playfab-rest&preserve-view=true)
    Signs the user in using the Android device identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithCustomID](/rest/api/playfab/client/authentication/loginwithcustomid?view=playfab-rest&preserve-view=true)
    Signs the user in using a custom unique identifier generated by the title, returning a session identifier that can subsequently be used for API calls which require an authenticated user

- [LoginWithEmailAddress](/rest/api/playfab/client/authentication/login-with-email-address?view=playfab-rest&preserve-view=true)
    Signs the user into the PlayFab account, returning a session identifier that can subsequently be used for API calls which require an authenticated user. Unlike most other login API calls, LoginWithEmailAddress does not permit the creation of new accounts via the CreateAccountFlag. Email addresses may be used to create accounts via RegisterPlayFabUser.

- [LoginWithFacebook](/rest/api/playfab/client/authentication/login-with-facebook?view=playfab-rest&preserve-view=true)
    Signs the user in using a Facebook access token, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithFacebookInstantGamesId](/rest/api/playfab/client/authentication/login-with-facebook-instant-games-id?view=playfab-rest&preserve-view=true)
    Signs the user in using a Facebook Instant Games ID, returning a session identifier that can subsequently be used for API calls which require an authenticated user. Requires Facebook Instant Games to be configured.

- [LoginWithGameCenter](/rest/api/playfab/client/authentication/loginwithgamecenter?view=playfab-rest&preserve-view=true)
    Signs the user in using an iOS Game Center player identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithGoogleAccount](/rest/api/playfab/client/authentication/login-with-game-center?view=playfab-rest&preserve-view=true)
    Signs the user in using an iOS Game Center player identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithIOSDeviceID](/rest/api/playfab/client/authentication/login-with-google-account?view=playfab-rest&preserve-view=true)
    Signs the user in using their Google account credentials.

- [LoginWithKongregate](/rest/api/playfab/client/authentication/login-with-kongregate?view=playfab-rest&preserve-view=true)
    Signs the user in using a Kongregate player account.

- [LoginWithNintendoSwitchDeviceId](/rest/api/playfab/client/authentication/login-with-nintendo-switch-device-id?view=playfab-rest&preserve-view=true)
    Signs the user in using a Nintendo Switch Device ID, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithOpenIdConnect](/rest/api/playfab/client/authentication/login-with-openid-connect?view=playfab-rest&preserve-view=true)
    Logs in a user with an Open ID Connect JWT created by an existing relationship between a title and an Open ID Connect provider.

- [LoginWithPlayFab](/rest/api/playfab/client/authentication/login-with-playfab?view=playfab-rest&preserve-view=true)
    which require an authenticated user. Unlike most other login API calls, LoginWithPlayFab does not permit the creation of new accounts via the CreateAccountFlag. Username/Password credentials may be used to create accounts via RegisterPlayFabUser, or added to existing accounts using AddUsernamePassword.

- [LoginWithPSN](/rest/api/playfab/client/authentication/login-with-psn?view=playfab-rest&preserve-view=true)    Signs the user into the PlayFab account, returning a session identifier that can subsequently be used for API calls which require an authenticated user. Unlike most other login API calls, LoginWithPlayFab does not permit the creation of new accounts via the CreateAccountFlag. Username/Password credentials may be used to create accounts via RegisterPlayFabUser, or added to existing accounts using AddUsernamePassword.

- [LoginWithSteam](/rest/api/playfab/client/authentication/login-with-steam?view=playfab-rest&preserve-view=true)
    Signs the user in using a Steam authentication ticket, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithTwitch](/rest/api/playfab/client/authentication/login-with-twitch?view=playfab-rest&preserve-view=true)
    Signs the user in using a Twitch access token.

- [LoginWithXbox](/rest/api/playfab/client/authentication/loginwithxbox?view=playfab-rest&preserve-view=true)
    Signs the user in using a Xbox Live Token, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [GetPlayerCombinedInfo](/rest/api/playfab/client/account-management/get-player-combined-info?view=playfab-rest&preserve-view=true)
    Retrieves all of the user's different kinds of info.
    
“PlayStation” is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## Data APIs

- [GetObjects](/rest/api/playfab/data/object/get-objects?view=playfab-rest&preserve-view=true)
    Retrieves objects from an entity's profile.

## Groups APIs

- [GetGroup](/rest/api/playfab/groups/groups/get-group?view=playfab-rest&preserve-view=true)
    Gets information about a group and its roles.

- [IsMember](/rest/api/playfab/groups/groups/is-member?view=playfab-rest&preserve-view=true)
    Checks to see if an entity is a member of a group or role within the group.

- [ListGroupApplications](/rest/api/playfab/groups/groups/list-group-applications?view=playfab-rest&preserve-view=true)
    Lists all outstanding requests to join a group.

- [ListGroupBlocks](/rest/api/playfab/groups/groups/list-group-blocks?view=playfab-rest&preserve-view=true)
    Lists all entities blocked from joining a group.

- [ListGroupInvitations](/rest/api/playfab/groups/groups/list-group-invitations?view=playfab-rest&preserve-view=true)
    Lists all outstanding invitations for a group.

- [ListGroupMembers](/rest/api/playfab/groups/groups/list-group-members?view=playfab-rest&preserve-view=true)
    Lists all members for a group.

- [ListMembership](/rest/api/playfab/groups/groups/list-membership?view=playfab-rest&preserve-view=true)
    Lists all groups and roles for an entity.

- [ListMembershipOpportunities](/rest/api/playfab/groups/groups/list-membership-opportunities?view=playfab-rest&preserve-view=true)
    Lists all outstanding invitations and group applications for an entity.


## Profile APIs

- [GetGlobalPolicy](/rest/api/playfab/profiles/account-management/get-global-policy?view=playfab-rest&preserve-view=true)
    Gets the global title access policy.

- [GetProfile](/rest/api/playfab/profiles/account-management/get-profile?view=playfab-rest&preserve-view=true)
    Retrieves the entity's profile.

- [GetProfiles](/rest/api/playfab/profiles/account-management/get-profiles?view=playfab-rest&preserve-view=true)
    Retrieves the entity's profile.

- [GetTitlePlayersFromMasterPlayerAccountIds](/rest/api/playfab/profiles/account-management/get-title-players-from-master-player-account-ids?view=playfab-rest&preserve-view=true)
    Retrieves the title player accounts associated with the given master player account.

## Server APIs


- [EvaluateRandomResultTable](/rest/api/playfab/server/player-item-management/evaluate-random-result-table?view=playfab-rest&preserve-view=true)
    Returns the result of an evaluation of a Random Result Table - the ItemId from the game Catalog which would have been added to the player inventory, if the Random Result Table were added via a Bundle or a call to UnlockContainer.

- [GetAllSegments](/rest/api/playfab/server/play-stream/get-all-segments?view=playfab-rest&preserve-view=true)
    Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change.

- [GetAllUsersCharacters](/rest/api/playfab/server/characters/get-all-users-characters?view=playfab-rest&preserve-view=true)
    Lists all of the characters that belong to a specific user. CharacterIds are not globally unique; characterId must be evaluated with the parent PlayFabId to guarantee uniqueness.

- [GetCatalogItems](/rest/api/playfab/server/title-wide-data-management/get-catalog-items?view=playfab-rest&preserve-view=true)
    Retrieves the specified version of the title's catalog of virtual goods, including all defined properties.

- [GetCharacterData](/rest/api/playfab/server/character-data/get-character-data?view=playfab-rest&preserve-view=true)
    Retrieves the title-specific custom data for the user which is readable and writable by the client.

- [GetCharacterInternalData](/rest/api/playfab/server/character-data/get-character-internal-data?view=playfab-rest&preserve-view=true)
    Retrieves the title-specific custom data for the user's character which cannot be accessed by the client.

- [GetCharacterInventory](/rest/api/playfab/server/player-item-management/get-character-inventory?view=playfab-rest&preserve-view=true)
    Retrieves the specified character's current inventory of virtual goods.

- [GetCharacterReadOnlyData](/rest/api/playfab/server/characters/get-character-leaderboard?view=playfab-rest&preserve-view=true)

- [GetCharacterStatistics](/rest/api/playfab/server/characters/get-character-statistics?view=playfab-rest&preserve-view=true)
    Retrieves the details of all title-specific statistics for the specific character.

- [GetFriendLeaderboard](/rest/api/playfab/server/player-data-management/get-friend-leaderboard?view=playfab-rest&preserve-view=true)
    Retrieves a list of ranked friends of the given player for the given statistic, starting from the indicated point in the leaderboard.

- [GetFriendsList](/rest/api/playfab/server/friend-list-management/get-friends-list?view=playfab-rest&preserve-view=true)
    Retrieves the current friends for the user with PlayFabId, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.

- [GetLeaderboard](/rest/api/playfab/server/player-data-management/get-leaderboard?view=playfab-rest&preserve-view=true)
    Retrieves a list of ranked users for the given statistic, starting from the indicated point in the leaderboard.

- [GetLeaderboardAroundCharacter](/rest/api/playfab/server/characters/getleaderboardaroundcharacter?view=playfab-rest&preserve-view=true)
    Retrieves a list of ranked characters for the given statistic, centered on the requested user.

- [GetLeaderboardAroundUser](/rest/api/playfab/server/characters/get-leaderboard-around-character?view=playfab-rest&preserve-view=true)
    Retrieves a list of ranked characters for the given statistic, centered on the requested user.

- [GetLeaderboardForUserCharacters](/rest/api/playfab/server/characters/get-leaderboard-for-user-characters?view=playfab-rest&preserve-view=true)
    Retrieves a list of all of the user's characters for the given statistic.

- [GetPlayerCombinedInfo](/rest/api/playfab/server/player-data-management/get-player-combined-info?view=playfab-rest&preserve-view=true)
    Returns whatever info is requested in the response for the user. Note that PII (like email address, facebook id) may be returned. All parameters default to false.

- [GetPlayerProfile](/rest/api/playfab/server/account-management/get-player-profile?view=playfab-rest&preserve-view=true)
    Retrieves the player's profile.

- [GetPlayerSegments](/rest/api/playfab/server/play-stream/get-player-segments?view=playfab-rest&preserve-view=true)
    List all segments that a player currently belongs to at this moment in time.

- [GetPlayersInSegment](/rest/api/playfab/server/play-stream/get-players-in-segment?view=playfab-rest&preserve-view=true)
    Allows for paging through all players in a given segment. This API creates a snapshot of all player profiles that match the segment definition at the time of its creation and lives through the Total Seconds to Live, refreshing its life span on each subsequent use of the Continuation Token. Profiles that change during the course of paging will not be reflected in the results. AB Test segments are currently not supported by this operation.

- [GetPlayerStatistics](/rest/api/playfab/server/player-data-management/get-player-statistics?view=playfab-rest&preserve-view=true)
    Retrieves the current version and values for the indicated statistics, for the local player.

- [GetPlayerStatisticVersions](/rest/api/playfab/server/player-data-management/get-player-statistic-versions?view=playfab-rest&preserve-view=true)
    Retrieves the information on the available versions of the specified statistic.

- [GetPlayerTags](/rest/api/playfab/server/play-stream/get-player-tags?view=playfab-rest&preserve-view=true)
    Get all tags with a given Namespace (optional) from a player profile.

- [GetPlayFabIDsFromFacebookIDs](/rest/api/playfab/server/account-management/getplayfabidsfromfacebookids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.

- [GetPlayFabIDsFromFacebookInstantGamesIds](/rest/api/playfab/server/account-management/get-playfab-ids-from-facebook-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.

- [GetPlayFabIDsFromGenericIDs](/rest/api/playfab/server/account-management/get-playfab-ids-from-generic-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of generic service identifiers. A generic identifier is the service name plus the service-specific ID for the player, as specified by the title when the generic identifier was added to the player account.

- [GetPlayFabIDsFromNintendoSwitchDeviceIds](/rest/api/playfab/server/account-management/get-playfab-ids-from-nintendo-switch-device-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Nintendo Switch Device identifiers.

- [GetPlayFabIDsFromPSNAccountIDs](/rest/api/playfab/server/account-management/get-playfab-ids-from-psn-account-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of PlayStation Network identifiers.

- [GetPlayFabIDsFromSteamIDs](/rest/api/playfab/server/account-management/get-playfab-ids-from-steam-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile IDs for the user accounts, available as SteamId in the Steamworks Community API calls.

- [GetPlayFabIDsFromXboxLiveIDs](/rest/api/playfab/server/account-management/get-playfab-ids-from-xbox-live-ids?view=playfab-rest&preserve-view=true)
    Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers.

- [GetPublisherData](/rest/api/playfab/server/title-wide-data-management/get-publisher-data?view=playfab-rest&preserve-view=true)
    Retrieves the key-value store of custom publisher settings.

- [GetRandomResultTables](/rest/api/playfab/server/player-item-management/get-random-result-tables?view=playfab-rest&preserve-view=true)
    Retrieves the configuration information for the specified random results tables for the title, including all ItemId values and weights.

- [GetServerCustomIDsFromPlayFabIDs](/rest/api/playfab/server/account-management/get-server-custom-ids-from-playfab-ids?view=playfab-rest&preserve-view=true)
    Retrieves the associated PlayFab account identifiers for the given set of server custom identifiers.

- [GetSharedGroupData](/rest/api/playfab/server/shared-group-data/get-shared-group-data?view=playfab-rest&preserve-view=true)
    Retrieves data stored in a shared group object, as well as the list of members in the group. The server can access all public and private group data. Shared Groups are designed for sharing data between a very small number of players,  see [Using Shared Group Data](../../social/groups/using-shared-group-data.md).

- [GetStoreItems](/rest/api/playfab/server/title-wide-data-management/get-store-items?view=playfab-rest&preserve-view=true)
    Retrieves the set of items defined for the specified store, including all prices defined, for the specified player.

- [GetTitleData](/rest/api/playfab/server/title-wide-data-management/get-title-data?view=playfab-rest&preserve-view=true)
    Retrieves the key-value store of custom title settings.

- [GetTitleInternalData](/rest/api/playfab/server/title-wide-data-management/get-title-internal-data?view=playfab-rest&preserve-view=true)
    Retrieves the key-value store of custom internal title settings.

- [GetUserAccountInfo](/rest/api/playfab/server/account-management/get-user-account-info?view=playfab-rest&preserve-view=true)
    Retrieves the relevant details for a specified user.

- [GetUserBans](/rest/api/playfab/server/account-management/get-user-bans?view=playfab-rest&preserve-view=true)
    Gets all bans for a user.

- [GetUserData](/rest/api/playfab/server/player-data-management/get-user-data?view=playfab-rest&preserve-view=true)
    Retrieves the title-specific custom data for the user which is readable and writable by the client.

- [GetUserInternalData](/rest/api/playfab/server/player-data-management/get-user-internal-data?view=playfab-rest&preserve-view=true)
    Retrieves the title-specific custom data for the user which cannot be accessed by the client.

- [GetUserInventory](/rest/api/playfab/server/player-item-management/get-user-inventory?view=playfab-rest&preserve-view=true)
    Retrieves the specified user's current inventory of virtual goods.

- [GetUserPublisherData](/rest/api/playfab/server/player-data-management/get-user-publisher-data?view=playfab-rest&preserve-view=true)
    Retrieves the publisher-specific custom data for the user which is readable and writable by the client.

- [GetUserPublisherInternalData](/rest/api/playfab/server/player-data-management/getuserpublisherinternaldata?view=playfab-rest&preserve-view=true)
    Retrieves the publisher-specific custom data for the user which cannot be accessed by the client.

- [GetUserPublisherReadOnlyData](/rest/api/playfab/server/player-data-management/get-user-publisher-internal-data?view=playfab-rest&preserve-view=true)

- [GetUserReadOnlyData](/rest/api/playfab/server/player-data-management/update-user-read-only-data?view=playfab-rest&preserve-view=true)
    Updates the title-specific custom data for the user which can only be read by the client.

- [LoginWithServerCustomId](/rest/api/playfab/server/authentication/login-with-server-custom-id?view=playfab-rest&preserve-view=true)
    Securely login a game client from an external server backend using a custom identifier for that player. Server Custom ID and Client Custom ID are mutually exclusive and cannot be used to retrieve the same player account.

- [LoginWithXbox](/rest/api/playfab/server/authentication/login-with-xbox?view=playfab-rest&preserve-view=true)
    Signs the user in using a Xbox Live Token from an external server backend, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithXboxId](/rest/api/playfab/server/authentication/login-with-xbox-id?view=playfab-rest&preserve-view=true)
    Signs the user in using an Xbox ID and Sandbox ID, returning a session identifier that can subsequently be used for API calls which require an authenticated user.
