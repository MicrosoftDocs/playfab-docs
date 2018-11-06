---
title: Catalogs
author: v-thopra
description: Describes the Catalogs tab in the Economy section in Game Manager and the Catalog item type.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, items, catalogs
ms.localizationpriority: medium
---

# Catalogs

This tutorial describes the **Catalogs** tab in the **Economy** section in Game Manager. Use catalogs to define items that the player can purchase or that you can reward to a player.

## What is a Catalog?

Many games offer the player items for purchase such as a shield, a level-unlock, or a power-up. These items are specified in a catalog in units of either virtual currency or real money. Before the player can purchase an item from a catalog, you must create the catalog of items.

The Catalog APIs support many strategies for item purchasing, such as simple real-money or Virtual Currency purchases of items, triggered item grants based on buying another item, locked (with a potentially purchasable key) and unlocked boxes, random result tables, and non-purchasable items that are granted based on events within a game.

> [!NOTE]
> In catalogs, the currency type **RM** is reserved for **Real Money**, which is in cents USD. For example, $1.99 is represented as RM 199.

## Field Reference

This section describes each field you see in the **Catalogs** tab. When you first create a title, you have no catalogs. You won't see any fields in the **Catalogs** tab until you create a catalog, as demonstrated in the example after this section. The fields are presented in groups which you will encounter as you click through the tab. Any values you see in the screen shots are those created by following the step-by-step instructions in the example of creating a catalog.

### Add Catalog Fields

These are the fields you encounter after you click **Add Catalog** from the main **Catalogs** tab. The only field, **Catalog Version (Name)**, is required.

![Game Manager - Add Catalog](media/tutorials/game-manager-add-catalog.png)  

- **Catalog Version (Name)**
  This required field is the name of your catalog that is shown in the **Catalogs** tab as the Catalog Version.

### Add New Item Fields

These are the fields you encounter after you click Add New Item in the catalog.

![Game Manager - Add Catalog Item](media/tutorials/game-manager-add-catalog-item.png)  

### Add New Item, PROPERTIES Fields

These are the fields in the **PROPERTIES** section of a new catalog item. **Item ID** is the only required field.

![Game Manager - Catalog Item Properties](media/tutorials/game-manager-catalog-item-properties.png)

- **Item ID**
  This required field is the unique identifier for the item within the catalog. Item ID must be unique within the catalog, but you can have multiple catalog versions containing catalog items with the same Item ID.

- **Display Name**
  This optional field is the name displayed for the catalog item. One common usage is when you want to offer the item in your in-game store. Display names do not need to be unique.

- **Usage Count**
  This optional field is the number of times an item can be used by a player, using the "ConsumeItem" client-API call. For example, the item could be a reward doubler that can be used three times.

- **Item Class**
  This optional field is identifier that you can use to help manage your catalog items.

- **Description**
  This optional field is the description for the catalog item. One common usage is when you want to offer the item in your in-game store.

- **Usage Period (Seconds)**
  Usage Period is the period of time between when the item is created, and when the item is auto-revoked. For example, your catalog item could be an XP boost that’s active for 30 minutes after the player receives it.

  > [!NOTE]
  > You can specify the period in seconds, minutes, hours, days, weeks, months, or years.

- **Edit Tags (Comma Separated List)**
  This optional field contains tags that you can use to organize your catalog items. Like the field name implies, the tags are text strings, separated by commas.

- **Usage Period Group**
  This optional field is identifies a group of items where their usage period values are accumulated, and they share the result: when the specified period has elapsed, all of the items in the group are removed. This can be used to recharge a player’s powerups if they purchase another powerup of the same type before their current ones have expired.

- **Stackable Item checkbox**
  Marking this item as Stackable allows only one Item of this type in the inventory and increments the quantity count of the item.

- **Tradeable Item checkbox**
  Marking an item as tradeable make this item tradable via the Trade API calls.

### Add New Item, ATTRIBUTES Fields

These are the fields in the **ATTRIBUTES** section of a new catalog item. Attributes are key/value pairs (KVPs). Only **Key** is required for each attribute.

![Game Manager - Catalog Item Attributes](media/tutorials/game-manager-catalog-item-attributes.png)

- **Key**
  This required field is the index to the attribute value.

- **Value**
  This optional field is the value of the attribute. If this is not set, the value is **null**.

### Add New Item, PRICES Fields

![Game Manager - Catalog Item Prices](media/tutorials/game-manager-catalog-item-prices.png)

These are the fields in the **PRICES** section of a new catalog item.

- **Currency**
  Specifies the currency in which the item's cost is represented. **Real Money (RM)** is always available as it's built into PlayFab.

- **Amount**
  This required field represents the units of **Currency** for the item's cost.

### Add New Item, BUNDLE/CONTAINER

![Game Manager - Catalog Item Container](media/tutorials/game-manager-catalog-item-container.png)

These are the fields in the **BUNDLE/CONTAINER** section of a new catalog item.

- **Container**
  Select this checkbox to specify that the item is a container. This means the items within are not immediately granted upon purchase, but must be unlocked to grant their contents. If this checkbox is unselected, the item is a bundle that can grant virtual currency, other items, or random items from a drop table when purchased or granted.

- **Key Item ID**
  If Container is selected and this field has a value, players can only unlock the container and add the contents to their inventory if they already have an item with this Item ID in their inventory. Unlocking the container consumes the referenced item.

  If Container is selected but this field has no value, players can unlock the container at any time to add the container items to their inventory. Keyless containers are useful for granting specific rewards to players, since it requires a player action to acknowledge receipt of the item instead of adding it directly to the player’s inventory.

The following icons indicate the type of item in the bundle/container.

- The item is an item
  ![Game Manager - Catalog Type Item Icon](media/tutorials/game-manager-catalog-type-item-icon.png)

- The item is a currency
  ![Game Manager - Catalog Type Currency Icon](media/tutorials/game-manager-catalog-type-currency-icon.png)

- The item is a table
  ![Game Manager - Catalog Type Table Icon](media/tutorials/game-manager-catalog-type-table-icon.png)

### Add New Item, BUNDLE/CONTAINER, Add Item

![Game Manager - Catalog Item Container](media/tutorials/game-manager-catalog-item-container.png)

These are the fields in the **BUNDLE/CONTAINER, Add Item** section of a new catalog item.

- **Item ID**
  Identifies the item, by catalog Item ID, to add to the bundle/container. Although the current item appears in the list, you cannot select it and save the bundle/container as that would cause an infinite loop.

- **Qty.**
  Specifies how many of the item in Item ID to add to the bundle/container. You must specify a value greater than 0 (zero), otherwise the item is not added to the bundle/container.

### Add New Item, BUNDLE/CONTAINER, Add Currency

![Game Manager - Catalog Item Container](media/tutorials/game-manager-catalog-item-container.png)

These are the fields in the **BUNDLE/CONTAINER, Add Currency** section of a new catalog item.

- **Item ID**
  Identifies the currency, by Currency Code, to add to the bundle/container.

- **Qty.**
  Specifies how many of the item in Item ID to add to the bundle/container. You can specify a value of 0 (zero) or more.

### Add New Item, BUNDLE/CONTAINER, Add Table

![Game Manager - Catalog Item Container](media/tutorials/game-manager-catalog-item-container.png)

These are the fields in the **BUNDLE/CONTAINER, Add Table** section of a new catalog item.

- **Item ID**
  Identifies the drop table, by Table ID, to add to the bundle/container.

- **Qty.**
  Specifies how many of the drop tables in Item ID to add to the bundle/container. You can specify a value of 0 (zero) or more.

## Example

To create a catalog, perform the following steps:

1. Click Economy -> Catalog -> Add Catalog
2. Give your catalog a name, e.g.  My Catalog, then click CREATE CATALOG.
3. Set the catalog as the primary catalog by clicking on Primary Catalog button.
4. Add a new Item. Click on Add New Item and then expand the New Item to set its properties.
5. Fill in some properties.
   1. ItemID, e.g. shield_level_5
   2. Display Name, e.g.  “Level 5 Shield”
   3. Description, e.g.  “Strong defense against projectile attacks”
6. Set a price by clicking on the Prices tab and click Add.
7. Set the currency to “Gold”, (See [Currencies](../economy/currencies.md)) then set the amount (e.g. 250) and save the item.
8. If you want your item to have a Real Money (RM) Cost, then set that value as well.
9. Repeat Steps 4 – 8 as for each new Item you wish to create.

You can also save and upload catalogs as JSON files through the Game Manager or the GetCatalogItems and SetCatalogItems APIs, respectively.

## Uploading a Catalog

To upload a a JSON file to create a catalog, perform the following steps:

1. Select your game in Game Manager.
2. Click **Economy**.
3. Click **Catalogs**.
4. Click **Upload JSON**.
5. Select your JSON file and click **Upload**.

> [!NOTE]
> The JSON code in ExampleCatalog.json represents the catalog you just created.
