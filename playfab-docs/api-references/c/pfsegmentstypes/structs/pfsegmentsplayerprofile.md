---
author: jasonsandlin
title: "PFSegmentsPlayerProfile"
description: "PFSegmentsPlayerProfile data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsPlayerProfile  

PFSegmentsPlayerProfile data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsPlayerProfile {  
    PFSegmentsAdCampaignAttribution const* adCampaignAttributions;  
    uint32_t adCampaignAttributionsCount;  
    const char* avatarUrl;  
    time_t const* bannedUntil;  
    PFSegmentsChurnRiskLevel const* churnPrediction;  
    PFSegmentsContactEmailInfo const* contactEmailAddresses;  
    uint32_t contactEmailAddressesCount;  
    time_t const* created;  
    const char* displayName;  
    time_t const* lastLogin;  
    PFSegmentsPlayerLinkedAccount const* linkedAccounts;  
    uint32_t linkedAccountsCount;  
    PFSegmentsPlayerLocationDictionaryEntry const* locations;  
    uint32_t locationsCount;  
    PFLoginIdentityProvider const* origination;  
    const char* const* playerExperimentVariants;  
    uint32_t playerExperimentVariantsCount;  
    const char* playerId;  
    PFSegmentsPlayerStatistic const* playerStatistics;  
    uint32_t playerStatisticsCount;  
    const char* publisherId;  
    PFSegmentsPushNotificationRegistration const* pushNotificationRegistrations;  
    uint32_t pushNotificationRegistrationsCount;  
    PFInt32DictionaryEntry const* statistics;  
    uint32_t statisticsCount;  
    const char* const* tags;  
    uint32_t tagsCount;  
    const char* titleId;  
    uint32_t const* totalValueToDateInUSD;  
    PFUint32DictionaryEntry const* valuesToDate;  
    uint32_t valuesToDateCount;  
    PFInt32DictionaryEntry const* virtualCurrencyBalances;  
    uint32_t virtualCurrencyBalancesCount;  
} PFSegmentsPlayerProfile;  
```
  
### Members  
  
**`adCampaignAttributions`** &nbsp; [PFSegmentsAdCampaignAttribution](pfsegmentsadcampaignattribution.md) const*  
*may be nullptr*  
  
(Optional) Array of ad campaigns player has been attributed to.
  
**`adCampaignAttributionsCount`** &nbsp; uint32_t  
  
Count of adCampaignAttributions
  
**`avatarUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Image URL of the player's avatar.
  
**`bannedUntil`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Banned until UTC Date. If permanent ban this is set for 20 years after the original ban date.
  
**`churnPrediction`** &nbsp; [PFSegmentsChurnRiskLevel](../enums/pfsegmentschurnrisklevel.md) const*  
*may be nullptr*  
  
(Optional) The prediction of the player to churn within the next seven days.
  
**`contactEmailAddresses`** &nbsp; [PFSegmentsContactEmailInfo](pfsegmentscontactemailinfo.md) const*  
*may be nullptr*  
  
(Optional) Array of contact email addresses associated with the player.
  
**`contactEmailAddressesCount`** &nbsp; uint32_t  
  
Count of contactEmailAddresses
  
**`created`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Player record created.
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Player Display Name.
  
**`lastLogin`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Last login.
  
**`linkedAccounts`** &nbsp; [PFSegmentsPlayerLinkedAccount](pfsegmentsplayerlinkedaccount.md) const*  
*may be nullptr*  
  
(Optional) Array of third party accounts linked to this player.
  
**`linkedAccountsCount`** &nbsp; uint32_t  
  
Count of linkedAccounts
  
**`locations`** &nbsp; PFSegmentsPlayerLocationDictionaryEntry const*  
*may be nullptr*  
  
(Optional) Dictionary of player's locations by type.
  
**`locationsCount`** &nbsp; uint32_t  
  
Count of locations
  
**`origination`** &nbsp; [PFLoginIdentityProvider](../../pftypes/enums/pfloginidentityprovider.md) const*  
*may be nullptr*  
  
(Optional) Player account origination.
  
**`playerExperimentVariants`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) List of player variants for experimentation.
  
**`playerExperimentVariantsCount`** &nbsp; uint32_t  
  
Count of playerExperimentVariants
  
**`playerId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab Player ID.
  
**`playerStatistics`** &nbsp; [PFSegmentsPlayerStatistic](pfsegmentsplayerstatistic.md) const*  
*may be nullptr*  
  
(Optional) Array of player statistics.
  
**`playerStatisticsCount`** &nbsp; uint32_t  
  
Count of playerStatistics
  
**`publisherId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Publisher this player belongs to.
  
**`pushNotificationRegistrations`** &nbsp; [PFSegmentsPushNotificationRegistration](pfsegmentspushnotificationregistration.md) const*  
*may be nullptr*  
  
(Optional) Array of configured push notification end points.
  
**`pushNotificationRegistrationsCount`** &nbsp; uint32_t  
  
Count of pushNotificationRegistrations
  
**`statistics`** &nbsp; [PFInt32DictionaryEntry](../../pftypes/structs/pfint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) Dictionary of player's statistics using only the latest version's value.
  
**`statisticsCount`** &nbsp; uint32_t  
  
Count of statistics
  
**`tags`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) List of player's tags for segmentation.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
**`titleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Title ID this profile applies to.
  
**`totalValueToDateInUSD`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) A sum of player's total purchases in USD across all currencies.
  
**`valuesToDate`** &nbsp; [PFUint32DictionaryEntry](../../pftypes/structs/pfuint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) Dictionary of player's total purchases by currency.
  
**`valuesToDateCount`** &nbsp; uint32_t  
  
Count of valuesToDate
  
**`virtualCurrencyBalances`** &nbsp; [PFInt32DictionaryEntry](../../pftypes/structs/pfint32dictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) Dictionary of player's virtual currency balances.
  
**`virtualCurrencyBalancesCount`** &nbsp; uint32_t  
  
Count of virtualCurrencyBalances
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
