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

This tutorial describes the **Catalogs** tab in the **Economy** section in **Game Manager**. You can use **Catalogs** to define **Items** that the **Player** can purchase or that you can reward to a **Player**.

## What is a Catalog?

Many games offer the player items for purchase such as a **Shield**, a **Level-unlock**, or a **Power-up**. These items are specified in a **Catalog** in units of either **Virtual Currency** or **Real money**. 

Before the **Player** can purchase an **Item** from any **Catalog**, you must create the **Items** that you want to populate it.

The **Catalog API**s support many strategies for **Item** purchasing, such as simple **Real Money** or **Virtual Currency** purchases of **Items**, **triggered item grants** based on buying another **Item**, **locked** (with a potentially purchasable **Key**) and **unlocked boxes**, **random result tables**, and **non-purchasable items** that are granted based on **Events** within a **Game**.

> [!NOTE]
> In **Catalogs**, the **Currency Type** of **RM** is reserved for **Real Money**, which is in **cents USD**. 

> [!TIP]
> $1.99 is represented as **RM 199**.

## Field reference

This section describes each **Field** you see in the **Catalogs** tab. When you first create a **Title**, you have no **Catalogs**. You won't see any **Fields** in the **Catalogs** tab until you create a **Catalog**, as shown in the example provided following this section.

The **Fields** are presented in **Groups**, which you will encounter as you select the tab. Any values you see in the examples provided are those created by following the step-by-step instructions for creating a **Catalog**.

### Add Catalog Fields

These are the **Fields** you encounter after you select **Add Catalog** from the main **Catalogs** tab. The only **Field**, **Catalog Version (Name)**, is required.

![Game Manager - Add Catalog](media/tutorials/game-manager-add-catalog.png)  

- **Catalog Version (Name)**
  This required **Field** is the name of your **Catlog** that is shown in the **Catalogs** tab as the **Catalog Version**.

### Add New Item Fields

These are the **Fields** you encounter after you select **Add New Item** in the **Catalog**.

![Game Manager - Add Catalog Item](media/tutorials/game-manager-add-catalog-item.png)  

### Add New Item, PROPERTIES Fields

These are the **Fields** in the **PROPERTIES** section of a new **Catalog Item**. **Item ID** is the only required **Field**.

![Game Manager - Catalog Item Properties](media/tutorials/game-manager-catalog-item-properties.png)

- **Item ID**:
  This required **Field** is the unique identifier for the **Item** within the **Catalog**. **Item ID** must be unique within the **Catalog**, but you can have multiple versions containing **Items** with the same **Item ID**.

- **Display Name**:
  This optional **Field** is the name displayed for the **Catalog item**. One common usage is when you want to offer the **Item** in your in-**Game Store**. Display **Names** do not need to be unique.

- **Usage Count**:
  This optional **Field** is the number of times an **Item** can be used by a **Player**, using the **ConsumeItem Client-API** call. For example, the **Item** could be a reward doubler that can be used three times.

- **Item Class**:
  This optional **Field** is identifier that you can use to help manage your **Catalog Items**.

- **Description**:
  This optional **Field** is the description for the **Catalog Item**. One common usage is when you want to offer the **Item** in your in-**Game Store**.

- **Usage Period (Seconds)**:
  This is the period of time between when the **Item** is created, and when the **Item** is auto-revoked. For example, your **Catalog Item** could be an XP boost that is active for 30 minutes after the **Player** receives it.

  > [!NOTE]
  > You can specify the period in **seconds**, **minutes**, **hours**, **days**, **weeks**, **months**, or **years**.

- **Edit Tags (Comma Separated List)**:
  This optional **Field** contains tags that you can use to organize your **Catalog Items**. Like the **Field Name** implies, the tags are text strings, separated by commas.

- **Usage Period Group**:
  This optional **Field** is identifies a **Group** of **Items** where their usage period values are accumulated, and they share the result.  When the specified period has elapsed, all of the **Items** in the **Group** are removed. This can be used to recharge a **Player’s** power-ups if they purchase another power-up of the same type before their current ones have expired.

- **Stackable Item checkbox**:
  Marking this **Item** as **Stackable** allows only one **Item** of this type in the **Inventory** and increments the quantity count of the **Item**.

- **Tradeable Item checkbox**:
  Marking an **Item** as **Tradeable** makes it **Tradeable** via the **Trade API** calls.

### Add New Item, ATTRIBUTES Fields

These are the **Fields** in the **ATTRIBUTES** section of a new **Catalog Item**. **Attributes** are **Key/Value Pairs** (**KVPs**). Only the **Key** is required for each **Attribute**.

![Game Manager - Catalog Item Attributes](media/tutorials/game-manager-catalog-item-attributes.png)

- **Key**:
  This required **Field** is the index to the **Attribute Value**.

- **Value**:
  This optional **Field** is the **Value** of the **Attribute**. If this is not set, the **Value** is **null**.

### Add New Item, PRICES Fields

These are the **Fields** in the **PRICES** section of a new **Catalog** item.

- **Currency**:
  Specifies the **Currency** used for the **Item's** cost. **Real Money (RM)** is always available as it's built into **PlayFab**.

- **Amount**:
  This required **Field** represents the units of **Currency** for the **Item's** cost.

![Game Manager - Catalog Item Prices](media/tutorials/game-manager-catalog-item-prices.png)

### Add New Item, BUNDLE/CONTAINER

These are the **Fields** in the **BUNDLE/CONTAINER** section of a new **Catalog Item**.

- **Container**:
  Select this checkbox to specify that the **Item** is a **Container**. This means the **Items** within are not immediately granted upon purchase, but must be unlocked to grant their contents. If this checkbox is *unselected*, the **Item** is a **Bundle** that can grant **Virtual Currency**, other **Items**, or random **Items** from a drop table when purchased or granted.

- **Key Item ID**:
  If **Container** is selected and this field has a value, players can only unlock the **Container** and add the contents to their inventory if they already have an item with this Item ID in their inventory. Unlocking the **Container** consumes the referenced item.

  If **Container** is selected *but this field has no value*, **Players** can unlock the **Container** at any time to add the **Container Items** to their **Inventory**. **Keyless Containers** are useful for granting specific rewards to **Players**, since it requires a **Player** action to acknowledge receipt of the **Item**, instead of adding it directly to the **Player’s Inventory**.

![Game Manager - Catalog Item Container](media/tutorials/game-manager-catalog-item-container.png)

The following icons indicate the type of **Item** in the **Bundle/Container**.

- The **Item** is an **Item**
  ![Game Manager - Catalog Type Item Icon](media/tutorials/game-manager-catalog-type-item-icon.png)

- The **Item** is a **Currency**
  ![Game Manager - Catalog Type Currency Icon](media/tutorials/game-manager-catalog-type-currency-icon.png)

- The **Item** is a **Table**
  ![Game Manager - Catalog Type Table Icon](media/tutorials/game-manager-catalog-type-table-icon.png)

### Add New Item, BUNDLE/CONTAINER, Add Item

These are the **Fields** in the **BUNDLE/CONTAINER, Add Item** section of a new **Catalog** item.

- **Item ID**:
  Identifies the **Item**, by **Catalog Item ID**, to add to the **Bundle/Container**. Although the current **Item** appears in the list, you cannot select it and save the **Bundle/Container**, as that would cause an infinite loop.

- **Qty.**:
  Specifies how many of the **Item** in **Item ID** to add to the **bundle/container**. You must specify a value greater than **0** (zero), otherwise the item is not added to the **bundle/container**.

![Game Manager - Catalog Item Container](media/tutorials/game-manager-catalog-item-container.png)

### Add New Item, BUNDLE/CONTAINER, Add Currency

These are the fields in the **BUNDLE/CONTAINER, Add Currency** section of a new catalog item.

- **Item ID**:
  Identifies the currency, by **Currency Code**, to add to the **Bundle/Container**.

- **Qty.**:
  Specifies how many of the item in Item ID to add to the **Bundle/Container**. You can specify a value of **0** (zero) or more.

![Game Manager - Catalog Item Container](media/tutorials/game-manager-catalog-item-container.png)

### Add New Item, BUNDLE/CONTAINER, Add Table

These are the **Fields** in the **BUNDLE/CONTAINER, Add Table** section of a new **Catalog Item**.

- **Item ID**:
  Identifies the drop table, by **Table ID**, to add to the **Bundle/Container**.

- **Qty.**:
  Specifies how many of the drop tables in **Item ID** to add to the **Bundle/Container**. You can specify a value of **0** (zero) or more.

![Game Manager - Catalog Item Container](media/tutorials/game-manager-catalog-item-container.png)

## Example of Catalog creation

To create a **Catalog**:

1. Select **Economy**.

2. Go to **Catalog**.
3. Select to **Add Catalog**.

4. Give your **Catalog** a **Name** (like *My Catalog*)
5. Select the **CREATE CATALOG** button.
6. Set the **Catalog** as the primary **Catalog** by selecting the **Primary Catalog** button.
7. Add a new **Item**. 
8. Select the **Add New Item** button, and then expand the **New Item** to set its properties.
     - Add some properties, such as:
         - **ItemID** (e.g. **shield_level_5**).
         - **Display Name** (e.g. **Level 5 Shield**).
         - **Description** (e.g. **Strong defense against projectile attacks**).
9. Set a price by selecting the **Prices** tab and then th **Add** button.
10. Set the **Currency** to **Gold**, (See [Currencies](../economy/currencies.md)).
. Then set the **Amount** (e.g. **250**) and **Save** the **Item**.
11. If you want your **Item** to have a **Real Money** (**RM**) cost, then set that **Value** as well.
12. Repeat Steps 4 – 8 for each new **Item** you wish to create.

> [!NOTE]
> You can also save and upload **Catalogs** as **JSON** files through the **Game Manager** or the **GetCatalogItems** and **SetCatalogItems APIs**, respectively.

## Uploading a Catalog

To upload a a **JSON** file to create a **Catalog**, perform the following steps:

- Select your **Game** in **Game Manager**.
- Select **Economy**.
- Select **Catalogs**.
- Select **Upload JSON**.
- Select your **JSON** file and select **Upload**.

> [!NOTE]
> The **JSON** code in **ExampleCatalog.json** represents the **Catalog** you just created.
