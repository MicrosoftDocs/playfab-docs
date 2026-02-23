---
title:  Player Custom Properties Quickstart
author: sofiamarinv
description: Get started using Player Custom Properties
ms.author: sofiamarin
ms.date: 10/18/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player custom properties, custom properties, segmentation, advanced segmentation, data, analytics
ms.localizationpriority: medium
---

# Player Custom Properties Quickstart (Public Preview)

> [!NOTE]
> The Player Custom Properties feature is in public preview. While the core functionality is in place, we’re refining the experience based on feedback and usage patterns.

To get started using Player Custom Properties, follow the guides here. 

## Creating, modifying, deleting Player Custom Properties in Game Manager 

 Sign in to [Game Manager](https://developer.playfab.com).
- Go to the **Players** page and select a player.
- Select the **Player Data** tab. 
- Select the **Custom** subtab.

![Navigate to Player Custom Properties](../../../data-analytics/acting-data/media/navigate-to-custom-properties.png)

### Create a new custom property: 

- Select **Add**.
- Fill the **Key** and **Value** fields.
- Select the custom property **Type** from the dropdown.
- Notice the **New** label at the bottom increase by the number of custom properties you add.
- Select **Save player data** 

![Create new Player Custom Properties](../../../data-analytics/acting-data/media/create-new-custom-property.png)

### Remove a custom property: 

- Select the **Trash can** on the left side of the custom property.
- Notice the **Removed** label at the bottom increase by the number of custom properties you remove.
- Select **Save player data**.

![Remove Player Custom Properties](../../../data-analytics/acting-data/media/remove-custom-property.png)

![Remove Player Custom Properties result](../../../data-analytics/acting-data/media/remove-custom-property-result.png)

To modify a custom property: 
- Select **Key** and **Value** fields and change the values in them.
- Notice the **Changed** label at the bottom increase by the number of custom properties you modify.
- Select **Save player data**.

![Modify Player Custom Properties](../../../data-analytics/acting-data/media/modify-custom-property.png)

![Modify Player Custom Properties result](../../../data-analytics/acting-data/media/modify-custom-property-result.png)

## Creating and modifying custom properties on a player via PlayStream Rules 

> [!NOTE] 
> V1 and V2 PlayStream events can be used to set or update custom properties.

- Sign in to [Game Manager](https://developer.playfab.com).
- Go to the **Automation** page and select the **Rules** tab.
- Select the **New rule** button on the top right of the page.
- Populate the **Name** and **Event** type text boxes. V1 events are prefixed with **com.playfab.** or **title.** whereas v2 events are prefixed with **playfab.** or **custom.**
- If desired, set any **Conditions** for triggering this rule based on the event's contents.
- To create a custom property, under **Actions** select **Adding custom property** and populate the fields.
- To modify a custom property, under **Actions** select **Update player custom properties**. The action accepts an expandable list of properties as shown below.
- Select **Save action**.

![Create and modify Player Custom Properties with PlayStream rules](../../../data-analytics/acting-data/media/custom-properties-with-playstream-rules.png)

> [!NOTE]
> If the event chosen for the rule is a standard event, you'll have a list of available properties to choose from. If the event is a custom event, then the input box will be an open text field.
