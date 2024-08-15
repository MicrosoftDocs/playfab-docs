---
author: jasonsandlin
title: "PFPlayerProfileModel"
description: "PFPlayerProfileModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerProfileModel  

PFPlayerProfileModel data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerProfileModel {  
    PFAdCampaignAttributionModel const* adCampaignAttributions;  
    uint32_t adCampaignAttributionsCount;  
    const char* avatarUrl;  
    time_t const* bannedUntil;  
    PFContactEmailInfoModel const* contactEmailAddresses;  
    uint32_t contactEmailAddressesCount;  
    time_t const* created;  
    const char* displayName;  
    const char* const* experimentVariants;  
    uint32_t experimentVariantsCount;  
    time_t const* lastLogin;  
    PFLinkedPlatformAccountModel const* linkedAccounts;  
    uint32_t linkedAccountsCount;  
    PFLocationModel const* locations;  
    uint32_t locationsCount;  
    PFMembershipModel const* memberships;  
    uint32_t membershipsCount;  
    PFLoginIdentityProvider const* origination;  
    const char* playerId;  
    const char* publisherId;  
    PFPushNotificationRegistrationModel const* pushNotificationRegistrations;  
    uint32_t pushNotificationRegistrationsCount;  
    PFStatisticModel const* statistics;  
    uint32_t statisticsCount;  
    PFTagModel const* tags;  
    uint32_t tagsCount;  
    const char* titleId;  
    uint32_t const* totalValueToDateInUSD;  
    PFValueToDateModel const* valuesToDate;  
    uint32_t valuesToDateCount;  
} PFPlayerProfileModel;  
```
  
### Members  
  
**`adCampaignAttributions`** &nbsp; [PFAdCampaignAttributionModel](pfadcampaignattributionmodel.md) const*  
*may be nullptr*  
  
(Optional) List of advertising campaigns the player has been attributed to.
  
**`adCampaignAttributionsCount`** &nbsp; uint32_t  
  
Count of adCampaignAttributions
  
**`avatarUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) URL of the player's avatar image.
  
**`bannedUntil`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) If the player is currently banned, the UTC Date when the ban expires.
  
**`contactEmailAddresses`** &nbsp; [PFContactEmailInfoModel](pfcontactemailinfomodel.md) const*  
*may be nullptr*  
  
(Optional) List of all contact email info associated with the player account.
  
**`contactEmailAddressesCount`** &nbsp; uint32_t  
  
Count of contactEmailAddresses
  
**`created`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Player record created.
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Player display name.
  
**`experimentVariants`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) List of experiment variants for the player. Note that these variants are not guaranteed to be up-to-date when returned during login because the player profile is updated only after login. Instead, use the LoginResult.TreatmentAssignment property during login to get the correct variants and variables.
  
**`experimentVariantsCount`** &nbsp; uint32_t  
  
Count of experimentVariants
  
**`lastLogin`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) UTC time when the player most recently logged in to the title.
  
**`linkedAccounts`** &nbsp; [PFLinkedPlatformAccountModel](pflinkedplatformaccountmodel.md) const*  
*may be nullptr*  
  
(Optional) List of all authentication systems linked to this player account.
  
**`linkedAccountsCount`** &nbsp; uint32_t  
  
Count of linkedAccounts
  
**`locations`** &nbsp; [PFLocationModel](pflocationmodel.md) const*  
*may be nullptr*  
  
(Optional) List of geographic locations from which the player has logged in to the title.
  
**`locationsCount`** &nbsp; uint32_t  
  
Count of locations
  
**`memberships`** &nbsp; [PFMembershipModel](pfmembershipmodel.md) const*  
*may be nullptr*  
  
(Optional) List of memberships for the player, along with whether are expired.
  
**`membershipsCount`** &nbsp; uint32_t  
  
Count of memberships
  
**`origination`** &nbsp; [PFLoginIdentityProvider](../enums/pfloginidentityprovider.md) const*  
*may be nullptr*  
  
(Optional) Player account origination.
  
**`playerId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab player account unique identifier.
  
**`publisherId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Publisher this player belongs to.
  
**`pushNotificationRegistrations`** &nbsp; [PFPushNotificationRegistrationModel](pfpushnotificationregistrationmodel.md) const*  
*may be nullptr*  
  
(Optional) List of configured end points registered for sending the player push notifications.
  
**`pushNotificationRegistrationsCount`** &nbsp; uint32_t  
  
Count of pushNotificationRegistrations
  
**`statistics`** &nbsp; [PFStatisticModel](pfstatisticmodel.md) const*  
*may be nullptr*  
  
(Optional) List of leaderboard statistic values for the player.
  
**`statisticsCount`** &nbsp; uint32_t  
  
Count of statistics
  
**`tags`** &nbsp; [PFTagModel](pftagmodel.md) const*  
*may be nullptr*  
  
(Optional) List of player's tags for segmentation.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
**`titleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Title ID this player profile applies to.
  
**`totalValueToDateInUSD`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) Sum of the player's purchases made with real-money currencies, converted to US dollars equivalent and represented as a whole number of cents (1/100 USD). For example, 999 indicates nine dollars and ninety-nine cents.
  
**`valuesToDate`** &nbsp; [PFValueToDateModel](pfvaluetodatemodel.md) const*  
*may be nullptr*  
  
(Optional) List of the player's lifetime purchase totals, summed by real-money currency.
  
**`valuesToDateCount`** &nbsp; uint32_t  
  
Count of valuesToDate
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
