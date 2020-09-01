---
title: Transitioning to Modern Pricing
author: mckmoffatt & nakong

description: Describes how to transition from the legacy pricing plan to the modern pricing plan.
ms.author: nakong
ms.date: 09/01/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, pricing, transition, modern pricing, legacy pricing, move, change
ms.localizationpriority: high
---
# Updating an Account to Modern Pricing

 PlayFab customers on the legacy pricing model (MAU-based pricing) must update their account plans to the modern pricing model (Usage-based pricing) prior to 11/01/2020 at which time MAU-based pricing will no longer be supported.

Customers can understand changes to monthly costs and initiate their account's pricing update through the self-serve experience in Game Manager (detailed below) or through contacting the PlayFab team.


## Understanding how Existing Title Usage Translates into Modern Pricing Costs
 For some accounts moving to modern pricing, monthly costs may change due to a title's usage of PlayFab features. To understand monthly costs on a modern pricing scale, customers can utilize the [Billing Summary](../pricing/billingDetails.md) and [Pricing](https://playfab.com/pricing/) page.

 **The Billing Summary page** will allow customers to view [meter](../pricing/Meters/meters.md) usage by account or by title. Customers can also use the page to understand if existing title usage is included in the modern pricing base rate.

**The Pricing page** will allow customers to view the cost of meter usage.


## Self-Serve Account Transition to Modern Pricing

1. Log in to PlayFab.com.

2. From the "My Studios and Titles" page, select **Update Account** on the navigation bar of the Studio whose billing account will move to usage-based pricing.

3. If the Studio's billing account is on the Essentials tier and all titles fall below the [development mode](../pricing/development-mode.md) limits, a pop-up will appear prompting you to complete the update to usage-based pricing. This completes the flow, otherwise move on to step 4.

4. If the Studio's billing account is on the Indie or Pro tier or if a title exceeds the modern pricing [development mode](../pricing/development-mode.md) limits, the **Update Account** page will appear. The **Update Account** page is where customers can see which Studios are connected to the billing account that is moving to usage-based pricing. When a billing account is updated to usage-based pricing, all linked Studios and corresponding titles will move automatically update.

5. Select "Next" to move through the contact information and payment information tabs. If the billing account is on an **Indie or Pro** MAU-based pricing plan, contact information and payment information will be pre-populated.
If the billing account is on an **Essentials** pricing plan, entering contact information and payment information is optional as long as no corresponding titles exceed the designated player limit for usage-based pricing. See[development mode](../pricing/development-mode.md) titles to learn more.

6. Select **Confirm this Plan** from the review stage to complete the billing account update to usage-based pricing.

## FAQ

**How do I know if my title is eligible for Development mode in the modern pricing plan?**
From the "Update Pricing" page, within the tab "Update Studios and Titles on this Plan", customers can view the number of players within each title. If a title is over the [development mode](../pricing/development-mode.md) limit, the right-hand side of the title bar will say "Launch" to indicate that the title must be launched when moving to Modern Pricing. When a title is launched, title meter usage will begin to accrue to what is included in the account plan's base rate. Any title usage over the included amount will be charged to the account.

**What do I do if my title has too many players to qualify for Development mode?**
From the Title page, customers can select the "Players" tab on the left-hand side of the page. Within the "Players" page, customers can delete players within a title until they are under the [development mode](../pricing/development-mode.md) limit.
