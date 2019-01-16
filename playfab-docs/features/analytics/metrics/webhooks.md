---
title: Webhooks
author: v-thopra
description: Provides an overview of the Webhook panel in Game Manager, and describes how to access and configure a Webhook.
ms.author: v-thopra
ms.date: 31/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, webhooks, events
ms.localizationpriority: medium
---

# Webhooks

In complex systems you may want to provide additional **Event** handling on your custom server.

**PlayFab** offers **Webhooks** to achieve this. Whenever a new **Event** is emitted, it can be forwarded to your server by making a **POST** request to your custom web endpoint, and the **Event** data is passed as the **JSON** body of the request.

## Accessing Webhooks

To access the **Webhooks** panel in the **PlayFab Game Manager**:

- Select **Analytics (1)** in the sidebar menu.
- Then select the **Webhooks** tab **(2)**.

![Game Manager - Analytics - Webhooks](media/tutorials/game-manager-analytics-webhooks.png)  

## Overview of the Webhooks panel

The image shown below provides an overview of the Webhooks panel.

1. The **New Webhook** button allows you to create and configure a new **Webhook**.
2. The **Webhook Name** area can be used to access and configure the **Webhook**.
3. The **Status** area shows whether a **Webhook** is currently **enabled**.
4. The Failing Since area shows when a **Webhook88 endpoint stopped returning **OK** responses.
5. When one or more **Webhooks** are selected, you can use the **Delete** button to permanently remove them.

![Game Manager - Analytics - Webhooks panel](media/tutorials/game-manager-analytics-webhooks-panel.png)  

## Configuring a Webhook

The image shown below describes the options for configuring a **Webhook**.

1. Use the **Name** field to create a **Webhook Name** that will uniquely identify the **Webhook**.
2. Set up the **Endpoint URI**. This **URI** will be hit when the **Event** occurs.
3. You may set the **Webhook** to be **Enabled** or **Disabled**. This allows you to temporarily suspend a **Webhook** without completely removing (deleting) it from the system.
4. Set up the **Filters** to only process the **Events** you need. You can **Filter** by **Event Name**, **Event Source**, and **PlayerID**.

> [!NOTE]
> You can have several **Filters** per **Group**, but each **Filter** setting must be matched for the **Event** to fall into the **Filter Group**.
5. You may define several **Filter Groups** to include different **Filters**. **Events** must fall into at least *one* **Group** to be passed to the **Webhook**.

![Game Manager - Analytics - Webhooks - Webhook Configuration](media/tutorials/game-manager-analytics-webhook-configuration.png)  
