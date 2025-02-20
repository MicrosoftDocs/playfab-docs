---
title: Profile Writes Meter API Description
author: joannaleecy
description: This file details the APIs that cause profile writes meter to increment.
ms.author: joanlee
ms.date: 11/04/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Profile Writes

Profile includes any data stored related to the player profile, entity profile, character profile, groups, and inventory. Profile data is information that applies to an individual player, group of players, or items, and is stored as Key/Value Pairs (KVPs) by PlayFab. 

The following APIs cause the Profile writes meter to increment.


## Admin APIs

- [AddPlayerTag](/rest/api/playfab/admin/playstream/addplayertag?)
    Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag.

- [AddUserVirtualCurrency](/rest/api/playfab/admin/player-item-management/adduservirtualcurrency?)
    Increments the specified virtual currency by the stated amount

- [AddVirtualCurrencyTypes](/rest/api/playfab/admin/title-wide-data-management/addvirtualcurrencytypes?)
    Adds one or more virtual currencies to the set defined for the title. Virtual Currencies have a maximum value of 2,147,483,647 when granted to a player. Any value over that will be discarded.

- [BanUsers](/rest/api/playfab/admin/account-management/banusers?)
    Bans users by PlayFab ID with optional IP address, or MAC address for the provided game.

- [CreateActionsOnPlayersInSegmentTask](/rest/api/playfab/admin/scheduledtask/createactionsonplayersinsegmenttask?)
    Create an ActionsOnPlayersInSegment task, which iterates through all players in a segment to execute action.

- [CreatePlayerSharedSecret](/rest/api/playfab/admin/authentication/createplayersharedsecret?)
    Creates a new Player Shared Secret Key. It may take up to 5 minutes for this key to become generally available after this API returns.

- [CreatePlayerStatisticDefinition](/rest/api/playfab/admin/player-data-management/createplayerstatisticdefinition?)
    Adds a new player statistic configuration to the title, optionally allowing the developer to specify a reset interval and an aggregation method.

- [DeleteMasterPlayerAccount](/rest/api/playfab/admin/account-management/deletemasterplayeraccount?)
    Removes a master player account entirely from all titles and deletes all associated data.

- [DeletePlayer](/rest/api/playfab/admin/account-management/deleteplayer?)
    Removes a user's player account from a title and deletes all associated data

- [DeletePlayerSharedSecret](/rest/api/playfab/admin/authentication/deleteplayersharedsecret?)
    Deletes an existing Player Shared Secret Key. It may take up to 5 minutes for this delete to be reflected after this API returns.

- [DeleteStore](/rest/api/playfab/admin/title-wide-data-management/deletestore?)
    Deletes an existing virtual item store.

- [DeleteTitle](/rest/api/playfab/admin/account-management/deletetitle?)
    Permanently deletes a title and all associated configuration.

- [GrantItemsToUsers](/rest/api/playfab/admin/player-item-management/grantitemstousers?)
    Adds the specified items to the specified user inventories

- [IncrementLimitedEditionItemAvailability](/rest/api/playfab/admin/player-item-management/incrementlimitededitionitemavailability?)
    Increases the global count for the given scarce resource.

- [IncrementPlayerStatisticVersion](/rest/api/playfab/admin/player-data-management/incrementplayerstatisticversion?)
    Resets the indicated statistic, removing all player entries for it and backing up the old values.

- [RefundPurchase](/rest/api/playfab/admin/player-data-management/refundpurchase?)
    Attempts to process an order refund through the origin'l real money payment provider.""

- [RemovePlayerTag](/rest/api/playfab/admin/playstream/removeplayertag?)
    Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag.

- [RemoveVirtualCurrencyTypes](/rest/api/playfab/admin/title-wide-data-management/removevirtualcurrencytypes?)
    Removes one or more virtual currencies from the set defined for the title.

- [ResetCharacterStatistics](/rest/api/playfab/admin/characters/resetcharacterstatistics?)
    Completely removes all statistics for the specified character, for the current game.

- [ResetUserStatistics](/rest/api/playfab/admin/player-data-management/resetuserstatistics?)
    Completely removes all statistics for the specified user, for the current game.

- [ResolvePurchaseDispute](/rest/api/playfab/admin/player-data-management/resolvepurchasedispute?)
    Attempts to resolve a dispute with the original order's payment provider.
    
- [RevokeAllBansForUser](/rest/api/playfab/admin/account-management/revokeallbansforuser?)
    Revoke all active bans for a user.

- [RevokeBans](/rest/api/playfab/admin/account-management/revokebans?)
    Revoke all active bans specified with BanId.

- [RevokeInventoryItem](/rest/api/playfab/admin/player-item-management/revokeinventoryitem?)
    Revokes access to an item in a user's inventory

- [RevokeInventoryItems](/rest/api/playfab/admin/player-item-management/revokeinventoryitems?)
    Revokes access for up to 25 items across multiple users and characters.

- [SetCatalogItems](/rest/api/playfab/admin/title-wide-data-management/setcatalogitems?)
    Creates the catalog configuration of all virtual goods for the specified catalog version.

- [SetPlayerSecret](/rest/api/playfab/admin/authentication/setplayersecret?)
    Sets or resets the player's secret. Player secrets are used to sign API requests.

- [SetPublishedRevision](/rest/api/playfab/admin/server-side-cloud-script/setpublishedrevision?)
    Sets the currently published revision of a title Cloud Script.
    
- [SetPublisherData](/rest/api/playfab/admin/shared-group-data/setpublisherdata?)
    Updates the key-value store of custom publisher settings

- [SetStoreItems](/rest/api/playfab/admin/title-wide-data-management/setstoreitems?)
    Sets all the items in one virtual store.

- [SetTitleData](/rest/api/playfab/admin/title-wide-data-management/settitledata?)
    Creates and updates the key-value store of custom title settings which can be read by the client.

- [SetTitleInternalData](/rest/api/playfab/admin/title-wide-data-management/settitleinternaldata?)
    Updates the key-value store of custom title settings which cannot be read by the client.

- [SubtractUserVirtualCurrency](/rest/api/playfab/admin/player-item-management/subtractuservirtualcurrency?)
    Decrements the specified virtual currency by the stated amount.

- [UpdateBans](/rest/api/playfab/admin/account-management/updatebans?)
    Updates information of a list of existing bans specified with Ban Ids.

- [UpdateCatalogItems](/rest/api/playfab/admin/title-wide-data-management/updatecatalogitems?)
    Updates the catalog configuration for virtual goods in the specified catalog version.

- [UpdatePlayerSharedSecret](/rest/api/playfab/admin/authentication/updateplayersharedsecret?)
    Updates a existing Player Shared Secret Key. It may take up to 5 minutes for this update to become generally available after this API returns.

- [UpdatePlayerStatisticDefinition](/rest/api/playfab/admin/player-data-management/updateplayerstatisticdefinition?)
    Updates a player statistic configuration for the title, optionally allowing the developer to specify a reset interval.

- [UpdateRandomResultTables](/rest/api/playfab/admin/title-wide-data-management/updaterandomresulttables?)
    Updates the random drop table configuration for the title

- [UpdateStoreItems](/rest/api/playfab/admin/title-wide-data-management/updatestoreitems?)
    Updates an existing virtual item store with new or modified items.

- [UpdateUserData](/rest/api/playfab/admin/player-data-management/updateuserdata?)
    Updates the title-specific custom data for the user which is readable and writable by the client.

- [UpdateUserInternalData](/rest/api/playfab/admin/player-data-management/updateuserinternaldata?)
    Updates the title-specific custom data for the user which cannot be accessed by the client.

- [UpdateUserPublisherData](/rest/api/playfab/admin/player-data-management/updateuserpublisherdata?)
    Updates the publisher-specific custom data for the user which is readable and writable by the client.

- [UpdateUserPublisherInternalData](/rest/api/playfab/admin/player-data-management/updateuserpublisherinternaldata?)
    Updates the publisher-specific custom data for the user which cannot be accessed by the client.

- [UpdateUserPublisherReadOnlyData](/rest/api/playfab/admin/player-data-management/updateuserpublisherreadonlydata?)
    Updates the publisher-specific custom data for the user which can only be read by the client.

- [UpdateUserReadOnlyData](/rest/api/playfab/admin/player-data-management/updateuserreadonlydata?)
    Updates the title-specific custom data for the user which can only be read by the client.

- [UpdateUserTitleDisplayName](/rest/api/playfab/admin/account-management/updateusertitledisplayname?)
    Updates the title specific display name for a user.

## Client APIs

- [AcceptTrade](/rest/api/playfab/client/trading/accepttrade?)
    Accepts an open trade (one that has not yet been accepted or cancelled), if the locally signed-in player is in the allowed player list for the trade, or it is open to all players. If the call is successful, the offered and accepted items will be swapped between the two players' inventories.

- [AddFriend](/rest/api/playfab/client/friend-list-management/addfriend?)
    Adds the PlayFab user, based upon a match against a supplied unique identifier, to the friend list of the local user. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.

- [AddGenericID](/rest/api/playfab/server/account-management/addgenericid?)
    Adds the specified generic service identifier to the player's PlayFab account. This is designed to allow for a PlayFab ID lookup of any arbitrary service identifier a title wants to add. This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other players.

- [AddOrUpdateContactEmail](/rest/api/playfab/client/account-management/addorupdatecontactemail?)
    Adds or updates a contact email to the player's profile.

- [AddSharedGroupMembers](/rest/api/playfab/server/shared-group-data/addsharedgroupmembers?)
    Adds users to the set of those able to update both the shared data, as well as the set of users in the group. Only users in the group (and the server) can add new members. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](/gaming/playfab/features/social/groups/using-shared-group-data).

- [AddUsernamePassword](/rest/api/playfab/client/account-management/addusernamepassword?)
    Adds playfab username/password auth to an existing account created via an anonymous auth method, e.g. automatic device ID login.

- [AndroidDevicePushNotificationRegistration](/rest/api/playfab/client/platform-specific-methods/androiddevicepushnotificationregistration?)
    Registers the Android device to receive push notifications

- [ConsumePSNEntitlements](/rest/api/playfab/client/platform-specific-methods/consumepsnentitlements?)
    Checks for any new consumable entitlements. If any are found, they are consumed and added as PlayFab items.

- [ConsumeXboxEntitlements](/rest/api/playfab/client/platform-specific-methods/consumexboxentitlements?)
    Grants the player's current entitlements from Xbox Live, consuming all availble items in Xbox and granting them to the player's PlayFab inventory. This call is idempotent and will not grant previously granted items to the player.

- [CreateSharedGroup](/rest/api/playfab/client/shared-group-data/createsharedgroup?)
    Requests the creation of a shared group object, containing key/value pairs which may be updated by all members of the group. Upon creation, the current user will be the only member of the group. Shared Groups are designed for sharing data between a very small number of players. For more info, see [Using Shared Group Data](/gaming/playfab/features/social/groups/using-shared-group-data).

- [GrantCharacterToUser](/rest/api/playfab/client/characters/grantcharactertouser?)
    Grants the specified character type to the user. CharacterIds are not globally unique; characterId must be evaluated with the parent PlayFabId to guarantee uniqueness.

- [LinkAndroidDeviceID](/rest/api/playfab/client/account-management/linkandroiddeviceid?)
    Links the Android device identifier to the user's PlayFab account

- [LinkCustomID](/rest/api/playfab/client/account-management/linkcustomid?)
    Links the custom identifier, generated by the title, to the user's PlayFab account.

- [LinkFacebookAccount](/rest/api/playfab/client/account-management/linkfacebookaccount?)
    Links the Facebook account associated with the provided Facebook access token to the user's PlayFab account.

- [LinkFacebookInstantGamesId](/rest/api/playfab/client/account-management/linkfacebookinstantgamesid?)
    Links the Facebook Instant Games Id to the user's PlayFab account.

- [LinkGameCenterAccount](/rest/api/playfab/client/account-management/linkgamecenteraccount?)
    Links the Game Center account associated with the provided Game Center ID to the user's PlayFab account.

- [LinkGoogleAccount](/rest/api/playfab/client/account-management/linkgoogleaccount?)
    Links the currently signed-in user account to their Google account, using their Google account credentials.

- [LinkIOSDeviceID](/rest/api/playfab/client/account-management/linkiosdeviceid?)
    Links the vendor-specific iOS device identifier to the user's PlayFab account.

- [LinkKongregate](/rest/api/playfab/client/account-management/linkkongregate?)
    Links the Kongregate identifier to the user's PlayFab account.

- [LinkNintendoSwitchDeviceId](/rest/api/playfab/client/account-management/linknintendoswitchdeviceid?)
    Links the NintendoSwitchDeviceId to the user's PlayFab account.

- [LinkOpenIdConnect](/rest/api/playfab/client/account-management/linkopenidconnect?)
    Links an OpenID Connect account to a user's PlayFab account, based on an existing relationship between a title and an Open ID Connect provider and the OpenId Connect JWT from that provider.

- [LinkPSNAccount](/rest/api/playfab/client/account-management/linkpsnaccount?)
    Links the PlayStation&#8482;Network account associated with the provided access code to the user's PlayFab account.

- [LinkSteamAccount](/rest/api/playfab/client/account-management/linksteamaccount?)
    Links the Steam account associated with the provided Steam authentication ticket to the user's PlayFab account.

- [LinkTwitch](/rest/api/playfab/client/account-management/linktwitch?)
    Links the Twitch account associated with the token to the user's PlayFab account.

- [LinkWindowsHello](/rest/api/playfab/client/account-management/linkwindowshello?)
    Link Windows Hello authentication to the current PlayFab Account.

- [LinkXboxAccount](/rest/api/playfab/client/account-management/linkxboxaccount?)
    Links the Xbox Live account associated with the provided access code to the user's PlayFab account.

- [OpenTrade](/rest/api/playfab/client/trading/opentrade?)
    Opens a new outstanding trade. Note that a given item instance may only be in one open trade at a time.

- [PurchaseItem](/rest/api/playfab/client/player-item-management/purchaseitem?)
    Buys a single item with virtual currency. You must specify both the virtual currency to use to purchase, as well as what the client believes the price to be. This lets the server fail the purchase if the price has changed.

- [PayForPurchase](/rest/api/playfab/client/player-item-management/payforpurchase?)
    Selects a payment option for purchase order created via StartPurchase

- [RegisterForIOSPushNotification](/rest/api/playfab/client/platform-specific-methods/registerforiospushnotification?)
    Registers the iOS device to receive push notifications

- [RegisterPlayFabUser](/rest/api/playfab/client/authentication/registerplayfabuser?)
    Registers a new Playfab user account, returning a session identifier that can subsequently be used for API calls which require an authenticated user. You must supply either a username or an email address.

- [RegisterWithWindowsHello](/rest/api/playfab/client/authentication/registerwithwindowshello?)
    Registers a new PlayFab user account using Windows Hello authentication, returning a session ticket that can subsequently be used for API calls which require an authenticated user

- [RemoveContactEmail](/rest/api/playfab/client/account-management/removecontactemail?)
    Removes a contact email from the player's profile.

- [RemoveFriend](/rest/api/playfab/client/friend-list-management/removefriend?)
    Removes a specified user from the friend list of the local user.

- [RemoveGenericID](/rest/api/playfab/client/account-management/removegenericid?)
    Removes the specified generic service identifier from the player's PlayFab account.

- [RemoveSharedGroupMembers](/rest/api/playfab/client/shared-group-data/removesharedgroupmembers?)
    Removes users from the set of those able to update the shared data and the set of users in the group. Only users in the group can remove members. If as a result of the call, zero users remain with access, the group and its associated data will be deleted. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](/gaming/playfab/features/social/groups/using-shared-group-data).

- [ReportAdActivity](/rest/api/playfab/client/advertising/reportadactivity?)
    Report player's ad activity

- [ReportDeviceInfo](/rest/api/playfab/client/analytics/reportdeviceinfo?)
    Write a PlayStream event to describe the provided player device information. This API method is not designed to be called directly by developers. Each PlayFab client SDK will eventually report this information automatically.

- [ReportPlayer](/rest/api/playfab/client/account-management/reportplayer?)
    Submit a report for another player (due to bad bahavior, etc.), so that customer service representatives for the title can take action concerning potentially toxic players.

- [RestoreIOSPurchases](/rest/api/playfab/client/platform-specific-methods/restoreiospurchases?)
    Restores all in-app purchases based on the given restore receipt

- [SetFriendTags](/rest/api/playfab/client/friend-list-management/setfriendtags?)
    Updates the tag list for a specified user in the friend list of the local user.

- [SubtractUserVirtualCurrency](/rest/api/playfab/client/player-item-management/subtractuservirtualcurrency?)
    Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC balance negative with this API.

- [UnlinkAndroidDeviceID](/rest/api/playfab/client/account-management/unlinkandroiddeviceid?)
    Unlinks the related Android device identifier from the user's PlayFab account.

- [UnlinkCustomID](/rest/api/playfab/client/account-management/unlinkcustomid?)
    Unlinks the related custom identifier from the user's PlayFab account.

- [UnlinkFacebookAccount](/rest/api/playfab/client/account-management/unlinkfacebookaccount?)
    Unlinks the related Facebook account from the user's PlayFab account.

- [UnlinkFacebookInstantGamesId](/rest/api/playfab/client/account-management/unlinkfacebookinstantgamesid?)
    Unlinks the related Facebook Instant Game Ids from the user's PlayFab account.

- [UnlinkGameCenterAccount](/rest/api/playfab/client/account-management/unlinkgoogleaccount?)
    Unlinks the related Game Center account from the user's PlayFab account.

- [UnlinkGoogleAccount](/rest/api/playfab/client/account-management/unlinkiosdeviceid?)
    Unlinks the related Google account from the user's PlayFab account (https://developers.google.com/android/reference/com/google/android/gms/auth/GoogleAuthUtil#public-methods).    

- [UnlinkIOSDeviceID](/rest/api/playfab/client/account-management/unlinkiosdeviceid?)
    Unlinks the related iOS device identifier from the user's PlayFab account.

- [UnlinkKongregate](/rest/api/playfab/client/account-management/unlinkkongregate?)
    Unlinks the related Kongregate identifier from the user's PlayFab account.

- [UnlinkNintendoSwitchDeviceId](/rest/api/playfab/client/account-management/unlinknintendoswitchdeviceid?)
    Unlinks the related NintendoSwitchDeviceId from the user's PlayFab account.

- [UnlinkOpenIdConnect](/rest/api/playfab/client/account-management/unlinkopenidconnect?)
    Unlinks an OpenID Connect account from a user's PlayFab account, based on the connection ID of an existing relationship between a title and an Open ID Connect provider.

- [UnlinkPSNAccount](/rest/api/playfab/client/account-management/unlinkpsnaccount?)
    Unlinks the related PSN&#8482; account from the user's PlayFab account.

- [UnlinkSteamAccount](/rest/api/playfab/client/account-management/unlinksteamaccount?)
    Unlinks the related Steam account from the user's PlayFab account.

- [UnlinkTwitch](/rest/api/playfab/client/account-management/unlinktwitch?)
    Unlinks the related Twitch account from the user's PlayFab account.

- [UnlinkWindowsHello](/rest/api/playfab/client/account-management/unlinkwindowshello?)
    Unlink Windows Hello authentication from the current PlayFab Account.

- [UnlinkXboxAccount](/rest/api/playfab/client/account-management/unlinkxboxaccount?)
    Unlinks the related Xbox Live account from the user's PlayFab account.

- [UnlockContainerInstance](/rest/api/playfab/client/player-item-management/unlockcontainerinstance?)
    Opens the specified container, with the specified key (when required), and returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.

- [UnlockContainerItem](/rest/api/playfab/client/player-item-management/unlockcontaineritem?)
    Searches target inventory for an ItemInstance matching the given CatalogItemId, if necessary unlocks it using an appropriate key, and returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.

- [UpdateAvatarUrl](/rest/api/playfab/client/account-management/updateavatarurl?)
    Update the avatar URL of the player.

- [UpdateCharacterData](/rest/api/playfab/client/character-data/updatecharacterdata?)
    Creates and updates the title-specific custom data for the user's character which is readable and writable by the client

- [UpdateCharacterStatistics](/rest/api/playfab/client/characters/updatecharacterstatistics?)
    Updates the values of the specified title-specific statistics for the specific character. By default, clients are not permitted to update statistics. Developers may override this setting in the Game Manager > Settings > API Features.

- [UpdatePlayerStatistics](/rest/api/playfab/client/player-data-management/updateplayerstatistics?)
    Updates the values of the specified title-specific statistics for the user. By default, clients are not permitted to update statistics. Developers may override this setting in the Game Manager > Settings > API Features.

- [UpdateSharedGroupData](/rest/api/playfab/client/shared-group-data/updatesharedgroupdata?)
    Adds, updates, and removes data keys for a shared group object. If the permission is set to Public, all fields updated or added in this call will be readable by users not in the group. By default, data permissions are set to Private. Regardless of the permission setting, only members of the group can update the data. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](/gaming/playfab/features/social/groups/using-shared-group-data).

- [UpdateUserData](/rest/api/playfab/client/player-data-management/updateuserdata?)
Creates and updates the title-specific custom data for the user which is readable and writable by the client.

- [UpdateUserPublisherData](/rest/api/playfab/client/player-data-management/updateuserpublisherdata?)
    Creates and updates the publisher-specific custom data for the user which is readable and writable by the client.

- [UpdateUserTitleDisplayName](/rest/api/playfab/client/account-management/updateusertitledisplayname?)
    Updates the title specific display name for the user

"PlayStation" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PSN" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## Data APIs

- [SetObjects](/rest/api/playfab/data/object/setobjects?)
    Sets objects on an entity's profile.

## Groups APIs

- [AcceptGroupApplication](/rest/api/playfab/groups/groups/acceptgroupapplication?)
    Accepts an outstanding invitation to to join a group

- [AcceptGroupInvitation](/rest/api/playfab/groups/groups/acceptgroupinvitation?)
    Accepts an invitation to join a group.

- [AddMembers](/rest/api/playfab/groups/groups/addmembers?)
    Adds members to a group or role.

- [ApplyToGroup](/rest/api/playfab/groups/groups/applytogroup?)
    Applies to join a group.

- [BlockEntity](/rest/api/playfab/groups/groups/blockentity?)
    Blocks a list of entities from joining a group.

- [ChangeMemberRole](/rest/api/playfab/groups/groups/changememberrole?)
    Changes the role membership of a list of entities from one role to another.

- [CreateGroup](/rest/api/playfab/groups/groups/creategroup?)
    Creates a new group.

- [CreateRole](/rest/api/playfab/groups/groups/createrole?)
    Creates a new group role.

- [DeleteGroup](/rest/api/playfab/groups/groups/deletegroup?)
    Deletes a group and all roles, invitations, join requests, and blocks associated with it.

- [DeleteRole](/rest/api/playfab/groups/groups/deleterole?)
    Deletes an existing role in a group.

- [InviteToGroup](/rest/api/playfab/groups/groups/invitetogroup?)
    Invites a player to join a group,

- [RemoveGroupApplication](/rest/api/playfab/groups/groups/removegroupapplication?)
    Removes an application to join a group.

- [RemoveGroupInvitation](/rest/api/playfab/groups/groups/removegroupinvitation?)
    Removes an invitation join a group.

- [RemoveMembers](/rest/api/playfab/groups/groups/removemembers?)
    Removes members from a group.

- [UnblockEntity](/rest/api/playfab/groups/groups/unblockentity?)
    Unblocks a list of entities from joining a group.

- [UpdateGroup](/rest/api/playfab/groups/groups/updategroup?)
    Updates non-membership data about a group.

- [UpdateRole](/rest/api/playfab/groups/groups/updaterole?)
    Updates metadata about a role.

## Profile APIs

- [SetGlobalPolicy](/rest/api/playfab/profiles/account-management/setglobalpolicy?)
    Sets the global title access policy.

- [SetProfileLanguage](/rest/api/playfab/profiles/account-management/setprofilelanguage?)
    Updates the entity's language. The precedence hierarchy for communication to the player is Title Player Account language, Master Player Account language, and then title default language if the first two aren't set or supported.

- [SetProfilePolicy](/rest/api/playfab/profiles/account-management/setprofilepolicy?)
    Sets the profiles access policy.

## Server APIs

- [AddCharacterVirtualCurrency](/rest/api/playfab/server/player-item-management/addcharactervirtualcurrency?)
    Increments the character's balance of the specified virtual currency by the stated amount.

- [AddFriend](/rest/api/playfab/server/friend-list-management/addfriend?)
    Adds the Friend user to the friendlist of the user with PlayFabId. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.

- [AddGenericID](/rest/api/playfab/server/account-management/addgenericid?)
    Adds the specified generic service identifier to the player's PlayFab account. This is designed to allow for a PlayFab ID lookup of any arbitrary service identifier a title wants to add. This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other players.

- [AddPlayerTag](/rest/api/playfab/server/playstream/addplayertag?)
    Adds a given tag to a player profile. The tag's namespace is automatically generated based on the source of the tag.

- [AddSharedGroupMembers](/rest/api/playfab/server/shared-group-data/addsharedgroupmembers?)
    Adds users to the set of those able to update both the shared data, as well as the set of users in the group. Only users in the group (and the server) can add new members. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](/gaming/playfab/features/social/groups/using-shared-group-data).

- [AddUserVirtualCurrency](/rest/api/playfab/server/player-item-management/adduservirtualcurrency?)
    Increments the user's balance of the specified virtual currency by the stated amount.

- [AwardSteamAchievement](/rest/api/playfab/server/platform-specific-methods/awardsteamachievement?)
    Awards the specified users the specified Steam achievements.

- [BanUsers](/rest/api/playfab/server/account-management/banusers?)
    Bans users by PlayFab ID with optional IP address, or MAC address for the provided game.

- [ConsumeItem](/rest/api/playfab/server/player-item-management/consumeitem?)
    Consume uses of a consumable item. When all uses are consumed, it will be removed from the player's inventory.

- [CreateSharedGroup](/rest/api/playfab/server/shared-group-data/createsharedgroup?)
    Requests the creation of a shared group object, containing key/value pairs which may be updated by all members of the group. When created by a server, the group will initially have no members. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](/gaming/playfab/features/social/groups/using-shared-group-data).

- [DeleteCharacterFromUser](/rest/api/playfab/server/characters/deletecharacterfromuser?)
    Deletes the specific character ID from the specified user.

- [DeleteSharedGroup](/rest/api/playfab/server/shared-group-data/deletesharedgroup?)
    Deletes a shared group, freeing up the shared group ID to be reused for a new group. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](/gaming/playfab/features/social/groups/using-shared-group-data).

- [GrantCharacterToUser](/rest/api/playfab/server/characters/grantcharactertouser?)
    Grants the specified character type to the user. CharacterIds are not globally unique; characterId must be evaluated with the parent PlayFabId to guarantee uniqueness.

- [GrantItemsToCharacter](/rest/api/playfab/server/player-item-management/grantitemstocharacter?)
    Adds the specified items to the specified character's inventory.

- [GrantItemsToUser](/rest/api/playfab/server/player-item-management/grantitemstouser?)
    Adds the specified items to the specified user's inventory.

- [GrantItemsToUsers](/rest/api/playfab/server/player-item-management/grantitemstousers?)
    Adds the specified items to the specified user inventories,

- [LinkServerCustomId](/rest/api/playfab/server/account-management/linkservercustomid?)
    Links the custom server identifier, generated by the title, to the user's PlayFab account.

- [LinkXboxAccount](/rest/api/playfab/server/account-management/linkxboxaccount?)
    Links the Xbox Live account associated with the provided access code to the user's PlayFab account.

- [ModifyItemUses](/rest/api/playfab/server/player-item-management/modifyitemuses?)
    Modifies the number of remaining uses of a player's inventory item.

- [MoveItemToCharacterFromCharacter](/rest/api/playfab/server/player-item-management/moveitemtocharacterfromcharacter?)
    Moves an item from a character's inventory into another of the users's character's inventory.

- [MoveItemToCharacterFromUser](/rest/api/playfab/server/player-item-management/moveitemtocharacterfromuser?)
    Moves an item from a user's inventory into their character's inventory.

- [MoveItemToUserFromCharacter](/rest/api/playfab/server/player-item-management/moveitemtouserfromcharacter?)
    Moves an item from a character's inventory into the owning user's inventory.

- [RedeemCoupon](/rest/api/playfab/server/player-item-management/redeemcoupon?)
    Adds the virtual goods associated with the coupon to the user's inventory. Coupons can be generated via the Economy->Catalogs tab in the PlayFab Game Manager.

- [RemoveFriend](/rest/api/playfab/server/friend-list-management/removefriend?)
    Removes the specified friend from the user's friend list.

- [RemoveGenericID](/rest/api/playfab/server/account-management/removegenericid?)
    Removes the specified generic service identifier from the player's PlayFab account.

- [RemovePlayerTag](/rest/api/playfab/server/playstream/removeplayertag?)
    Remove a given tag from a player profile. The tag's namespace is automatically generated based on the source of the tag.

- [RemoveSharedGroupMembers](/rest/api/playfab/server/shared-group-data/removesharedgroupmembers?)
    Removes users from the set of those able to update the shared data and the set of users in the group. Only users in the group can remove members. If as a result of the call, zero users remain with access, the group and its associated data will be deleted. Shared Groups are designed for sharing data between a very small number of players, see [Using Shared Group Data](/gaming/playfab/features/social/groups/using-shared-group-data).

- [RevokeAllBansForUser](/rest/api/playfab/server/account-management/revokeallbansforuser?)
    Revoke all active bans for a user.

- [RevokeBans](/rest/api/playfab/server/account-management/revokebans?)
    Revoke all active bans specified with BanId.

- [RevokeInventoryItem](/rest/api/playfab/server/player-item-management/revokeinventoryitem?)
    Revokes access to an item in a user's inventory.    

- [RevokeInventoryItems](/rest/api/playfab/server/player-item-management/revokeinventoryitems?)
    Revokes access for up to 25 items across multiple users and characters.

- [SetFriendTags](/rest/api/playfab/server/friend-list-management/setfriendtags?)
    Updates the tag list for a specified user in the friend list of another user.

- [SetPlayerSecret](/rest/api/playfab/server/authentication/setplayersecret?)
    Sets the player's secret if it is not already set. Player secrets are used to sign API requests. To reset a player's secret use the Admin or Server API method SetPlayerSecret.

- [SetPublisherData](/rest/api/playfab/server/title-wide-data-management/setpublisherdata?)
    Updates the key-value store of custom publisher settings.

- [SetTitleData](/rest/api/playfab/server/title-wide-data-management/settitledata?)
    /rest/api/playfab/server/title-wide-data-management/setpublisherdata?

- [SetTitleInternalData](/rest/api/playfab/server/title-wide-data-management/settitleinternaldata?)
    Updates the key-value store of custom title settings

- [SubtractCharacterVirtualCurrency](/rest/api/playfab/server/player-item-management/subtractcharactervirtualcurrency?)
    Decrements the character's balance of the specified virtual currency by the stated amount. It is possible to make a VC balance negative with this API.

- [SubtractUserVirtualCurrency](/rest/api/playfab/server/player-item-management/subtractuservirtualcurrency?)
    Decrements the user's balance of the specified virtual currency by the stated amount. It is possible to make a VC balance negative with this API.

- [UnlinkServerCustomId](/rest/api/playfab/server/account-management/unlinkservercustomid?)
    Unlinks the custom server identifier from the user's PlayFab account.

- [UnlinkXboxAccount](/rest/api/playfab/server/account-management/unlinkxboxaccount?)
    Unlinks the related Xbox Live account from the user's PlayFab account.

- [UnlockContainerInstance](/rest/api/playfab/server/player-item-management/unlockcontainerinstance?)
    Opens a specific container (ContainerItemInstanceId), with a specific key (KeyItemInstanceId, when required), and returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.

- [UnlockContainerItem](/rest/api/playfab/server/player-item-management/unlockcontaineritem?)
    Searches Player or Character inventory for any ItemInstance matching the given CatalogItemId, if necessary unlocks it using any appropriate key, and returns the contents of the opened container. If the container (and key when relevant) are consumable (RemainingUses > 0), their RemainingUses will be decremented, consistent with the operation of ConsumeItem.

- [UpdateAvatarUrl](/rest/api/playfab/server/account-management/updateavatarurl?)
    Update the avatar URL of the specified player.

- [UpdateBans](/rest/api/playfab/server/account-management/updatebans?)
    Updates information of a list of existing bans specified with Ban Ids.

- [UpdateCharacterData](/rest/api/playfab/server/character-data/updatecharacterdata?)
    Updates the title-specific custom data for the user's character which is readable and writable by the client.

- [UpdateCharacterInternalData](/rest/api/playfab/server/character-data/updatecharacterinternaldata?)
    Updates the title-specific custom data for the user's character which cannot be accessed by the client.

- [UpdateCharacterReadOnlyData](/rest/api/playfab/server/character-data/updatecharacterreadonlydata?)
    Updates the title-specific custom data for the user's character which can only be read by the client.

- [UpdateCharacterStatistics](/rest/api/playfab/server/characters/updatecharacterstatistics?)
    Updates the values of the specified title-specific statistics for the specific character.

- [UpdatePlayerStatistics](/rest/api/playfab/server/player-data-management/updateplayerstatistics?)
    Updates the values of the specified title-specific statistics for the user.

- [UpdateUserData](/rest/api/playfab/server/player-data-management/updateuserdata?)
    Updates the title-specific custom data for the user which is readable and writable by the client.

- [UpdateUserInternalData](/rest/api/playfab/server/player-data-management/updateuserinternaldata?)
    Updates the title-specific custom data for the user which cannot be accessed by the client.

- [UpdateUserInventoryItemCustomData](/rest/api/playfab/server/player-item-management/updateuserinventoryitemcustomdata?)
    Updates the key-value pair data tagged to the specified item, which is read-only from the client.

- [UpdateUserPublisherData](/rest/api/playfab/server/player-data-management/updateuserpublisherdata?)
    Updates the publisher-specific custom data for the user which is readable and writable by the client.

- [UpdateUserPublisherInternalData](/rest/api/playfab/server/player-data-management/updateuserpublisherinternaldata?)
    Updates the publisher-specific custom data for the user which cannot be accessed by the client.

- [UpdateUserPublisherReadOnlyData](/rest/api/playfab/server/player-data-management/updateuserpublisherreadonlydata?)
    Updates the publisher-specific custom data for the user which can only be read by the client.

- [UpdateUserReadOnlyData](/rest/api/playfab/server/player-data-management/updateuserreadonlydata?)
    Updates the title-specific custom data for the user which can only be read by the client.
