---
title: PlayerProfile
author: joannaleecy
description: PlayerProfile data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# PlayerProfile

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AdCampaignAttributions|[AdCampaignAttribution](adcampaignattribution.md)|Array of ad campaigns player has been attributed to|
|AvatarUrl|String|Image URL of the player's avatar.|
|BannedUntil|DateTime|Banned until UTC Date. If permanent ban this is set for 20 years after the original ban date.|
|ContactEmailAddresses|[ContactEmailInfo](contactemailinfo.md)|Array of contact email addresses associated with the player|
|Created|DateTime|Player record created|
|DisplayName|String|Player Display Name|
|LastLogin|DateTime|Last login|
|LinkedAccounts|[PlayerLinkedAccount](playerlinkedaccount.md)|Array of third party accounts linked to this player|
|Locations_LastLogin_City|String|City of the player's geographic location on last login|
|Locations_LastLogin_ContinentCode|[ContinentCode](continentcode.md)|The two-character continent code for this location|
|Locations_LastLogin_CountryCode|[CountryCode](countrycode.md)|The two-character ISO 3166-1 country code for the country/region associated with the location|
|Locations_LastLogin_Latitude|Real|Latitude coordinate of the player's geographic location on last login|
|Locations_LastLogin_Longitude|Real|Longitude coordinate of the player's geographic location on last login|
|Origination|[LoginIdentityProvider](loginidentityprovider.md)|Player account origination|
|PlayerId|String|PlayFab Player ID|
|PlayerMemberships|[PlayerMemberships](playermemberships.md)|Array of memberships this player owns|
|PlayerStatistics|[PlayerStatistic](playerstatistic.md)|Array of player statistics|
|PublisherId|String|Publisher this player belongs to|
|PushNotificationRegistrations|[PushNotificationRegistration](pushnotificationregistration.md)|Array of configured push notification end points|
|Statistics|Object|Dictionary of player's statistics using only the latest version's value|
|Tags|[]|List of player's tags for segmentation.|
|TitleId|String|Title ID this profile applies to|
|TotalValueToDateInUSD|uint32|A sum of player's total purchases in USD across all currencies.|
|ValuesToDate|Object|Dictionary of player's total purchases by currency.|
|VirtualCurrencyBalances|Object|Dictionary of player's virtual currency balances|
