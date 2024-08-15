---
title: Billing Summary + Base Rate
author: joannaleecy
description: Describes the billing summary page.
ms.author: joanlee
ms.date: 07/15/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing, billing, bill, invoice, meter, meters
ms.localizationpriority: medium
---

# Billing Summary and Base Rate

Admin or billing permissions are required to view the **Billing Summary** page.

The billing details page provides a daily snapshot of your month-to-date estimate charges. Use the information on this page to estimate what your bill will look like at the end of the month and view past months to understand trends and comparisons. The billing details page helps you determine what the biggest consumers of your metered resources are and gives you information that you can use to reduce your charges in subsequent months.

> [!NOTE]
> The values reported on the billing summary page are an **estimate** of usage and associated costs for an account. The amount shown might not depict the final invoice amount charged to an account.

To view the billing details page for your studio navigate to the My Studios and Titles page. Click the ellipsis on the right side of your studio, and then selecting the Billing summary option in the drop-down.

## Billing Summary Overview

![Screenshot of Billing Details](pricingV2-media/BillingSummary.png "Billing Details")

1. **Last Refreshed Date**
   * This is the date or time that the billing summary page was last refreshed. The billing details page is refreshed on a daily basis.
2. **Selected Month**
   * This is the month that the listed consumption and charges cover. Use the Month Filter (8) to change the selected month.
3. **Month-To-Date (MTD) Estimated Charge**
   * This is the daily snapshot of estimated total charges that your studio has accrued during the selected calendar month.
4. **The Fine Print**
    * Only use the **Billing Summary** page as an estimate for your month-to-date charges. Some meters have a 48+ hour delay and the **Billing Summary** page does not include all chargeable items (For example, Add-ons). On the first of the current month, you can view the final estimate for the previous month's charges (excluding taxes and delayed meter charges), and on the second of the current month, you can view the first estimate for the current month's usage and costs.
5. **.csv Download**
   * You can download the **Billing Summary** view to .csv for further analysis. The "Download Summary" provides the same granularity as the **Billing Summary** page. The "Download daily" provides the daily breakdown of usage.
   > [!NOTE]
   > As the storage meters are billed based off average consumption instead of total consumption, the data is represented differently. The first day of data contains the MTD average, and the remainder of the days are purposefully left blank.
6. **Contact Information**
   * This is the contact information we use to send you an invoice. This can be changed by navigating to the **Billing Information** page.
7. **Title Filter**
   * Use the **Title** filter to understand consumption and apportioned cost by title. Namespace events are counted in the "All" calculation, but aren't currently available to drill down (as they aren't tied to a title). Development mode titles are not charged to the account and do not display cost data.
8. **Month Filter**
   * Use this filter to choose the month to display. All billing summary data from the time the account was updated to usage-based pricing is visible through the billing summary page.
9. **Meter Category**
   * The **Pay as you Go** section buckets the full set of meters into logical categories. You can find the full set of meters in [meter documentation](../pricing/Meters/meters.md).
10. **Meter**
    * This is a billable meter that at least one of your titles is consuming. You only see meters that you are using. For a full list of meters, see [meter documentation](../pricing/Meters/meters.md).
11. **Usage**
    * This column provides estimated, rounded usage (for readability purposes) for each tier/SKU, as well as the aggregated amount. To see the exact usage, download the .csv (5).
12. **Rate**
    * This column provides the rounded rates (for readability purposes) for each tier/SKU. To see the exact rates, please download the .csv (5).
13. **Cost**
    * This column provides the estimated cost for each tier/SKU, as well as the aggregated amount.
14. **Description**
    * Each meter provides a brief description in the billing summary page. You can find a  more detailed explanation of the meters in [meter documentation](../pricing/Meters/meters.md).

## Understanding the Base Rate

**Base Rate:** The base rate is the standard, monthly rate for paid accounts.

The base rate charge includes:

1. **Meter usage** amounts that are specified at [PlayFab pricing](https://www.playfab.com/pricing). Once meter usage across live titles associated to an account has surpassed the included amounts (above), an account's live title usage will be charged based on the meter rates found at [PlayFab pricing](https://www.playfab.com/pricing) (also listed under the "Rate" column on the Billing Summary page). These costs are referred to as "Pay-As-You-Go" charges.

    > [!NOTE]
    > Titles in [Development Mode](../pricing/development-mode.md) are not counted against included base rate usage.

2. **[Technical support](../pricing/PaidTechnicalSupport.md)** that is determined by the [account level](../pricing/account-upgrades.md).

## Additional Section Definitions

**Pay-As-You-Go Charges:** Pay-As-You-Go charges are the cost of individual meter usage per title in an account that exceed usage amounts that are part of the plan. The per-meter prices can be found at [PlayFab pricing](https://www.playfab.com/pricing) or under the "Rate" column on the billing summary page.

**Additional Charges:** Additional charges include any charges not directly tied to the meter-usage pricing plan. For example, charges for MPS and Add-Ons may appear in the additional charges section.

## Learn More

> [Multiplayer Server Pricing](../multiplayer/servers/billing-for-thunderhead.md)
>
> [Party Pricing](../multiplayer/networking/pricing.md)
