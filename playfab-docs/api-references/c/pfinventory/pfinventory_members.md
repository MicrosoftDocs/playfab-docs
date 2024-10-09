---
author: jasonsandlin
title: "Services C API overview - PFInventory.h"
description: "Services C API overview - PFInventory.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFInventory.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFInventoryAddInventoryItemsAsync](functions/pfinventoryaddinventoryitemsasync.md) | Add inventory items. Up to 10000 stacks of items can be added to a single inventory collection. Stack size is uncapped. |  
| [PFInventoryAddInventoryItemsGetResult](functions/pfinventoryaddinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryAddInventoryItemsAsync call. |  
| [PFInventoryAddInventoryItemsGetResultSize](functions/pfinventoryaddinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a AddInventoryItems call. |  
| [PFInventoryDeleteInventoryCollectionAsync](functions/pfinventorydeleteinventorycollectionasync.md) | Delete an Inventory Collection. More information about Inventory Collections can be found here: [Collections](../../../features/economy-v2/inventory/collections.md) |
| [PFInventoryDeleteInventoryItemsAsync](functions/pfinventorydeleteinventoryitemsasync.md) | Delete inventory items |  
| [PFInventoryDeleteInventoryItemsGetResult](functions/pfinventorydeleteinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryDeleteInventoryItemsAsync call. |  
| [PFInventoryDeleteInventoryItemsGetResultSize](functions/pfinventorydeleteinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a DeleteInventoryItems call. |  
| [PFInventoryExecuteInventoryOperationsAsync](functions/pfinventoryexecuteinventoryoperationsasync.md) | Execute a list of Inventory Operations. A maximum list of 10 operations can be performed by a single request. There is also a limit to 250 items that can be modified/added in a single request. For example, adding a bundle with 50 items counts as 50 items modified. All operations must be done within a single inventory collection. This API has a reduced RPS compared to an individual inventory operation with Player Entities limited to 15 requests in 90 seconds and Title Entities limited to 500 requests in 10 seconds. |  
| [PFInventoryExecuteInventoryOperationsGetResult](functions/pfinventoryexecuteinventoryoperationsgetresult.md) | Gets the result of a successful PFInventoryExecuteInventoryOperationsAsync call. |  
| [PFInventoryExecuteInventoryOperationsGetResultSize](functions/pfinventoryexecuteinventoryoperationsgetresultsize.md) | Get the size in bytes needed to store the result of a ExecuteInventoryOperations call. |  
| [PFInventoryGetInventoryCollectionIdsAsync](functions/pfinventorygetinventorycollectionidsasync.md) | Get Inventory Collection Ids. Up to 50 Ids can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. It can take a few seconds for new collection Ids to show up. |  
| [PFInventoryGetInventoryCollectionIdsGetResult](functions/pfinventorygetinventorycollectionidsgetresult.md) | Gets the result of a successful PFInventoryGetInventoryCollectionIdsAsync call. |  
| [PFInventoryGetInventoryCollectionIdsGetResultSize](functions/pfinventorygetinventorycollectionidsgetresultsize.md) | Get the size in bytes needed to store the result of a GetInventoryCollectionIds call. |  
| [PFInventoryGetInventoryItemsAsync](functions/pfinventorygetinventoryitemsasync.md) | Get current inventory items. |  
| [PFInventoryGetInventoryItemsGetResult](functions/pfinventorygetinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryGetInventoryItemsAsync call. |  
| [PFInventoryGetInventoryItemsGetResultSize](functions/pfinventorygetinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a GetInventoryItems call. |  
| [PFInventoryGetMicrosoftStoreAccessTokensAsync](functions/pfinventorygetmicrosoftstoreaccesstokensasync.md) | Gets the access tokens. |  
| [PFInventoryGetMicrosoftStoreAccessTokensGetResult](functions/pfinventorygetmicrosoftstoreaccesstokensgetresult.md) | Gets the result of a successful PFInventoryGetMicrosoftStoreAccessTokensAsync call. |  
| [PFInventoryGetMicrosoftStoreAccessTokensGetResultSize](functions/pfinventorygetmicrosoftstoreaccesstokensgetresultsize.md) | Get the size in bytes needed to store the result of a GetMicrosoftStoreAccessTokens call. |  
| [PFInventoryGetTransactionHistoryAsync](functions/pfinventorygettransactionhistoryasync.md) | Get transaction history for a player. Up to 50 Events can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. Getting transaction history has a lower RPS limit than getting a Player's inventory with Player Entities having a limit of 30 requests in 300 seconds and Title Entities having a limit of 100 requests in 10 seconds. |  
| [PFInventoryGetTransactionHistoryGetResult](functions/pfinventorygettransactionhistorygetresult.md) | Gets the result of a successful PFInventoryGetTransactionHistoryAsync call. |  
| [PFInventoryGetTransactionHistoryGetResultSize](functions/pfinventorygettransactionhistorygetresultsize.md) | Get the size in bytes needed to store the result of a GetTransactionHistory call. |  
| [PFInventoryPurchaseInventoryItemsAsync](functions/pfinventorypurchaseinventoryitemsasync.md) | Purchase an item or bundle. Up to 10000 stacks of items can be added to a single inventory collection. Stack size is uncapped. |  
| [PFInventoryPurchaseInventoryItemsGetResult](functions/pfinventorypurchaseinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryPurchaseInventoryItemsAsync call. |  
| [PFInventoryPurchaseInventoryItemsGetResultSize](functions/pfinventorypurchaseinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a PurchaseInventoryItems call. |  
| [PFInventoryRedeemAppleAppStoreInventoryItemsAsync](functions/pfinventoryredeemappleappstoreinventoryitemsasync.md) | Redeem items. |  
| [PFInventoryRedeemAppleAppStoreInventoryItemsGetResult](functions/pfinventoryredeemappleappstoreinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryRedeemAppleAppStoreInventoryItemsAsync call. |  
| [PFInventoryRedeemAppleAppStoreInventoryItemsGetResultSize](functions/pfinventoryredeemappleappstoreinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a RedeemAppleAppStoreInventoryItems call. |  
| [PFInventoryRedeemGooglePlayInventoryItemsAsync](functions/pfinventoryredeemgoogleplayinventoryitemsasync.md) | Redeem items. |  
| [PFInventoryRedeemGooglePlayInventoryItemsGetResult](functions/pfinventoryredeemgoogleplayinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryRedeemGooglePlayInventoryItemsAsync call. |  
| [PFInventoryRedeemGooglePlayInventoryItemsGetResultSize](functions/pfinventoryredeemgoogleplayinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a RedeemGooglePlayInventoryItems call. |  
| [PFInventoryRedeemMicrosoftStoreInventoryItemsAsync](functions/pfinventoryredeemmicrosoftstoreinventoryitemsasync.md) | Redeem items. |  
| [PFInventoryRedeemMicrosoftStoreInventoryItemsGetResult](functions/pfinventoryredeemmicrosoftstoreinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryRedeemMicrosoftStoreInventoryItemsAsync call. |  
| [PFInventoryRedeemMicrosoftStoreInventoryItemsGetResultSize](functions/pfinventoryredeemmicrosoftstoreinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a RedeemMicrosoftStoreInventoryItems call. |  
| [PFInventoryRedeemNintendoEShopInventoryItemsAsync](functions/pfinventoryredeemnintendoeshopinventoryitemsasync.md) | Redeem items. |  
| [PFInventoryRedeemNintendoEShopInventoryItemsGetResult](functions/pfinventoryredeemnintendoeshopinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryRedeemNintendoEShopInventoryItemsAsync call. |  
| [PFInventoryRedeemNintendoEShopInventoryItemsGetResultSize](functions/pfinventoryredeemnintendoeshopinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a RedeemNintendoEShopInventoryItems call. |  
| [PFInventoryRedeemPlayStationStoreInventoryItemsAsync](functions/pfinventoryredeemplaystationstoreinventoryitemsasync.md) | Redeem items. |  
| [PFInventoryRedeemPlayStationStoreInventoryItemsGetResult](functions/pfinventoryredeemplaystationstoreinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryRedeemPlayStationStoreInventoryItemsAsync call. |  
| [PFInventoryRedeemPlayStationStoreInventoryItemsGetResultSize](functions/pfinventoryredeemplaystationstoreinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a RedeemPlayStationStoreInventoryItems call. |  
| [PFInventoryRedeemSteamInventoryItemsAsync](functions/pfinventoryredeemsteaminventoryitemsasync.md) | Redeem items. |  
| [PFInventoryRedeemSteamInventoryItemsGetResult](functions/pfinventoryredeemsteaminventoryitemsgetresult.md) | Gets the result of a successful PFInventoryRedeemSteamInventoryItemsAsync call. |  
| [PFInventoryRedeemSteamInventoryItemsGetResultSize](functions/pfinventoryredeemsteaminventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a RedeemSteamInventoryItems call. |  
| [PFInventorySubtractInventoryItemsAsync](functions/pfinventorysubtractinventoryitemsasync.md) | Subtract inventory items. |  
| [PFInventorySubtractInventoryItemsGetResult](functions/pfinventorysubtractinventoryitemsgetresult.md) | Gets the result of a successful PFInventorySubtractInventoryItemsAsync call. |  
| [PFInventorySubtractInventoryItemsGetResultSize](functions/pfinventorysubtractinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a SubtractInventoryItems call. |  
| [PFInventoryTransferInventoryItemsAsync](functions/pfinventorytransferinventoryitemsasync.md) | Transfer inventory items. When transferring across collections, a 202 response indicates that the transfer did not complete within the timeframe of the request. You can identify the pending operations by looking for OperationStatus = 'InProgress'. You can check on the operation status at anytime within 30 days of the request by passing the TransactionToken to the GetInventoryOperationStatus API. More information about item transfer scenarios can be found here: [Transfer Inventory Items](../../../features/economy-v2/inventory/index.md#transfer-inventory-items) |  
| [PFInventoryTransferInventoryItemsGetResult](functions/pfinventorytransferinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryTransferInventoryItemsAsync call. |  
| [PFInventoryTransferInventoryItemsGetResultSize](functions/pfinventorytransferinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a TransferInventoryItems call. |  
| [PFInventoryUpdateInventoryItemsAsync](functions/pfinventoryupdateinventoryitemsasync.md) | Update inventory items |  
| [PFInventoryUpdateInventoryItemsGetResult](functions/pfinventoryupdateinventoryitemsgetresult.md) | Gets the result of a successful PFInventoryUpdateInventoryItemsAsync call. |  
| [PFInventoryUpdateInventoryItemsGetResultSize](functions/pfinventoryupdateinventoryitemsgetresultsize.md) | Get the size in bytes needed to store the result of a UpdateInventoryItems call. |  
