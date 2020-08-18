---
title: Insights for XBOX
author: McKenzie Elliott
description: Insights for Xbox information
ms.author: mcelliot
ms.date: 08/01/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Insights for Xbox

> [!Note]
Insights for XBOX is in Private Preview only and is not currently available to Third Party Partners of Microsoft. The date for Public Preview and General Availability have not yet been announced. Please contact [PlayFab support](https://playfab.com/contact/) if you have any questions.

Insights for Xbox pulls data from COSMOS and adds it to PlayFab’s Insights offering built on top of Azure Data Explorer (Kusto). Access to XBOX title data through PlayFab Insights allows you to query, segment, and analyze data through the PlayFab Game Manger.

Insights for XBOX (IFX) is a replacement for Central Analytics and has a primary goal of minimizing transition costs by matching the Central Analytics data schema is closely as possible.

## Onboarding to IFX

1. Identify the product ids you want to move to Xbox insights. You must have Partner Center permissions to these product ids in order to complete the add.
    - You can validate these permissions by logging into [Partner Center](https://partner.microsoft.com/en-US/), selecting the **Dashboard** option, and by selecting **Windows and XBOX** after logging in. Enter the product ID into the search bar. If you have permissions to the product ID, the product will appear in search results.

1. After determining the product ids you want to add, go to the Playfab Game Manager by logging in to [PlayFab.com](PlayFab.com).
1. From the **My Studios** page, select the title that you want to add products to.
1. From the **Title Overview** page, select the **Add-ons** option from the left navigation panel.
1. The **Insights for XBOX** add-on is now visible in the **Analytics** section of the **Add-ons** page.
1. If this is the first time you are adding products to the given title, select the checkbox to accept “GDPR compliance” and select **Install Xbox and Windows data** to complete acceptance of the terms. If this is not your first time adding products to the given title, skip this step.
1. In the **Product id** field, enter the product ids that you would like to add, separated by a comma. For example: *12abc*,*1234bcd*,*1355sjk*
1. Select **Add**. It may take a few minutes for permissions to validate before you see product details appear in the **Xbox title ids** and **Xbox product ids** tables. This action will generate usage data that may be charged by PlayFab Insights. See below for pricing details.
1. To add more products, repeat steps 7 & 8.
1. To delete products, select the **Remove** option next to the product ID that you would like to delete from IFX. When a product is deleted, past product data remains in IFX while future product data will no longer populate to IFX.

Certain individuals during the onboarding experience might be impacted with product permissions authentication issues with Partner Center. Please email the team at pfgaminginsights@microsoft.com if you are being impacted by this issue.



## Pricing

IFX will be billed as part of the Insights meter through the row writes and storage components of the Insights meter. In general the costs for IFX will be lower then the current cross charge for Central Analytics so this should be long term cost savings for your studio.