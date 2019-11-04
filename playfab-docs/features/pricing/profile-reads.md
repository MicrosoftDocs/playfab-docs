---
title: TBD
author: v-doglo
description: TBD
ms.author: v-doglo
ms.date: 11/04/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Profile Reads

Explanatory text.

## General

- [CheckLimitedEditionItemAvailability]https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/checklimitededitionitemavailability?view=playfab-rest)
    Checks the global count for the limited edition item.

- [GetAllSegments](https://docs.microsoft.com/rest/api/playfab/admin/playstream/getallsegments?view=playfab-rest)
    Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change.

- [GetCatalogItems](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getcatalogitems?view=playfab-rest)
    Retrieves the specified version of the title's catalog of virtual goods, including all defined properties.

- [GetContentList](https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentlist?view=playfab-rest)
    List all contents of the title and get statistics such as size.

- [GetDataReport](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getdatareport?view=playfab-rest)
    Retrieves a download URL for the requested report.

- [GetPlayedTitleList]()

- [GetPlayerProfile]()

- [GetPlayerSegments](https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersegments?view=playfab-rest)
    List all segments that a player currently belongs to at this moment in time.

- [GetPlayerSharedSecrets]()

- [GetPlayerStatisticDefinitions]()

- [GetPlayerStatisticVersions]()

- [GetPlayerTags](https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayertags?view=playfab-rest)
    Get all tags with a given Namespace (optional) from a player profile.

- [GetPolicy](https://docs.microsoft.com/rest/api/playfab/admin/authentication/getpolicy?view=playfab-rest)
    Gets the requested policy.

- [GetPublisherData](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getpublisherdata?view=playfab-rest)
    Retrieves the key-value store of custom publisher settings.

- [GetRandomResultTables](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getrandomresulttables?view=playfab-rest)
    Retrieves the random drop table configuration for the title.

- [GetStoreItems](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/getstoreitems?view=playfab-rest)
    Retrieves the set of items defined for the specified store, including all prices defined.

- [GetTitleData](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/gettitledata?view=playfab-rest)
    Retrieves the key-value store of custom title settings which can be read by the client.

- [GetUserAccountInfo](Retrieves the relevant details for a specified user, based upon a match against a supplied unique identifier)
    Retrieves the relevant details for a specified user, based upon a match against a supplied unique identifier.

- [GetUserBans](https://docs.microsoft.com/rest/api/playfab/admin/account-management/getuserbans?view=playfab-rest)
    Gets all bans for a user.

- [GetUserData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserdata?view=playfab-rest)
    Retrieves the title-specific custom data for the user which is readable and writable by the client.

- [GetUserInternalData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserinternaldata?view=playfab-rest)
    Retrieves the title-specific custom data for the user which cannot be accessed by the client.

- [GetUserInventory](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/getuserinventory?view=playfab-rest)
    Retrieves the specified user's current inventory of virtual goods

- [GetUserPublisherData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherdata?view=playfab-rest)
    Retrieves the publisher-specific custom data for the user which is readable and writable by the client.

- [GetUserPublisherInternalData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherinternaldata?view=playfab-rest)
    Retrieves the publisher-specific custom data for the user which cannot be accessed by the client.

- [GetUserPublisherReadOnlyData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserpublisherreadonlydata?view=playfab-rest)
    Retrieves the publisher-specific custom data for the user which can only be read by the client.

- [GetUserReadOnlyData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/getuserreadonlydata?view=playfab-rest)
    Retrieves the title-specific custom data for the user which can only be read by the client.

- [ListVirtualCurrencyTypes](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/listvirtualcurrencytypes?view=playfab-rest)
    Retuns the list of all defined virtual currencies for the title

- [GetMatchmakerGameInfo](https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergameinfo?view=playfab-rest)
    Retrieves the details for a specific completed session, including links to standard out and standard error logs.

- [GetMatchmakerGameModes](https://docs.microsoft.com/rest/api/playfab/admin/matchmaking/getmatchmakergamemodes?view=playfab-rest)
    Retrieves the details of defined game modes for the specified game server executable.

- [GetPlayerIdFromAuthToken](https://docs.microsoft.com/rest/api/playfab/admin/account-management/getplayeridfromauthtoken?view=playfab-rest)
    Gets a player's ID from an auth token.

- [GetPlayersInSegment](https://docs.microsoft.com/rest/api/playfab/admin/playstream/getplayersinsegment?view=playfab-rest)
    Allows for paging through all players in a given segment. This API creates a snapshot of all player profiles that match the segment definition at the time of its creation and lives through the Total Seconds to Live, refreshing its life span on each subsequent use of the Continuation Token. Profiles that change during the course of paging will not be reflected in the results. AB Test segments are currently not supported by this operation.

- [ConsumeItem](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/consumeitem?view=playfab-rest)
    Consume uses of a consumable item. When all uses are consumed, it will be removed from the player's inventory.

- [GetAllUsersCharacters](https://docs.microsoft.com/rest/api/playfab/client/characters/getalluserscharacters?view=playfab-rest)
    Lists all of the characters that belong to a specific user. CharacterIds are not globally unique; characterId must be evaluated with the parent PlayFabId to guarantee uniqueness.

- [GetCatalogItems](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getcatalogitems?view=playfab-rest)
    Retrieves the specified version of the title's catalog of virtual goods, including all defined properties.

- [GetCharacterData](https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterdata?view=playfab-rest)
    Retrieves the title-specific custom data for the character which is readable and writable by the client.

- [GetCharacterInventory](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getcharacterinventory?view=playfab-rest)
    Retrieves the specified character's current inventory of virtual goods.

- [GetCharacterLeaderboard](https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterleaderboard?view=playfab-rest)
    Retrieves a list of ranked characters for the given statistic, starting from the indicated point in the leaderboard.

- [GetCharacterReadOnlyData](https://docs.microsoft.com/rest/api/playfab/client/character-data/getcharacterreadonlydata?view=playfab-rest)
    Retrieves the title-specific custom data for the character which can only be read by the client.

- [GetCharacterStatistics](https://docs.microsoft.com/rest/api/playfab/client/characters/getcharacterstatistics?view=playfab-rest)
    Retrieves the details of all title-specific statistics for the user.

- [GetFriendLeaderboard](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboard?view=playfab-rest)
    Retrieves a list of ranked friends of the current player for the given statistic, starting from the indicated point in the leaderboard.

- [GetFriendLeaderboardAroundPlayer](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getfriendleaderboardaroundplayer?view=playfab-rest)
    Retrieves a list of ranked friends of the current player for the given statistic, centered on the requested PlayFab user. If PlayFabId is empty or null will return currently logged in user.

- [GetFriendsList](https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/getfriendslist?view=playfab-rest)
    Retrieves the current friend list for the local user, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.

- [GetGameServerRegions](https://docs.microsoft.com/rest/api/playfab/client/matchmaking/getgameserverregions?view=playfab-rest)
    Get details about the regions hosting game servers matching the given parameters.

- [GetLeaderboard](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboard?view=playfab-rest)
    Retrieves a list of ranked users for the given statistic, starting from the indicated point in the leaderboard.

- [GetLeaderboardAroundCharacter](https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardaroundcharacter?view=playfab-rest)
    Retrieves a list of ranked characters for the given statistic, centered on the requested Character ID.

- [GetLeaderboardAroundPlayer](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getleaderboardaroundplayer?view=playfab-rest)
        Retrieves a list of ranked users for the given statistic, centered on the requested player. If PlayFabId is empty or null will return currently logged in user.

- [GetLeaderboardForUserCharacters](https://docs.microsoft.com/rest/api/playfab/client/characters/getleaderboardforusercharacters?view=playfab-rest)
    Retrieves a list of all of the user's characters for the given statistic.

- [GetPaymentToken](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpaymenttoken?view=playfab-rest)
    For payments flows where the provider requires playfab (the fulfiller) to initiate the transaction, but the client completes the rest of the flow. In the Xsolla case, the token returned here will be passed to Xsolla by the client to create a cart. Poll GetPurchase using the returned OrderId once you've completed the payment.

- [GetPlayerProfile](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayerprofile?view=playfab-rest)
    Retrieves the player's profile.

- [GetPlayerSegments](https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayersegments?view=playfab-rest)
    List all segments that a player currently belongs to at this moment in time.

- [GetPlayerStatistics](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatistics?view=playfab-rest)
    Retrieves the indicated statistics (current version and values for all statistics, if none are specified), for the local player.

- [GetPlayerStatisticVersions](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/getplayerstatisticversions?view=playfab-rest)
    Retrieves the information on the available versions of the specified statistic.

- [GetPlayerTags](https://docs.microsoft.com/rest/api/playfab/client/playstream/getplayertags?view=playfab-rest)
    Get all tags with a given Namespace (optional) from a player profile.

- [GetPlayerTrades](https://docs.microsoft.com/rest/api/playfab/client/trading/getplayertrades?view=playfab-rest)
    Gets all trades the player has either opened or accepted, optionally filtered by trade status.

- [GetPlayFabIDsFromFacebookIDs](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.

- [GetPlayFabIDsFromFacebookInstantGamesIds](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromfacebookinstantgamesids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Facebook Instant Game identifiers.

- [GetPlayFabIDsFromGameCenterIDs](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgamecenterids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Game Center identifiers (referenced in the Game Center Programming Guide as the Player Identifier).

- [GetPlayFabIDsFromGenericIDs](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgenericids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of generic service identifiers. A generic identifier is the service name plus the service-specific ID for the player, as specified by the title when the generic identifier was added to the player account.

- [GetPlayFabIDsFromGoogleIDs](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromgoogleids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Google identifiers. The Google identifiers are the IDs for the user accounts, available as "id" in the Google+ People API calls.

- [GetPlayFabIDsFromKongregateIDs](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromkongregateids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Kongregate identifiers. The Kongregate identifiers are the IDs for the user accounts, available as "user_id" from the Kongregate API methods(ex: http://developers.kongregate.com/docs/client/getUserId).

- [GetPlayFabIDsFromNintendoSwitchDeviceIds](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromnintendoswitchdeviceids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Nintendo Switch identifiers.

- [GetPlayFabIDsFromPSNAccountIDs](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfrompsnaccountids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of PlayStation Network identifiers.

- [GetPlayFabIDsFromSteamIDs](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromsteamids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile IDs for the user accounts, available as SteamId in the Steamworks Community API calls.

- [GetPlayFabIDsFromTwitchIDs](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromtwitchids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Twitch identifiers. The Twitch identifiers are the IDs for the user accounts, available as "_id" from the Twitch API methods (ex: https://github.com/justintv/Twitch-API/blob/master/v3_resources/users.md#get-usersuser).

- [GetPlayFabIDsFromXboxLiveIDs](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayfabidsfromxboxliveids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers.

- [GetPublisherData](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getpublisherdata?view=playfab-rest)
    Retrieves the key-value store of custom publisher settings.

- [GetPurchase](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/getpurchase?view=playfab-rest)
    Retrieves a purchase along with its current PlayFab status. Returns inventory items from the purchase that are still active.

- [GetSharedGroupData](https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/getsharedgroupdata?view=playfab-rest)
    Retrieves data stored in a shared group object, as well as the list of members in the group. Non-members of the group may use this to retrieve group data, including membership, but they will not receive data for keys marked as private. Shared Groups are designed for sharing data between a very small number of players, please see our guide: https://api.playfab.com/docs/tutorials/landing-players/shared-groups

- [GetStoreItems](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/getstoreitems?view=playfab-rest)
    Retrieves the set of items defined for the specified store, including all prices defined.

- [GetTitleData](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitledata?view=playfab-rest)
    Retrieves the key-value store of custom title settings

- [GetAccountInfo](https://docs.microsoft.com/rest/api/playfab/client/account-management/getaccountinfo?view=playfab-rest)
    Retrieves the user's PlayFab account details.

- [LoginWithAndroidDeviceID](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithandroiddeviceid?view=playfab-rest)
    Signs the user in using the Android device identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithCustomID](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithcustomid?view=playfab-rest)
    Signs the user in using a custom unique identifier generated by the title, returning a session identifier that can subsequently be used for API calls which require an authenticated user

- [LoginWithEmailAddress](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithemailaddress?view=playfab-rest)
    Signs the user into the PlayFab account, returning a session identifier that can subsequently be used for API calls which require an authenticated user. Unlike most other login API calls, LoginWithEmailAddress does not permit the creation of new accounts via the CreateAccountFlag. Email addresses may be used to create accounts via RegisterPlayFabUser.

- [LoginWithFacebook](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithfacebook?view=playfab-rest)
    Signs the user in using a Facebook access token, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithFacebookInstantGamesId](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithfacebookinstantgamesid?view=playfab-rest)
    Signs the user in using a Facebook Instant Games ID, returning a session identifier that can subsequently be used for API calls which require an authenticated user. Requires Facebook Instant Games to be configured.

- [LoginWithGameCenter](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgamecenter?view=playfab-rest)
    Signs the user in using an iOS Game Center player identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithGoogleAccount](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgamecenter?view=playfab-rest)
    Signs the user in using an iOS Game Center player identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithIOSDeviceID](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithgoogleaccount?view=playfab-rest)
    Signs the user in using their Google account credentials.

- [LoginWithKongregate](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithkongregate?view=playfab-rest)
    Signs the user in using a Kongregate player account.

- [LoginWithNintendoSwitchDeviceId](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithnintendoswitchdeviceid?view=playfab-rest)
    Signs the user in using a Nintendo Switch Device ID, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithOpenIdConnect](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithopenidconnect?view=playfab-rest)
    Logs in a user with an Open ID Connect JWT created by an existing relationship between a title and an Open ID Connect provider.

- [LoginWithPlayFab](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithplayfab?view=playfab-rest)
    which require an authenticated user. Unlike most other login API calls, LoginWithPlayFab does not permit the creation of new accounts via the CreateAccountFlag. Username/Password credentials may be used to create accounts via RegisterPlayFabUser, or added to existing accounts using AddUsernamePassword.

- [LoginWithPSN](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithpsn?view=playfab-rest)    Signs the user into the PlayFab account, returning a session identifier that can subsequently be used for API calls which require an authenticated user. Unlike most other login API calls, LoginWithPlayFab does not permit the creation of new accounts via the CreateAccountFlag. Username/Password credentials may be used to create accounts via RegisterPlayFabUser, or added to existing accounts using AddUsernamePassword.

- [LoginWithSteam]https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithsteam?view=playfab-rest)
    Signs the user in using a Steam authentication ticket, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithTwitch](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithtwitch?view=playfab-rest)
    Signs the user in using a Twitch access token.

- [LoginWithWindowsHello](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithwindowshello?view=playfab-rest)
    Completes the Windows Hello login flow by returning the signed value of the challange from GetWindowsHelloChallenge. Windows Hello has a 2 step client to server authentication scheme. Step one is to request from the server a challenge string. Step two is to request the user sign the string via Windows Hello and then send the signed value back to the server.

- [LoginWithXbox](https://docs.microsoft.com/rest/api/playfab/client/authentication/loginwithxbox?view=playfab-rest)
    Signs the user in using a Xbox Live Token, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [GetCurrentGames](https://docs.microsoft.com/rest/api/playfab/client/matchmaking/getcurrentgames?view=playfab-rest)
    Get details about all current running game servers matching the given parameters.

- [GetPlayerCombinedInfo](https://docs.microsoft.com/rest/api/playfab/client/account-management/getplayercombinedinfo?view=playfab-rest)
    Retrieves all of the user's different kinds of info.

- [SetPlayerSecret](https://docs.microsoft.com/rest/api/playfab/client/authentication/setplayersecret?view=playfab-rest)
    Sets the player's secret if it is not already set. Player secrets are used to sign API requests. To reset a player's secret use the Admin or Server API method SetPlayerSecret.

- [GetObjects](https://docs.microsoft.com/rest/api/playfab/data/object/getobjects?view=playfab-rest)
    Retrieves objects from an entity's profile.

- [GetGroup](https://docs.microsoft.com/rest/api/playfab/groups/groups/getgroup?view=playfab-rest)
    Gets information about a group and its roles.

- [IsMember](https://docs.microsoft.com/rest/api/playfab/groups/groups/ismember?view=playfab-rest)
    Checks to see if an entity is a member of a group or role within the group.

- [ListGroupApplications](https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupapplications?view=playfab-rest)
    Lists all outstanding requests to join a group.

- [ListGroupBlocks](https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupblocks?view=playfab-rest)
    Lists all entities blocked from joining a group.

- [ListGroupInvitations](https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupinvitations?view=playfab-rest)
    Lists all outstanding invitations for a group.

- [ListGroupMembers](https://docs.microsoft.com/rest/api/playfab/groups/groups/listgroupmembers?view=playfab-rest)
    Lists all members for a group.

- [ListMembership](https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembership?view=playfab-rest)
    Lists all groups and roles for an entity.

- [ListMembershipOpportunities](https://docs.microsoft.com/rest/api/playfab/groups/groups/listmembershipopportunities?view=playfab-rest)
    Lists all outstanding invitations and group applications for an entity.

- [GetGlobalPolicy](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getglobalpolicy?view=playfab-rest)
    Gets the global title access policy.

- [GetProfile](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofile?view=playfab-rest)
    Retrieves the entity's profile.

- [GetProfiles](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/getprofiles?view=playfab-rest)
    Retrieves the entity's profile.

- [GetTitlePlayersFromMasterPlayerAccountIds](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/gettitleplayersfrommasterplayeraccountids?view=playfab-rest)
    Retrieves the title player accounts associated with the given master player account.

- [GetAllSegments](https://docs.microsoft.com/rest/api/playfab/server/playstream/getallsegments?view=playfab-rest)
    Retrieves an array of player segment definitions. Results from this can be used in subsequent API calls such as GetPlayersInSegment which requires a Segment ID. While segment names can change the ID for that segment will not change.

- [GetAllUsersCharacters](https://docs.microsoft.com/rest/api/playfab/server/characters/getalluserscharacters?view=playfab-rest)
    Lists all of the characters that belong to a specific user. CharacterIds are not globally unique; characterId must be evaluated with the parent PlayFabId to guarantee uniqueness.

- [GetCatalogItems](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getcatalogitems?view=playfab-rest)
    Retrieves the specified version of the title's catalog of virtual goods, including all defined properties.

- [GetCharacterData](https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterdata?view=playfab-rest)
    Retrieves the title-specific custom data for the user which is readable and writable by the client.

- [GetCharacterInternalData](https://docs.microsoft.com/rest/api/playfab/server/character-data/getcharacterinternaldata?view=playfab-rest)
    Retrieves the title-specific custom data for the user's character which cannot be accessed by the client.

- [GetCharacterInventory](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getcharacterinventory?view=playfab-rest)
    Retrieves the specified character's current inventory of virtual goods.

- [GetCharacterLeaderboard]()
    Retrieves a list of ranked characters for the given statistic, starting from the indicated point in the leaderboard.

- [GetCharacterReadOnlyData](https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterleaderboard?view=playfab-rest)

- [GetCharacterStatistics](https://docs.microsoft.com/rest/api/playfab/server/characters/getcharacterstatistics?view=playfab-rest)
    Retrieves the details of all title-specific statistics for the specific character.

- [GetFriendLeaderboard](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getfriendleaderboard?view=playfab-rest)
    Retrieves a list of ranked friends of the given player for the given statistic, starting from the indicated point in the leaderboard.

- [GetFriendsList](https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/getfriendslist?view=playfab-rest)
    Retrieves the current friends for the user with PlayFabId, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.

- [GetLeaderboard](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getleaderboard?view=playfab-rest)
    Retrieves a list of ranked users for the given statistic, starting from the indicated point in the leaderboard.

- [GetLeaderboardAroundCharacter](https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardaroundcharacter?view=playfab-rest)
    Retrieves a list of ranked characters for the given statistic, centered on the requested user.

- [GetLeaderboardAroundUser](https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardaroundcharacter?view=playfab-rest)
    Retrieves a list of ranked characters for the given statistic, centered on the requested user.

- [GetLeaderboardForUserCharacters](https://docs.microsoft.com/rest/api/playfab/server/characters/getleaderboardforusercharacters?view=playfab-rest)
    Retrieves a list of all of the user's characters for the given statistic.

- [GetPlayerCombinedInfo](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayercombinedinfo?view=playfab-rest)
    Returns whatever info is requested in the response for the user. Note that PII (like email address, facebook id) may be returned. All parameters default to false.

- [GetPlayerProfile](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayerprofile?view=playfab-rest)
    Retrieves the player's profile.

- [GetPlayerSegments](https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersegments?view=playfab-rest)
    List all segments that a player currently belongs to at this moment in time.

- [GetPlayersInSegment](https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayersinsegment?view=playfab-rest)
    Allows for paging through all players in a given segment. This API creates a snapshot of all player profiles that match the segment definition at the time of its creation and lives through the Total Seconds to Live, refreshing its life span on each subsequent use of the Continuation Token. Profiles that change during the course of paging will not be reflected in the results. AB Test segments are currently not supported by this operation.

- [GetPlayerStatistics](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatistics?view=playfab-rest)
    Retrieves the current version and values for the indicated statistics, for the local player.

- [GetPlayerStatisticVersions](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getplayerstatisticversions?view=playfab-rest)
    Retrieves the information on the available versions of the specified statistic.

- [GetPlayerTags](https://docs.microsoft.com/rest/api/playfab/server/playstream/getplayertags?view=playfab-rest)
    Get all tags with a given Namespace (optional) from a player profile.

- [GetPlayFabIDsFromFacebookIDs]()
    Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.

- [GetPlayFabIDsFromFacebookInstantGamesIds](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromfacebookids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.

- [GetPlayFabIDsFromGenericIDs](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromgenericids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of generic service identifiers. A generic identifier is the service name plus the service-specific ID for the player, as specified by the title when the generic identifier was added to the player account.

- [GetPlayFabIDsFromNintendoSwitchDeviceIds](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromnintendoswitchdeviceids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Nintendo Switch Device identifiers.

- [GetPlayFabIDsFromPSNAccountIDs](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfrompsnaccountids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of PlayStation Network identifiers.

- [GetPlayFabIDsFromSteamIDs](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromsteamids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile IDs for the user accounts, available as SteamId in the Steamworks Community API calls.

- [GetPlayFabIDsFromXboxLiveIDs](https://docs.microsoft.com/rest/api/playfab/server/account-management/getplayfabidsfromxboxliveids?view=playfab-rest)
    Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers.

- [GetPublisherData](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getpublisherdata?view=playfab-rest)
    Retrieves the key-value store of custom publisher settings.

- [GetRandomResultTables](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getrandomresulttables?view=playfab-rest)
    Retrieves the configuration information for the specified random results tables for the title, including all ItemId values and weights.

- [GetServerCustomIDsFromPlayFabIDs](https://docs.microsoft.com/rest/api/playfab/server/account-management/getservercustomidsfromplayfabids?view=playfab-rest)
    Retrieves the associated PlayFab account identifiers for the given set of server custom identifiers.

- [GetSharedGroupData](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/getsharedgroupdata?view=playfab-rest)
    Retrieves data stored in a shared group object, as well as the list of members in the group. The server can access all public and private group data. Shared Groups are designed for sharing data between a very small number of players, please see our guide: https://api.playfab.com/docs/tutorials/landing-players/shared-groups

- [GetStoreItems](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/getstoreitems?view=playfab-rest)
    Retrieves the set of items defined for the specified store, including all prices defined, for the specified player.

- [GetTitleData](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitledata?view=playfab-rest)
    Retrieves the key-value store of custom title settings.

- [GetTitleInternalData](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitleinternaldata?view=playfab-rest)
    Retrieves the key-value store of custom internal title settings.

- [GetUserAccountInfo](https://docs.microsoft.com/rest/api/playfab/server/account-management/getuseraccountinfo?view=playfab-rest)
    Retrieves the relevant details for a specified user.

- [GetUserBans](https://docs.microsoft.com/rest/api/playfab/server/account-management/getuserbans?view=playfab-rest)
    Gets all bans for a user.

- [GetUserData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserdata?view=playfab-rest)
    Retrieves the title-specific custom data for the user which is readable and writable by the client.

- [GetUserInternalData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserinternaldata?view=playfab-rest)
    Retrieves the title-specific custom data for the user which cannot be accessed by the client.

- [GetUserInventory](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/getuserinventory?view=playfab-rest)
    Retrieves the specified user's current inventory of virtual goods.

- [GetUserPublisherData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherdata?view=playfab-rest)
    Retrieves the publisher-specific custom data for the user which is readable and writable by the client.

- [GetUserPublisherInternalData]()
    Retrieves the publisher-specific custom data for the user which cannot be accessed by the client.

- [GetUserPublisherReadOnlyData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/getuserpublisherinternaldata?view=playfab-rest)

- [GetUserReadOnlyData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserreadonlydata?view=playfab-rest)
    Updates the title-specific custom data for the user which can only be read by the client.

- [LoginWithServerCustomId](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithservercustomid?view=playfab-rest)
    Securely login a game client from an external server backend using a custom identifier for that player. Server Custom ID and Client Custom ID are mutually exclusive and cannot be used to retrieve the same player account.

- [LoginWithXbox](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithxbox?view=playfab-rest)
    Signs the user in using a Xbox Live Token from an external server backend, returning a session identifier that can subsequently be used for API calls which require an authenticated user.

- [LoginWithXboxId](https://docs.microsoft.com/rest/api/playfab/server/authentication/loginwithxboxid?view=playfab-rest)
    Signs the user in using an Xbox ID and Sandbox ID, returning a session identifier that can subsequently be used for API calls which require an authenticated user.