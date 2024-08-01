---
title: Transitioning to Modern Pricing
author: nathankong-microsoft
description: Describes how to transition from the legacy pricing plan to the modern pricing plan.
ms.author: joanlee
ms.date: 10/15/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing, transition, modern pricing, legacy pricing, move, change
ms.localizationpriority: medium
---
# Updating an Account to Modern Pricing

 PlayFab customers on the legacy pricing model (MAU-based pricing) must update their account plans to the modern pricing model (Usage-based pricing) prior to 11/01/2020 at which time MAU-based pricing will no longer be supported.

Customers can understand changes to monthly costs and initiate their account's pricing update through the self-serve experience in Game Manager (detailed below) or through contacting the PlayFab team.


## Understanding how Existing Title Usage Translates into Modern Pricing Costs
 For some accounts moving to modern pricing, monthly costs may change due to a title's usage of PlayFab features. To understand monthly costs on a modern pricing scale, customers can utilize the [Billing Summary](../pricing/billingDetails.md) and [Pricing](https://playfab.com/pricing/) page.

 **The Billing Summary page** will allow customers to view [meter](../pricing/Meters/meters.md) usage by account or by title. Customers can also use the page to understand if existing title usage is included in the modern pricing base rate.

**The Pricing page** will allow customers to view the cost of meter usage.

## Self-Serve Account Transition to Modern Pricing

1. Sign in to [Game Manager](https://developer.playfab.com).

2. From the **My Studios and Titles** page, select **Update Pricing** on the navigation bar of the Studio whose billing account will move to usage-based pricing.

3. You will be directed to the **Plan Recommendation** page. On this page, you can see your rolling-thirty-day usage. Based upon your historic usage, we will calculate your estimate bill for your current plan and recommend the most cost-savings plan.

4. Select **Proceed with plan** to move to the **Plan Selection** page to pick a plan.  The recommended plan will be automatically selected, but you can select any plan you are eligible for.

5. Select **Next** to move through the contact information and payment information tabs.

6. Select **Confirm this Plan** from the review stage to complete the billing account update to usage-based pricing.

To learn more about plans, see [Account Upgrades](../pricing/account-upgrades.md)

## FAQ

#### Q. What will happen to my account on November 1st, 2020?
**Customers already on usage-based pricing plans (Standard Plan, Premium Plan)**\
Nothing! You have already transitioned to our new pricing and you should experience business-as-usual.

**Essentials customers**\
Essentials customers will be transitioned to the Free to Start Plan with their titles in Development Mode. As long as your titles are in Development Mode, you can continue using PlayFab for free.  You can have up to 10 titles in Development Mode at a time, and Development Mode allows up to 100,000 users per title.

Once your first title reaches 100,000 users, you will need to upgrade your plan to add more users to your title.  Once you have upgraded, you will need to launch your title in order to have unlimited users. 

If your account has a title with over 100k users, you will not be able to add any more users until you add a payment plan or delete users to 100k or fewer.  For some titles, this may disrupt the availability of your game for new players, so you should understand which of your current titles are approaching or are above 100k users to understand which are at risk.

If your account has more than 10 titles, you will not be able to add any new titles until you have either deleted titles to total under 10, or you have upgraded your plan and launched titles so that you have no more than 10 in Dev Mode.

We recommend selecting a plan prior to the transition date of November 1st, 2020 so that your game availability is not disrupted.

**Indie & Pro Tier customers**\
Indie and Pro customers will be automatically transitioned to the Standard plan, which has a monthly minimum of $99, and includes monthly meters valued at $400 USD along with Gold Level Support, which is the same support level as you received in the Indie and Pro Tiers.  Therefore, you will continue to have Public Forum access as well as, be able to submit support tickets as needed.

Those customers who need Platinum Support with emergency escalations or estimate heavier usage will be able to self-upgrade (available in October) to the Premium Plan which includes monthly meters valued at $8,000 USD for only $1,999 USD per month.

Customers that estimate low title usage or who do not need ticketed support, can select the Pay-as-you-Go plan with no monthly minimum (available in October).  You will still have access to the Public Forums and can upgrade your plan as you grow.

For more information, go to [Accessing PlayFab technical support](./paidtechnicalsupport.md).

#### Q. I have not selected a plan, will my account be shut off?
No. Based on your current tier, your titles will either be transitioned to Dev Mode or the Standard Plan.  However, If you are an Essentials customers with titles with over 100k users, you will need to select a plan in order for new users to play your game. We recommend understanding which of your titles are currently exceeding 100k users so that you can select that plan that works best for you prior to the transition date of November 1, 2020.

#### Q. I am an Enterprise customer. What will happen to my account?

Enterprise accounts will be migrated to the new pricing plans according to their contract renewal date and will not automatically transition on November 1. If you have questions about your Enterprise contract, email us at: [sales@playfab.com](mailto:sales@playfab.com)

#### Q. How can I understand the costs for my studio prior to the transition?

To preview the impact of moving your titles to consumption-based pricing, go to the **Billing Summary** page by selecting **Studio settings** from the **My Studios and Titles** homepage.

#### Q. It looks like I might save money with the new pricing. Do I have to wait until Nov. 1 before I make the transition?

No, you can upgrade your account to a new pricing plan at any time. To do so, select **Update Pricing** from your **My Studios and Titles** homepage or Title's Dashboard.

#### Q: I can see my total meter usage in the billing summary, and I’ve read the best practices doc, but I’m still not sure how to figure out where the costs are coming from in my title. What tools are available to figure out which specific API calls are the ones costing me the most?

In addition to the API graph on the main dashboard of your game, which shows the overall traffic and can be filtered to show each individual call and response, there’s also the Daily API Usage Details Report in the **Dashboards > Reports** section of the Game Manager for your title. That report breaks down, on a per-hour basis, the API calls made in the title, as well as the average and total bytes sent/returned hourly. So, for example, the total calls to **UpdateUserData** will be shown for each hour, along with the total bytes sent, which allows you to quickly calculate the expected meter usage (given that a Profile Write ticks the meter at a per KB rate for data written).
