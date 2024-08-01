---
author: jasonsandlin
title: "Services C API overview - PFInventoryTypes.h"
description: "Services C API overview - PFInventoryTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFInventoryTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFInventoryAddInventoryItemsOperation](structs/pfinventoryaddinventoryitemsoperation.md) | PFInventoryAddInventoryItemsOperation data model. |  
| [PFInventoryAddInventoryItemsRequest](structs/pfinventoryaddinventoryitemsrequest.md) | PFInventoryAddInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will add the specified inventory items. |  
| [PFInventoryAddInventoryItemsResponse](structs/pfinventoryaddinventoryitemsresponse.md) | PFInventoryAddInventoryItemsResponse data model. |  
| [PFInventoryAlternateId](structs/pfinventoryalternateid.md) | PFInventoryAlternateId data model. |  
| [PFInventoryDeleteInventoryCollectionRequest](structs/pfinventorydeleteinventorycollectionrequest.md) | PFInventoryDeleteInventoryCollectionRequest data model. Delete an Inventory Collection by the specified Id for an Entity. |  
| [PFInventoryDeleteInventoryItemsOperation](structs/pfinventorydeleteinventoryitemsoperation.md) | PFInventoryDeleteInventoryItemsOperation data model. |  
| [PFInventoryDeleteInventoryItemsRequest](structs/pfinventorydeleteinventoryitemsrequest.md) | PFInventoryDeleteInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will delete the entity's inventory items. |  
| [PFInventoryDeleteInventoryItemsResponse](structs/pfinventorydeleteinventoryitemsresponse.md) | PFInventoryDeleteInventoryItemsResponse data model. |  
| [PFInventoryExecuteInventoryOperationsRequest](structs/pfinventoryexecuteinventoryoperationsrequest.md) | PFInventoryExecuteInventoryOperationsRequest data model. Execute a list of Inventory Operations for an Entity. |  
| [PFInventoryExecuteInventoryOperationsResponse](structs/pfinventoryexecuteinventoryoperationsresponse.md) | PFInventoryExecuteInventoryOperationsResponse data model. |  
| [PFInventoryGetInventoryCollectionIdsRequest](structs/pfinventorygetinventorycollectionidsrequest.md) | PFInventoryGetInventoryCollectionIdsRequest data model. Get a list of Inventory Collection Ids for the specified Entity. |  
| [PFInventoryGetInventoryCollectionIdsResponse](structs/pfinventorygetinventorycollectionidsresponse.md) | PFInventoryGetInventoryCollectionIdsResponse data model. |  
| [PFInventoryGetInventoryItemsRequest](structs/pfinventorygetinventoryitemsrequest.md) | PFInventoryGetInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will get the entity's inventory items. . |  
| [PFInventoryGetInventoryItemsResponse](structs/pfinventorygetinventoryitemsresponse.md) | PFInventoryGetInventoryItemsResponse data model. |  
| [PFInventoryGetMicrosoftStoreAccessTokensRequest](structs/pfinventorygetmicrosoftstoreaccesstokensrequest.md) | PFInventoryGetMicrosoftStoreAccessTokensRequest data model. Gets the access tokens for Microsoft Store authentication. |  
| [PFInventoryGetMicrosoftStoreAccessTokensResponse](structs/pfinventorygetmicrosoftstoreaccesstokensresponse.md) | PFInventoryGetMicrosoftStoreAccessTokensResponse data model. |  
| [PFInventoryGetTransactionHistoryRequest](structs/pfinventorygettransactionhistoryrequest.md) | PFInventoryGetTransactionHistoryRequest data model. Get transaction history for specified entity and collection. |  
| [PFInventoryGetTransactionHistoryResponse](structs/pfinventorygettransactionhistoryresponse.md) | PFInventoryGetTransactionHistoryResponse data model. |  
| [PFInventoryGooglePlayProductPurchase](structs/pfinventorygoogleplayproductpurchase.md) | PFInventoryGooglePlayProductPurchase data model. |  
| [PFInventoryInitialValues](structs/pfinventoryinitialvalues.md) | PFInventoryInitialValues data model. |  
| [PFInventoryInventoryItem](structs/pfinventoryinventoryitem.md) | PFInventoryInventoryItem data model. |  
| [PFInventoryInventoryItemReference](structs/pfinventoryinventoryitemreference.md) | PFInventoryInventoryItemReference data model. |  
| [PFInventoryInventoryOperation](structs/pfinventoryinventoryoperation.md) | PFInventoryInventoryOperation data model. |  
| [PFInventoryPurchaseInventoryItemsOperation](structs/pfinventorypurchaseinventoryitemsoperation.md) | PFInventoryPurchaseInventoryItemsOperation data model. |  
| [PFInventoryPurchaseInventoryItemsRequest](structs/pfinventorypurchaseinventoryitemsrequest.md) | PFInventoryPurchaseInventoryItemsRequest data model. Purchase a single item or bundle, paying the associated price. |  
| [PFInventoryPurchaseInventoryItemsResponse](structs/pfinventorypurchaseinventoryitemsresponse.md) | PFInventoryPurchaseInventoryItemsResponse data model. |  
| [PFInventoryPurchasePriceAmount](structs/pfinventorypurchasepriceamount.md) | PFInventoryPurchasePriceAmount data model. |  
| [PFInventoryRedeemAppleAppStoreInventoryItemsRequest](structs/pfinventoryredeemappleappstoreinventoryitemsrequest.md) | PFInventoryRedeemAppleAppStoreInventoryItemsRequest data model. Redeem items from the Apple App Store. |  
| [PFInventoryRedeemAppleAppStoreInventoryItemsResponse](structs/pfinventoryredeemappleappstoreinventoryitemsresponse.md) | PFInventoryRedeemAppleAppStoreInventoryItemsResponse data model. |  
| [PFInventoryRedeemGooglePlayInventoryItemsRequest](structs/pfinventoryredeemgoogleplayinventoryitemsrequest.md) | PFInventoryRedeemGooglePlayInventoryItemsRequest data model. Redeem items from the Google Play Store. |  
| [PFInventoryRedeemGooglePlayInventoryItemsResponse](structs/pfinventoryredeemgoogleplayinventoryitemsresponse.md) | PFInventoryRedeemGooglePlayInventoryItemsResponse data model. |  
| [PFInventoryRedeemMicrosoftStoreInventoryItemsRequest](structs/pfinventoryredeemmicrosoftstoreinventoryitemsrequest.md) | PFInventoryRedeemMicrosoftStoreInventoryItemsRequest data model. Redeem items from the Microsoft Store. |  
| [PFInventoryRedeemMicrosoftStoreInventoryItemsResponse](structs/pfinventoryredeemmicrosoftstoreinventoryitemsresponse.md) | PFInventoryRedeemMicrosoftStoreInventoryItemsResponse data model. |  
| [PFInventoryRedeemNintendoEShopInventoryItemsRequest](structs/pfinventoryredeemnintendoeshopinventoryitemsrequest.md) | PFInventoryRedeemNintendoEShopInventoryItemsRequest data model. Redeem items from the Nintendo EShop. |  
| [PFInventoryRedeemNintendoEShopInventoryItemsResponse](structs/pfinventoryredeemnintendoeshopinventoryitemsresponse.md) | PFInventoryRedeemNintendoEShopInventoryItemsResponse data model. |  
| [PFInventoryRedeemPlayStationStoreInventoryItemsRequest](structs/pfinventoryredeemplaystationstoreinventoryitemsrequest.md) | PFInventoryRedeemPlayStationStoreInventoryItemsRequest data model. Redeem items from the PlayStation Store. |  
| [PFInventoryRedeemPlayStationStoreInventoryItemsResponse](structs/pfinventoryredeemplaystationstoreinventoryitemsresponse.md) | PFInventoryRedeemPlayStationStoreInventoryItemsResponse data model. |  
| [PFInventoryRedeemSteamInventoryItemsRequest](structs/pfinventoryredeemsteaminventoryitemsrequest.md) | PFInventoryRedeemSteamInventoryItemsRequest data model. Redeem inventory items from Steam. |  
| [PFInventoryRedeemSteamInventoryItemsResponse](structs/pfinventoryredeemsteaminventoryitemsresponse.md) | PFInventoryRedeemSteamInventoryItemsResponse data model. |  
| [PFInventoryRedemptionFailure](structs/pfinventoryredemptionfailure.md) | PFInventoryRedemptionFailure data model. |  
| [PFInventoryRedemptionSuccess](structs/pfinventoryredemptionsuccess.md) | PFInventoryRedemptionSuccess data model. |  
| [PFInventorySubtractInventoryItemsOperation](structs/pfinventorysubtractinventoryitemsoperation.md) | PFInventorySubtractInventoryItemsOperation data model. |  
| [PFInventorySubtractInventoryItemsRequest](structs/pfinventorysubtractinventoryitemsrequest.md) | PFInventorySubtractInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will subtract the specified inventory items. . |  
| [PFInventorySubtractInventoryItemsResponse](structs/pfinventorysubtractinventoryitemsresponse.md) | PFInventorySubtractInventoryItemsResponse data model. |  
| [PFInventoryTransaction](structs/pfinventorytransaction.md) | PFInventoryTransaction data model. |  
| [PFInventoryTransactionOperation](structs/pfinventorytransactionoperation.md) | PFInventoryTransactionOperation data model. |  
| [PFInventoryTransactionPurchaseDetails](structs/pfinventorytransactionpurchasedetails.md) | PFInventoryTransactionPurchaseDetails data model. |  
| [PFInventoryTransactionRedeemDetails](structs/pfinventorytransactionredeemdetails.md) | PFInventoryTransactionRedeemDetails data model. |  
| [PFInventoryTransactionTransferDetails](structs/pfinventorytransactiontransferdetails.md) | PFInventoryTransactionTransferDetails data model. |  
| [PFInventoryTransferInventoryItemsOperation](structs/pfinventorytransferinventoryitemsoperation.md) | PFInventoryTransferInventoryItemsOperation data model. |  
| [PFInventoryTransferInventoryItemsRequest](structs/pfinventorytransferinventoryitemsrequest.md) | PFInventoryTransferInventoryItemsRequest data model. Transfer the specified inventory items of an entity's container Id to another entity's container Id. |  
| [PFInventoryTransferInventoryItemsResponse](structs/pfinventorytransferinventoryitemsresponse.md) | PFInventoryTransferInventoryItemsResponse data model. |  
| [PFInventoryUpdateInventoryItemsOperation](structs/pfinventoryupdateinventoryitemsoperation.md) | PFInventoryUpdateInventoryItemsOperation data model. |  
| [PFInventoryUpdateInventoryItemsRequest](structs/pfinventoryupdateinventoryitemsrequest.md) | PFInventoryUpdateInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will update the entity's inventory items. |  
| [PFInventoryUpdateInventoryItemsResponse](structs/pfinventoryupdateinventoryitemsresponse.md) | PFInventoryUpdateInventoryItemsResponse data model. |  
