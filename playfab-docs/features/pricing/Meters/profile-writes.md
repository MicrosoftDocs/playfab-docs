---
title: Profile Writes Meter API Description
author: joannaleecy
description: This file details the APIs that cause profile writes meter to increment.
ms.author: joanlee
ms.date: 11/04/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Profile Writes

Profile includes any data stored related to the player profile, entity profile, character profile, groups, and inventory. Profile data is information that applies to an individual player, group of players, or items, and is stored as Key/Value Pairs (KVPs) by PlayFab. 

The following APIs cause the Profile writes meter to increment.


## Admin APIs

- [AddPlayerTag](https://docs.mic'osoft.com/rest/api/playfab/admin/playstream/addplayertag?view=playfab-rest)
    Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag.

- [AddUserVirtualCurrency](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/adduservirtualcurrency?view=playfab-rest)
    Increments the specified virtual currency by the stated amount

- [AddVirtualCurrencyTypes](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addvirtualcurrencytypes?view=playfab-rest)
    Adds one or more virtual currencies to the set defined for the title. Virtual Currencies have a maximum value of 2,147,483,647 when granted to a player. Any value over that will be discarded.

- [BanUsers](https://docs.microsoft.com/rest/api/playfab/admin/account-management/banusers?view=playfab-rest)
    Bans users by PlayFab ID with optional IP address, or MAC address for the provided game.

-[CreateActionsOnPlayersInSegmentTask](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/createactionsonplayersinsegmenttask?view=playfab-rest)
    Create an ActionsOnPlayersInSegment task, which iterates through all players in a segment to execute action.

-[CreatePlayerSharedSecret](https://docs.microsoft.com/rest/api/playfab/admin/authentication/createplayersharedsecret?view=playfab-rest)
    Creates a new Player Shared Secret Key. It may take up to 5 minutes for this key to become generally available after this API returns.

-[CreatePlayerStatisticDefinition](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/createplayerstatisticdefinition?view=playfab-rest)
    Adds a new player statistic configuration to the title, optionally allowing the developer to specify a reset interval and an aggregation method.

- [DeleteMasterPlayerAccount](https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletemasterplayeraccount?view=playfab-rest)
    Removes a master player account entirely from all titles and deletes all associated data.

- [DeletePlayer](https://docs.microsoft.com/rest/api/playfab/admin/account-management/deleteplayer?view=playfab-rest)
    Removes a user's player account from a title and deletes all associated data

- [DeletePlayerSharedSecret](https://docs.microsoft.com/rest/api/playfab/admin/authentication/deleteplayersharedsecret?view=playfab-rest)
    Deletes an existing Player Shared Secret Key. It may take up to 5 minutes for this delete to be reflected after this API returns.

- [DeleteStore](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/deletestore?view=playfab-rest)
    Deletes an existing virtual item store.

- [DeleteTitle](https://docs.microsoft.com/rest/api/playfab/admin/account-management/deletetitle?view=playfab-rest)
    Permanently deletes a title and all associated configuration.

- [GrantItemsToUsers](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/grantitemstousers?view=playfab-rest)
    Adds the specified items to the specified user inventories

-[IncrementLimitedEditionItemAvailability](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/incrementlimitededitionitemavailability?view=playfab-rest)
    Increases the global count for the given scarce resource.

-[IncrementPlayerStatisticVersion](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/incrementplayerstatisticversion?view=playfab-rest)
    Resets the indicated statistic, removing all player entries for it and backing up the old values.

- [RefundPurchase](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/refundpurchase?view=playfab-rest)
    Attempts to process an order refund through the origin'l real money payment provider.""

- [RemovePlayerTag](https://docs.microsoft.com/rest/api/playfab/admin/playstream/removeplayertag?view=playfab-rest)
    Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag.

- [RemoveVirtualCurrencyTypes](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/removevirtualcurrencytypes?view=playfab-rest)
    Removes one or more virtual currencies from the set defined for the title.

- [ResetCharacterStatistics](https://docs.microsoft.com/rest/api/playfab/admin/characters/resetcharacterstatistics?view=playfab-rest)
    Completely removes all statistics for the specified character, for the current game.

- [ResetUserStatistics](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resetuserstatistics?view=playfab-rest)
    Completely removes all statistics for the specified user, for the current game.

-[ResolvePurchaseDispute](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/resolvepurchasedispute?view=playfab-rest)
    Attempts to resolve a dispute with the original order's payment provider.
    
- [RevokeAllBansForUser](https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokeallbansforuser?view=playfab-rest)
    Revoke all active bans for a user.

- [RevokeBans](https://docs.microsoft.com/rest/api/playfab/admin/account-management/revokebans?view=playfab-rest)
    Revoke all active bans specified with BanId.

- [RevokeInventoryItem](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitem?view=playfab-rest)
    Revokes access to an item in a user's inventory

- [RevokeInventoryItems](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/revokeinventoryitems?view=playfab-rest)
    Revokes access for up to 25 items across multiple users and characters.

- [SetCatalogItems](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setcatalogitems?view=playfab-rest)
    Creates the catalog configuration of all virtual goods for the specified catalog version.

- [SetPlayerSecret](https://docs.microsoft.com/rest/api/playfab/admin/authentication/setplayersecret?view=playfab-rest)
    Sets or resets the player's secret. Player secrets are used to sign API requests.

- [SetPublishedRevision](https://docs.microsoft.com/rest/api/playfab/admin/server-side-cloud-script/setpublishedrevision?view=playfab-rest)
    Sets the currently published revision of a title Cloud Script.
    
- [SetPublisherData](https://docs.microsoft.com/rest/api/playfab/admin/shared-group-data/setpublisherdata?view=playfab-rest)
    Updates the key-value store of custom publisher settings

- [SetStoreItems](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setstoreitems?view=playfab-rest)
    Sets all the items in one virtual store.

- [SetTitleData](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitledata?view=playfab-rest)
    Creates and updates the key-value store of custom title settings which can be read by the client.

- [SetTitleInternalData](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/settitleinternaldata?view=playfab-rest)
    Updates the key-value store of custom title settings which cannot be read by the client.

- [SubtractUserVirtualCurrency](https://docs.microsoft.com/rest/api/playfab/admin/player-item-management/subtractuservirtualcurrency?view=playfab-rest)
    Decrements the specified virtual currency by the stated amount.

- [UpdateBans](https://docs.microsoft.com/rest/api/playfab/admin/account-management/updatebans?view=playfab-rest)
    Updates information of a list of existing bans specified with Ban Ids.

- [UpdateCatalogItems](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatecatalogitems?view=playfab-rest)
    Updates the catalog configuration for virtual goods in the specified catalog version.

- [UpdatePlayerSharedSecret](https://docs.microsoft.com/rest/api/playfab/admin/authentication/updateplayersharedsecret?view=playfab-rest)
    Updates a existing Player Shared Secret Key. It may take up to 5 minutes for this update to become generally available after this API returns.

- [UpdatePlayerStatisticDefinition](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateplayerstatisticdefinition?view=playfab-rest)
    Updates a player statistic configuration for the title, optionally allowing the developer to specify a reset interval.

- [UpdateRandomResultTables](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updaterandomresulttables?view=playfab-rest)
    Updates the random drop table configuration for the title

- [UpdateStoreItems](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/updatestoreitems?view=playfab-rest)
    Updates an existing virtual item store with new or modified items.

- [UpdateUserData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserdata?view=playfab-rest)
    Updates the title-specific custom data for the user which is readable and writable by the client.

- [UpdateUserInternalData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserinternaldata?view=playfab-rest)
    Updates the title-specific custom data for the user which cannot be accessed by the client.

- [UpdateUserPublisherData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherdata?view=playfab-rest)
    Updates the publisher-specific custom data for the user which is readable and writable by the client.

- [UpdateUserPublisherInternalData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherinternaldata?view=playfab-rest)
    Updates the publisher-specific custom data for the user which cannot be accessed by the client.

- [UpdateUserPublisherReadOnlyData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserpublisherreadonlydata?view=playfab-rest)
    Updates the publisher-specific custom data for the user which can only be read by the client.

- [UpdateUserReadOnlyData](https://docs.microsoft.com/rest/api/playfab/admin/player-data-management/updateuserreadonlydata?view=playfab-rest)
    Updates the title-specific custom data for the user which can only be read by the client.

- [UpdateUserTitleDisplayName](https://docs.microsoft.com/rest/api/playfab/admin/account-management/updateusertitledisplayname?view=playfab-rest)
    Updates the title specific display name for a user.

## Client APIs

- [AcceptTrade](https://docs.microsoft.com/rest/api/playfab/client/trading/accepttrade?view=playfab-rest)
    Accepts an open trade (one that has not yet been accepted or cancelled), if the locally signed-in player is in the allowed player list for the trade, or it is open to all players. If the call is successful, the offered and accepted items will be swapped between the two players' inventories.

- [AddFriend](https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/addfriend?view=playfab-rest)
    Adds the PlayFab user, based upon a match against a supplied unique identifier, to the friend list of the local user. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.

- [AddGenericID](https://docs.microsoft.com/rest/api/playfab/server/account-management/addgenericid?view=playfab-rest)
    Adds the specified generic service identifier to the player's PlayFab account. This is designed to allow for a PlayFab ID lookup of any arbitrary service identifier a title wants to add. This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other players.

- [AddOrUpdateContactEmail](https://docs.microsoft.com/rest/api/playfab/client/account-management/addorupdatecontactemail?view=playfab-rest)
    Adds or updates a contact email to the player's profile.

- [AddSharedGroupMembers](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/addsharedgroupmembers?view=playfab-rest)
    Adds users to the set of those able to update both the shared data, as well as the set of users in the group. Only users in the group (and the server) can add new members. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data).

- [AddUsernamePassword](https://docs.microsoft.com/rest/api/playfab/client/account-management/addusernamepassword?view=playfab-rest)
    Adds playfab username/password auth to an existing account created via an anonymous auth method, e.g. automatic device ID login.

- [AndroidDevicePushNotificationRegistration](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/androiddevicepushnotificationregistration?view=playfab-rest)
    Registers the Android device to receive push notifications

- [ConsumePSNEntitlements](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumepsnentitlements?view=playfab-rest)
    Checks for any new consumable entitlements. If any are found, they are consumed and added as PlayFab items.

- [ConsumeXboxEntitlements](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/consumexboxentitlements?view=playfab-rest)
    Grants the player's current entitlements from Xbox Live, consuming all availble items in Xbox and granting them to the player's PlayFab inventory. This call is idempotent and will not grant previously granted items to the player.

- [CreateSharedGroup](https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/createsharedgroup?view=playfab-rest)
    Requests the creation of a shared group object, containing key/value pairs which may be updated by all members of the group. Upon creation, the current user will be the only member of the group. Shared Groups are designed for sharing data between a very small number of players. For more info, see [Using Shared Group Data](https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data).

- [GrantCharacterToUser](https://docs.microsoft.com/rest/api/playfab/client/characters/grantcharactertouser?view=playfab-rest)
    Grants the specified character type to the user. CharacterIds are not globally unique; characterId must be evaluated with the parent PlayFabId to guarantee uniqueness.

- [LinkAndroidDeviceID](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkandroiddeviceid?view=playfab-rest)
    Links the Android device identifier to the user's PlayFab account

- [LinkCustomID](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkcustomid?view=playfab-rest)
    Links the custom identifier, generated by the title, to the user's PlayFab account.

- [LinkFacebookAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkfacebookaccount?view=playfab-rest)
    Links the Facebook account associated with the provided Facebook access token to the user's PlayFab account.

- [LinkFacebookInstantGamesId](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkfacebookinstantgamesid?view=playfab-rest)
    Links the Facebook Instant Games Id to the user's PlayFab account.

- [LinkGameCenterAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgamecenteraccount?view=playfab-rest)
    Links the Game Center account associated with the provided Game Center ID to the user's PlayFab account.

- [LinkGoogleAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkgoogleaccount?view=playfab-rest)
    Links the currently signed-in user account to their Google account, using their Google account credentials.

- [LinkIOSDeviceID](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkiosdeviceid?view=playfab-rest)
    Links the vendor-specific iOS device identifier to the user's PlayFab account.

- [LinkKongregate](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkkongregate?view=playfab-rest)
    Links the Kongregate identifier to the user's PlayFab account.

- [LinkNintendoSwitchDeviceId](https://docs.microsoft.com/rest/api/playfab/client/account-management/linknintendoswitchdeviceid?view=playfab-rest)
    Links the NintendoSwitchDeviceId to the user's PlayFab account.

- [LinkOpenIdConnect](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkopenidconnect?view=playfab-rest)
    Links an OpenID Connect account to a user's PlayFab account, based on an existing relationship between a title and an Open ID Connect provider and the OpenId Connect JWT from that provider.

- [LinkPSNAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkpsnaccount?view=playfab-rest)
    Links the PlayStation Network account associated with the provided access code to the user's PlayFab account.

- [LinkSteamAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/linksteamaccount?view=playfab-rest)
    Links the Steam account associated with the provided Steam authentication ticket to the user's PlayFab account.

- [LinkTwitch](https://docs.microsoft.com/rest/api/playfab/client/account-management/linktwitch?view=playfab-rest)
    Links the Twitch account associated with the token to the user's PlayFab account.

- [LinkWindowsHello](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkwindowshello?view=playfab-rest)
    Link Windows Hello authentication to the current PlayFab Account.

- [LinkXboxAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/linkxboxaccount?view=playfab-rest)
    Links the Xbox Live account associated with the provided access code to the user's PlayFab account.

- [OpenTrade](https://docs.microsoft.com/rest/api/playfab/client/trading/opentrade?view=playfab-rest)
    Opens a new outstanding trade. Note that a given item instance may only be in one open trade at a time.

- [PurchaseItem](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/purchaseitem?view=playfab-rest)
    Buys a single item with virtual currency. You must specify both the virtual currency to use to purchase, as well as what the client believes the price to be. This lets the server fail the purchase if the price has changed.

- [PayForPurchase](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/payforpurchase?view=playfab-rest)
    Selects a payment option for purchase order created via StartPurchase

- [RegisterForIOSPushNotification](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/registerforiospushnotification?view=playfab-rest)
    Registers the iOS device to receive push notifications

- [RegisterPlayFabUser](https://docs.microsoft.com/rest/api/playfab/client/authentication/registerplayfabuser?view=playfab-rest)
    Registers a new Playfab user account, returning a session identifier that can subsequently be used for API calls which require an authenticated user. You must supply either a username or an email address.

- [RegisterWithWindowsHello](https://docs.microsoft.com/rest/api/playfab/client/authentication/registerwithwindowshello?view=playfab-rest)
    Registers a new PlayFab user account using Windows Hello authentication, returning a session ticket that can subsequently be used for API calls which require an authenticated user

- [RemoveContactEmail](https://docs.microsoft.com/rest/api/playfab/client/account-management/removecontactemail?view=playfab-rest)
    Removes a contact email from the player's profile.

- [RemoveFriend](https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/removefriend?view=playfab-rest)
    Removes a specified user from the friend list of the local user.

- [RemoveGenericID](https://docs.microsoft.com/rest/api/playfab/client/account-management/removegenericid?view=playfab-rest)
    Removes the specified generic service identifier from the player's PlayFab account.

- [RemoveSharedGroupMembers](https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/removesharedgroupmembers?view=playfab-rest)
    Removes users from the set of those able to update the shared data and the set of users in the group. Only users in the group can remove members. If as a result of the call, zero users remain with access, the group and its associated data will be deleted. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data).

- [ReportAdActivity](https://docs.microsoft.com/rest/api/playfab/client/advertising/reportadactivity?view=playfab-rest)
    Report player's ad activity

- [ReportDeviceInfo](https://docs.microsoft.com/rest/api/playfab/client/analytics/reportdeviceinfo?view=playfab-rest)
    Write a PlayStream event to describe the provided player device information. This API method is not designed to be called directly by developers. Each PlayFab client SDK will eventually report this information automatically.

- [ReportPlayer](https://docs.microsoft.com/rest/api/playfab/client/account-management/reportplayer?view=playfab-rest)
    Submit a report for another player (due to bad bahavior, etc.), so that customer service representatives for the title can take action concerning potentially toxic players.

- [RestoreIOSPurchases](https://docs.microsoft.com/rest/api/playfab/client/platform-specific-methods/restoreiospurchases?view=playfab-rest)
    Restores all in-app purchases based on the given restore receipt

- [SetFriendTags](https://docs.microsoft.com/rest/api/playfab/client/friend-list-management/setfriendtags?view=playfab-rest)
    Updates the tag list for a specified user in the friend list of the local user.

- [SubtractUserVirtualCurrency](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/subtractuservirtualcurrency?view=playfab-rest)
    Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC balance negative with this API.

- [UnlinkAndroidDeviceID](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkandroiddeviceid?view=playfab-rest)
    Unlinks the related Android device identifier from the user's PlayFab account.

- [UnlinkCustomID](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkcustomid?view=playfab-rest)
    Unlinks the related custom identifier from the user's PlayFab account.

- [UnlinkFacebookAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookaccount?view=playfab-rest)
    Unlinks the related Facebook account from the user's PlayFab account.

- [UnlinkFacebookInstantGamesId](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkfacebookinstantgamesid?view=playfab-rest)
    Unlinks the related Facebook Instant Game Ids from the user's PlayFab account.

- [UnlinkGameCenterAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkgoogleaccount?view=playfab-rest)
    Unlinks the related Game Center account from the user's PlayFab account.

- [UnlinkGoogleAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkiosdeviceid?view=playfab-rest)
    Unlinks the related Google account from the user's PlayFab account (https://developers.google.com/android/reference/com/google/android/gms/auth/GoogleAuthUtil#public-methods).    

- [UnlinkIOSDeviceID](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkiosdeviceid?view=playfab-rest)
    Unlinks the related iOS device identifier from the user's PlayFab account.

- [UnlinkKongregate](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkkongregate?view=playfab-rest)
    Unlinks the related Kongregate identifier from the user's PlayFab account.

- [UnlinkNintendoSwitchDeviceId](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinknintendoswitchdeviceid?view=playfab-rest)
    Unlinks the related NintendoSwitchDeviceId from the user's PlayFab account.

- [UnlinkOpenIdConnect](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkopenidconnect?view=playfab-rest)
    Unlinks an OpenID Connect account from a user's PlayFab account, based on the connection ID of an existing relationship between a title and an Open ID Connect provider.

- [UnlinkPSNAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkpsnaccount?view=playfab-rest)
    Unlinks the related PSN account from the user's PlayFab account.

- [UnlinkSteamAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinksteamaccount?view=playfab-rest)
    Unlinks the related Steam account from the user's PlayFab account.

- [UnlinkTwitch](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinktwitch?view=playfab-rest)
    Unlinks the related Twitch account from the user's PlayFab account.

- [UnlinkWindowsHello](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkwindowshello?view=playfab-rest)
    Unlink Windows Hello authentication from the current PlayFab Account.

- [UnlinkXboxAccount](https://docs.microsoft.com/rest/api/playfab/client/account-management/unlinkxboxaccount?view=playfab-rest)
    Unlinks the related Xbox Live account from the user's PlayFab account.

- [UnlockContainerInstance](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontainerinstance?view=playfab-rest)
    Opens the specified container, with the specified key (when required), and returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.

- [UnlockContainerItem](https://docs.microsoft.com/rest/api/playfab/client/player-item-management/unlockcontaineritem?view=playfab-rest)
    Searches target inventory for an ItemInstance matching the given CatalogItemId, if necessary unlocks it using an appropriate key, and returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.

- [UpdateAvatarUrl](https://docs.microsoft.com/rest/api/playfab/client/account-management/updateavatarurl?view=playfab-rest)
    Update the avatar URL of the player.

- [UpdateCharacterData](https://docs.microsoft.com/rest/api/playfab/client/character-data/updatecharacterdata?view=playfab-rest)
    Creates and updates the title-specific custom data for the user's character which is readable and writable by the client

- [UpdateCharacterStatistics](https://docs.microsoft.com/rest/api/playfab/client/characters/updatecharacterstatistics?view=playfab-rest)
    Updates the values of the specified title-specific statistics for the specific character. By default, clients are not permitted to update statistics. Developers may override this setting in the Game Manager > Settings > API Features.

- [UpdatePlayerStatistics](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateplayerstatistics?view=playfab-rest)
    Updates the values of the specified title-specific statistics for the user. By default, clients are not permitted to update statistics. Developers may override this setting in the Game Manager > Settings > API Features.

- [UpdateSharedGroupData](https://docs.microsoft.com/rest/api/playfab/client/shared-group-data/updatesharedgroupdata?view=playfab-rest)
    Adds, updates, and removes data keys for a shared group object. If the permission is set to Public, all fields updated or added in this call will be readable by users not in the group. By default, data permissions are set to Private. Regardless of the permission setting, only members of the group can update the data. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data).

- [UpdateUserData](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserdata?view=playfab-rest)
Creates and updates the title-specific custom data for the user which is readable and writable by the client.

- [UpdateUserPublisherData](https://docs.microsoft.com/rest/api/playfab/client/player-data-management/updateuserpublisherdata?view=playfab-rest)
    Creates and updates the publisher-specific custom data for the user which is readable and writable by the client.

- [UpdateUserTitleDisplayName](https://docs.microsoft.com/rest/api/playfab/client/account-management/updateusertitledisplayname?view=playfab-rest)
    Updates the title specific display name for the user

## Data APIs

- [SetObjects](https://docs.microsoft.com/rest/api/playfab/data/object/setobjects?view=playfab-rest)
    Sets objects on an entity's profile.

## Groups APIs

- [AcceptGroupApplication](https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupapplication?view=playfab-rest)
    Accepts an outstanding invitation to to join a group

- [AcceptGroupInvitation](https://docs.microsoft.com/rest/api/playfab/groups/groups/acceptgroupinvitation?view=playfab-rest)
    Accepts an invitation to join a group.

- [AddMembers](https://docs.microsoft.com/rest/api/playfab/groups/groups/addmembers?view=playfab-rest)
    Adds members to a group or role.

- [ApplyToGroup](https://docs.microsoft.com/rest/api/playfab/groups/groups/applytogroup?view=playfab-rest)
    Applies to join a group.

- [BlockEntity](https://docs.microsoft.com/rest/api/playfab/groups/groups/blockentity?view=playfab-rest)
    Blocks a list of entities from joining a group.

- [ChangeMemberRole](https://docs.microsoft.com/rest/api/playfab/groups/groups/changememberrole?view=playfab-rest)
    Changes the role membership of a list of entities from one role to another.

- [CreateGroup](https://docs.microsoft.com/rest/api/playfab/groups/groups/creategroup?view=playfab-rest)
    Creates a new group.

- [CreateRole](https://docs.microsoft.com/rest/api/playfab/groups/groups/createrole?view=playfab-rest)
    Creates a new group role.

- [DeleteGroup](https://docs.microsoft.com/rest/api/playfab/groups/groups/deletegroup?view=playfab-rest)
    Deletes a group and all roles, invitations, join requests, and blocks associated with it.

- [DeleteRole](https://docs.microsoft.com/rest/api/playfab/groups/groups/deleterole?view=playfab-rest)
    Deletes an existing role in a group.

- [InviteToGroup](https://docs.microsoft.com/rest/api/playfab/groups/groups/invitetogroup?view=playfab-rest)
    Invites a player to join a group,

- [RemoveGroupApplication](https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupapplication?view=playfab-rest)
    Removes an application to join a group.

- [RemoveGroupInvitation](https://docs.microsoft.com/rest/api/playfab/groups/groups/removegroupinvitation?view=playfab-rest)
    Removes an invitation join a group.

- [RemoveMembers](https://docs.microsoft.com/rest/api/playfab/groups/groups/removemembers?view=playfab-rest)
    Removes members from a group.

- [UnblockEntity](https://docs.microsoft.com/rest/api/playfab/groups/groups/unblockentity?view=playfab-rest)
    Unblocks a list of entities from joining a group.

- [UpdateGroup](https://docs.microsoft.com/rest/api/playfab/groups/groups/updategroup?view=playfab-rest)
    Updates non-membership data about a group.

- [UpdateRole](https://docs.microsoft.com/rest/api/playfab/groups/groups/updaterole?view=playfab-rest)
    Updates metadata about a role.

## Profile APIs

- [SetGlobalPolicy](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setglobalpolicy?view=playfab-rest)
    Sets the global title access policy.

- [SetProfileLanguage](Uhttps://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilelanguage?view=playfab-rest)
    Updates the entity's language. The precedence hierarchy for communication to the player is Title Player Account language, Master Player Account language, and then title default language if the first two aren't set or supported.

- [SetProfilePolicy](https://docs.microsoft.com/rest/api/playfab/profiles/account-management/setprofilepolicy?view=playfab-rest)
    Sets the profiles access policy.

## Server APIs

- [AddCharacterVirtualCurrency](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/addcharactervirtualcurrency?view=playfab-rest)
    Increments the character's balance of the specified virtual currency by the stated amount.

- [AddFriend](https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/addfriend?view=playfab-rest)
    Adds the Friend user to the friendlist of the user with PlayFabId. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.

- [AddGenericID](https://docs.microsoft.com/rest/api/playfab/server/account-management/addgenericid?view=playfab-rest)
    Adds the specified generic service identifier to the player's PlayFab account. This is designed to allow for a PlayFab ID lookup of any arbitrary service identifier a title wants to add. This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other players.

- [AddPlayerTag](https://docs.microsoft.com/rest/api/playfab/server/playstream/addplayertag?view=playfab-rest)
    Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag.

- [AddSharedGroupMembers](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/addsharedgroupmembers?view=playfab-rest)
    Adds users to the set of those able to update both the shared data, as well as the set of users in the group. Only users in the group (and the server) can add new members. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data).

- [AddUserVirtualCurrency](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/adduservirtualcurrency?view=playfab-rest)
    Increments the user's balance of the specified virtual currency by the stated amount.

- [AwardSteamAchievement](https://docs.microsoft.com/rest/api/playfab/server/platform-specific-methods/awardsteamachievement?view=playfab-rest)
    Awards the specified users the specified Steam achievements.

- [BanUsers](https://docs.microsoft.com/rest/api/playfab/server/account-management/banusers?view=playfab-rest)
    Bans users by PlayFab ID with optional IP address, or MAC address for the provided game.

- [ConsumeItem](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/consumeitem?view=playfab-rest)
    Consume uses of a consumable item. When all uses are consumed, it will be removed from the player's inventory.

- [CreateSharedGroup](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/createsharedgroup?view=playfab-rest)
    Requests the creation of a shared group object, containing key/value pairs which may be updated by all members of the group. When created by a server, the group will initially have no members. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data).

- [DeleteCharacterFromUser](https://docs.microsoft.com/rest/api/playfab/server/characters/deletecharacterfromuser?view=playfab-rest)
    Deletes the specific character ID from the specified user.

- [DeleteSharedGroup](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/deletesharedgroup?view=playfab-rest)
    Deletes a shared group, freeing up the shared group ID to be reused for a new group. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data).

- [GrantCharacterToUser](https://docs.microsoft.com/rest/api/playfab/server/characters/grantcharactertouser?view=playfab-rest)
    Grants the specified character type to the user. CharacterIds are not globally unique; characterId must be evaluated with the parent PlayFabId to guarantee uniqueness.

- [GrantItemsToCharacter](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstocharacter?view=playfab-rest)
    Adds the specified items to the specified character's inventory.

- [GrantItemsToUser](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstouser?view=playfab-rest)
    Adds the specified items to the specified user's inventory.

- [GrantItemsToUsers](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/grantitemstousers?view=playfab-rest)
    Adds the specified items to the specified user inventories,

- [LinkServerCustomId](https://docs.microsoft.com/rest/api/playfab/server/account-management/linkservercustomid?view=playfab-rest)
    Links the custom server identifier, generated by the title, to the user's PlayFab account.

- [LinkXboxAccount](https://docs.microsoft.com/rest/api/playfab/server/account-management/linkxboxaccount?view=playfab-rest)
    Links the Xbox Live account associated with the provided access code to the user's PlayFab account.

- [ModifyItemUses](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/modifyitemuses?view=playfab-rest)
    Modifies the number of remaining uses of a player's inventory item.

- [MoveItemToCharacterFromCharacter](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromcharacter?view=playfab-rest)
    Moves an item from a character's inventory into another of the users's character's inventory.

- [MoveItemToCharacterFromUser](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtocharacterfromuser?view=playfab-rest)
    Moves an item from a user's inventory into their character's inventory.

- [MoveItemToUserFromCharacter](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/moveitemtouserfromcharacter?view=playfab-rest)
    Moves an item from a character's inventory into the owning user's inventory.

- [NotifyMatchmakerPlayerLeft](https://docs.microsoft.com/rest/api/playfab/server/matchmaking/notifymatchmakerplayerleft?view=playfab-rest)
    Informs the PlayFab match-making service that the user specified has left the Game Server Instance.

- [RedeemCoupon](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/redeemcoupon?view=playfab-rest)
    Adds the virtual goods associated with the coupon to the user's inventory. Coupons can be generated via the Economy->Catalogs tab in the PlayFab Game Manager.

- [RedeemMatchmakerTicket](https://docs.microsoft.com/rest/api/playfab/server/matchmaking/redeemmatchmakerticket?view=playfab-rest)
    Validates a Game Server session ticket and returns details about the user.

- [RemoveFriend](https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/removefriend?view=playfab-rest)
    Removes the specified friend from the user's friend list.

- [RemoveGenericID](https://docs.microsoft.com/rest/api/playfab/server/account-management/removegenericid?view=playfab-rest)
    Removes the specified generic service identifier from the player's PlayFab account.

- [RemovePlayerTag](https://docs.microsoft.com/rest/api/playfab/server/playstream/removeplayertag?view=playfab-rest)
    Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag.

- [RemoveSharedGroupMembers](https://docs.microsoft.com/rest/api/playfab/server/shared-group-data/removesharedgroupmembers?view=playfab-rest)
    Removes users from the set of those able to update the shared data and the set of users in the group. Only users in the group can remove members. If as a result of the call, zero users remain with access, the group and its associated data will be deleted. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](https://docs.microsoft.com/gaming/playfab/features/social/groups/using-shared-group-data).

- [RevokeAllBansForUser](https://docs.microsoft.com/rest/api/playfab/server/account-management/revokeallbansforuser?view=playfab-rest)
    Revoke all active bans for a user.

- [RevokeBans](https://docs.microsoft.com/rest/api/playfab/server/account-management/revokebans?view=playfab-rest)
    Revoke all active bans specified with BanId.

- [RevokeInventoryItem](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitem?view=playfab-rest)
    Revokes access to an item in a user's inventory.    

- [RevokeInventoryItems](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/revokeinventoryitems?view=playfab-rest)
    Revokes access for up to 25 items across multiple users and characters.

- [SetFriendTags](https://docs.microsoft.com/rest/api/playfab/server/friend-list-management/setfriendtags?view=playfab-rest)
    Updates the tag list for a specified user in the friend list of another user.

- [SetPlayerSecret](https://docs.microsoft.com/rest/api/playfab/server/authentication/setplayersecret?view=playfab-rest)
    Sets the player's secret if it is not already set. Player secrets are used to sign API requests. To reset a player's secret use the Admin or Server API method SetPlayerSecret.

- [SetPublisherData](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/setpublisherdata?view=playfab-rest)
    Updates the key-value store of custom publisher settings.

- [SetTitleData](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitledata?view=playfab-rest)
    https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/setpublisherdata?view=playfab-rest

- [SetTitleInternalData](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/settitleinternaldata?view=playfab-rest)
    Updates the key-value store of custom title settings

- [SubtractCharacterVirtualCurrency](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractcharactervirtualcurrency?view=playfab-rest)
    Decrements the character's balance of the specified virtual currency by the stated amount. It is possible to make a VC balance negative with this API.

- [SubtractUserVirtualCurrency](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/subtractuservirtualcurrency?view=playfab-rest)
    Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC balance negative with this API.

- [UnlinkServerCustomId](https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkservercustomid?view=playfab-rest)
    Unlinks the custom server identifier from the user's PlayFab account.

- [UnlinkXboxAccount](https://docs.microsoft.com/rest/api/playfab/server/account-management/unlinkxboxaccount?view=playfab-rest)
    Unlinks the related Xbox Live account from the user's PlayFab account.

- [UnlockContainerInstance](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/unlockcontainerinstance?view=playfab-rest)
    Opens a specific container (ContainerItemInstanceId), with a specific key (KeyItemInstanceId, when required), and returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.

- [UnlockContainerItem](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/unlockcontaineritem?view=playfab-rest)
    Searches Player or Character inventory for any ItemInstance matching the given CatalogItemId, if necessary unlocks it using any appropriate key, and returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.

- [UpdateAvatarUrl](https://docs.microsoft.com/rest/api/playfab/server/account-management/updateavatarurl?view=playfab-rest)
    Update the avatar URL of the specified player.

- [UpdateBans](https://docs.microsoft.com/rest/api/playfab/server/account-management/updatebans?view=playfab-rest)
    Updates information of a list of existing bans specified with Ban Ids.

- [UpdateCharacterData](https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterdata?view=playfab-rest)
    Updates the title-specific custom data for the user's character which is readable and writable by the client.

- [UpdateCharacterInternalData](https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterinternaldata?view=playfab-rest)
    Updates the title-specific custom data for the user's character which cannot be accessed by the client.

- [UpdateCharacterReadOnlyData](https://docs.microsoft.com/rest/api/playfab/server/character-data/updatecharacterreadonlydata?view=playfab-rest)
    Updates the title-specific custom data for the user's character which can only be read by the client.

- [UpdateCharacterStatistics](https://docs.microsoft.com/rest/api/playfab/server/characters/updatecharacterstatistics?view=playfab-rest)
    Updates the values of the specified title-specific statistics for the specific character.

- [UpdatePlayerStatistics](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateplayerstatistics?view=playfab-rest)
    Updates the values of the specified title-specific statistics for the user.

- [UpdateUserData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserdata?view=playfab-rest)
    Updates the title-specific custom data for the user which is readable and writable by the client.

- [UpdateUserInternalData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserinternaldata?view=playfab-rest)
    Updates the title-specific custom data for the user which cannot be accessed by the client.

- [UpdateUserInventoryItemCustomData](https://docs.microsoft.com/rest/api/playfab/server/player-item-management/updateuserinventoryitemcustomdata?view=playfab-rest)
    Updates the key-value pair data tagged to the specified item, which is read-only from the client.

- [UpdateUserPublisherData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherdata?view=playfab-rest)
    Updates the publisher-specific custom data for the user which is readable and writable by the client.

- [UpdateUserPublisherInternalData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherinternaldata?view=playfab-rest)
    Updates the publisher-specific custom data for the user which cannot be accessed by the client.

- [UpdateUserPublisherReadOnlyData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserpublisherreadonlydata?view=playfab-rest)
    Updates the publisher-specific custom data for the user which can only be read by the client.

- [UpdateUserReadOnlyData](https://docs.microsoft.com/rest/api/playfab/server/player-data-management/updateuserreadonlydata?view=playfab-rest)
    Updates the title-specific custom data for the user which can only be read by the client.
