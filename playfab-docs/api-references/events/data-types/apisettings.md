---
title: APISettings
author: joannaleecy
description: APISettings data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# APISettings

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AllowClientToAddVirtualCurrency|Boolean|Allow game clients to add to virtual currency balances via API.|
|AllowClientToPostPlayerStatistics|Boolean|Allow game clients to update statistic values via API.|
|AllowClientToStartGames|Boolean|Allow clients to start multiplayer game sessions via API.|
|AllowClientToSubtractVirtualCurrency|Boolean|Allow game clients to subtract from virtual currency balances via API.|
|AllowNonUniquePlayerDisplayNames|Boolean|Allow players to choose display names that may be in use by other players, i.e. do not enforce uniqueness of display names. Note: if this option is enabled, it cannot be disabled later.|
|AllowServerToDeleteUsers|Boolean|Allow game servers to delete player accounts via API.|
|DefaultLanguage|String|The default language for communication with players|
|DisableAPIAccess|Boolean|Disable API access by returning errors to all API requests.|
|DisplayNameRandomSuffixLength|int32|Display name randomly-generated suffix length.|
|EnableClientIPAddressObfuscation|Boolean|Reduce the precision of IP addresses collected from players' devices before they are stored or used to estimate geographic locations.|
|RequireCustomDataJSONFormat|Boolean|Require JSON format for data values associated with players, characters, inventories, and shared groups.|
|UseExternalGameServerProvider|Boolean|Multiplayer game sessions are hosted on servers external to PlayFab.|
|UseSandboxPayments|Boolean|Use payment provider's sandbox mode (if available) for real-money purchases. This can be useful when testing in-game purchasing in order to avoid being charged.|

