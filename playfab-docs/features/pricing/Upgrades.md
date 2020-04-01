---
title: Account Upgrades and Title Launches
author: mckmoffatt
description: Describes how to upgrade an account and launch a title in the new Game Manager experience.
ms.author: mcelliot
ms.date: 01/24/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, pricing, upgrade, upgrades, launch, live
ROBOTS: NOINDEX, NOFOLLOW
ms.localizationpriority: medium
---

# Account Upgrades and Title Launches

Customers can upgrade their account plan and launch titles using the self-service upgrade and launch experiences found in Game Manager.

## Account Plans 
There are three plan options:
1. **FREE :** A free account has no cost to the customer. Studios that belong to free accounts may only contain titles that are in [development mode](../pricing/Development-Mode.md).
2. **STANDARD (Paid Account Plan) :** A standard account has a monthly base rate (charged to the account owner) and private support options ([Paid Technical Support](../pricing/PaidTechnicalSupport.md)). The base rate includes meter usage amounts that live titles associated with the account may access. Once the included meter amounts have been used, the account will be charged for any continued monthly consumption. An account can upgrade to a Standard plan through Game Manager.
3. **ENTERPRISE (Paid Account Plan) :** An Enterprise account has a monthly base rate (charged to the account owner) and private support channels that offer 24/7 assistance. The base rate includes specified meter usage amounts that live titles associated with the account may access. Once the included meter amounts have been used, the account will be charged for any continued monthly consumption. An account can upgrade to an Enterprise plan through contacting the [PlayFab Team](https://playfab.com/contact/) .

>[!Note]
> All PlayFab account plans adhere to the [PlayFab Terms of Service](https://playfab.com/terms/).

## Title Modes
A PlayFab title has two possible modes:
1. **DEVELOPMENT MODE :** A Development title has no cost to the customer. Use Development mode to experiment with most PlayFab offerings. A title in development mode is subject to the specific player count and meter usage limits determined by PlayFab. For more information about included limits, see [developement mode](../pricing/Development-Mode.md).
2. **LIVE MODE :** A live title is charged to the customer on a Pay-as-you-Go basis. Any meter usage over what is included in the account plan's base rate results in charges per meter consumed. For more information, see [Meters](../pricing/Meters/meters.md).

> [!NOTE]
> The base rate's included consumption is cumulative across titles linked to an account.

## Understanding the Account-Studio-Title Relationship
An account is linked to one Studio and a Studio may be linked to many titles. Upgrades are executed at the account level and launches are executed at the Title level.
![Image: Account-Studio-Title Relationship](pricingV2-media/AccountStudioTitleRelationship.png)


## Upgrading an Account

Upgrading an account is a permanent action. The account cannot return to a free account plan after the plan upgrade is completed.

### Upgrading from Free to Standard
Any account that is on a free plan is eligible to upgrade to a Standard plan. Use the following steps to upgrade an account. The following steps will allow a customer to upgrade an account.

Upgrading an account will upgrade all studios owned by the account.

1. Log in to [PlayFab.com](www.PlayFab.com).

2. On the My Studio page, locate the header of a Studio that is linked to the account to be upgraded. Select Upgrade Account.
![Image: My Studios View](pricingV2-media/upgrade-myStudios.png)

3. On the "Upgrade Account" page, the customer has the option to launch titles in conjunction with the account upgrade. Any titles to launch should be selected. The "Next" button will move to the "Contact Information" tab.
![Image: Add Pricing Plan View](pricingV2-media/upgrade-addpricingplan-accountTitle.png)

4. Enter Contact Information and Payment Information to move to the **Review** page. Select **Confirm this Plan** to complete the account upgrade.

After an account is upgraded to a Standard plan, the provided payment instrument is charged a monthly base rate per account in addition to usage charges for launched titles.

### Upgrading from Standard to Enterprise

Any account that is on a Free plan or Standard plan is eligible to upgrade to an Enterprise account plan. The PlayFab team must be contacted to upgrade to an Enterprise account plan.

[Contact PlayFab](https://playfab.com/contact/)

## Launching a title

> [!WARNING]
> Launching a title is a permanent action. The title cannot return to Development mode after the launch is completed.

To be eligible for launch, a title must be linked to a Studio with a paid account plan.

### Launching a Title within a Free Account Plan
Titles may only be launched within Studios owned by paid accounts.Follow the steps listed under Upgrading from Free to Standard to launch a title in conjunction with upgrading an account.

### Launching a Title within a Paid Account Plan
To launch a title within a paid account plan:

1. Log in to [PlayFab.com](www.PlayFab.com)

2. Navigate to the **My Studios** page and select the title to launch.

3. On the title page, select the down arrow on the top left title bar to open the drop-down menu.

![Image: Title Bar Drop Down](pricingV2-media/launch-menu.png)

4. From the drop down menu, select **Launch Title**. If the title is linked to a free account plan, **Launch Title** takes you to the account upgrade flow described in the **Upgrading from Free to Standard** section.

5. A pop-up will prompt the customer to confirm the title launch. Once selected, the launch is complete and the title is no longer bound by [Development Mode](../pricing/Development-Mode.md) limits.
![Image: Launch Screen](pricingV2-media/launch-popup.png)

## FAQ

**How do I know which subscription plan my account and its associated studios are currently on?**
There are two ways to know which plan your account is currently on.

**1. Presence of Upgrade Account Button:**  Navigate to the "My Studios" page. If a Studio displays the "Upgrade Account" button, the Studio and its associated account are currently free and have no account plan.
![Image: Free Account](pricingV2-media/FreeAccount.png)

**2. Base Rate Amount:** While on the "My Studios" page, if no "Upgrade Account" button is present, navigate to the Billing Summary page. A lack of the "Upgrade Account" button means that the Studio and its associated account are on a paid subscription plan.

![Image: Billing Summary Link](pricingV2-media/billingsummarylink.png)

The amount of the base rate will represent the paid subscription plan of an account. A Base Rate of **$99** indicates that the Studio and its associated account are on the **Standard plan**. A base rate of **$1999** indicates that the Studio and its associated account are on the **Premium plan**. The Premium plan can only be acquired through contacting PlayFab.


**How do I know which subscription plan I am upgrading my account to?**
All accounts upgraded through Game Manager are automatically upgraded to the Standard plan, as indicated by the agreed-to base rate within the Upgrade flow.
![Image: Base Rate in Upgrade Flow](pricingV2-media/baseRateUpgrade.png)

To upgrade to a Premium plan, please [contact PlayFab](https://docs.microsoft.com/gaming/playfab/features/pricing/paidtechnicalsupport).