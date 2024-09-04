---
title: PlayFab Services SDK Release Notes 2024
author: amccalib
description: PlayFab Services SDK Release Notes for 2024.
ms.author: andmcc
ms.date: 08/30/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---
# PlayFab Services SDK Release Notes 2024

> [!NOTE]
> For release notes about service releases and product updates, see the [release notes](https://github.com/PlayFab/PlayFab/releases) section on [PlayFab's public GitHub repository](https://github.com/PlayFab/PlayFab)

## 240830

Date: August 30, 2024

 - Renamed Leaderboards API to Progression. It contains both Leaderboards and Statistics calls.
 - Removed OfferId from redeem responses in the Economy API. Added the new field MarketplaceAlternateId instead. Callers should move to the new field, while the service will continue to respond with both fields for backward compatibility.
 - Added the Addon API. It is used to manage add-ons for a title.

## 240802

Date: August 2, 2024

 - Added new Leaderboards and Statistics calls to the Leaderboards API. These will not be fully functional until a later update to the PlayFab service.
 - Added error codes for new service errors

## 240621

Date: June 21, 2024

 - Added XboxMobileStore to the LoginIdentityProvider and UserOrigination enums
 - Expanded the IdentifiedDeviceType enum in the Authentication API to include a broader set of gaming platforms
 - Updated documented numerical limits for multiple calls in the Economy API
 - Added error codes for new service errors

## 240514

Date: May 14, 2024

- Expanded AzureVmFamily and AzureVmSize in the Multiplayer API to include new options:
  - HBv3
  - Ddv5
  - Ddsv5
- Added LinuxInstrumentationConfiguration to CreateBuild calls in the Multiplayer API
- Added LoginWithPSN to the Server API

## 240426

Date: April 26, 2024

 - Removed IncludeMicrosoftFamily in favor of UserFamilyType in the BanInfo and BanRequest data objects in the Admin and Server APIs
 - Added two new calls to the CloudScript API:
   - RegisterEventHubFunction
   - ListEventHubFunctions
 - Added ReviewConfig to CatalogConfig in the Economy API
 - Added three new calls to the Multiplayer API:
   - UploadSecret
   - ListSecretSummaries
   - DeleteSecret

## 240401

Date: April 1, 2024

 - Added two new calls to the Economy API:
   - Inventory/ExecuteTransferOperations
   - Inventory/GetInventoryOperationStatus

## 240315

Date: March 15, 2024

 - Added support for compressed service responses to the Unity SDK.
   - To utilize this feature, set the new __CompressResponses__ value in the __PlayFabApiSettings__ class.
 - Fixed a bug in how the C# __PlayFabAuthenticationInstanceApi__ class handled instance-level entity tokens.
 - Added IncludeMicrosoftFamily to the BanInfo and BanRequest data objects in the Admin and Server APIs.
 - Made the following additions to the Economy API:
   - Added OrderBy to GetTransactionHistoryRequest.
   - Added Permissions to StoreDetails.
 - Added error codes for new service errors.

## 240301

Date: March 1, 2024

 - Added support for compressed service responses to the C# SDK
   - To utilize this feature, set the new __CompressResponses__ value in the __PlayFabApiSettings__ class.
 - Removed AttributeStatistics from the EntityProfileBody property of Profiles/GetEntityProfileResponse
 - Added error codes for new service errors.

## 240202

Date: February 2, 2024

 - Added GetPlayFabIDsFromPSNOnlineIDs call to the Client and Server APIs.

## 240119

Date: January 19, 2024

 - Added RoutingPreference to ListQosServersForTitleRequest in the Multiplayer API
 - Made the following changes to LobbyAsServer preview feature in the Multiplayer API:
   - Added Server property to Lobby object returned by Lobby API calls
   - Renamed Server property in UpdateLobbyAsServerRequest to ServerEntity
   - Removed ServerDataStatus from JoinLobbyAsServerResult
 - Added error codes for new service errors.

## 240105

Date: January 5, 2024

 - Added error codes for new service errors.
