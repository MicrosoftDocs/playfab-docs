---
title: "Evaluation Mode"
description: "Explore PlayFab services in Evaluation Mode, learn its 1,000-player lifetime limit, and move beyond it with XBOX Partner benefits or usage-based billing."
author: joannaleecy
ms.author: jenelleb
ms.topic: article
ms.service: azure-playfab
ms.localizationpriority: medium
keywords: playfab, pricing, evaluation mode, development mode, title, meter, meters
ms.date: '11/19/2026'
---

# Evaluation Mode

Evaluation Mode is a limited, no-charge title state for exploring PlayFab services, with a lifetime limit of 1,000 unique player accounts per title. New PlayFab titles begin in this state.

Use Evaluation Mode when you want to explore a PlayFab service and determine whether it meets your needs. When you're ready to move beyond exploration, transition out of Evaluation Mode to use production-scale capacity and features beyond Evaluation Mode limits.

If your game is coming to XBOX, [link a qualifying Partner Center product](../identity/player-identity/platform-specific-authentication/xbox-live-add-on.md) to receive [XBOX Partner benefits](../get-started/foundation-benefits.md). These benefits include the foundational set of PlayFab services at no additional cost. Enable usage-based billing for additional paid features and capacity.

## Identify an Evaluation title

Game Manager displays an **Evaluation** label on the title in the studio title list and within the title's navigation. You can also review the title's current limits in Game Manager.

## Evaluation Mode limits

An Evaluation title is limited to 1,000 lifetime unique player accounts. The limit counts every player account ever created for the title. It isn't a monthly active-user or daily active-user limit. After the title reaches this limit, PlayFab rejects requests to create additional player accounts.

> [!NOTE]
> While a title remains in Evaluation Mode, PlayFab doesn't count usage of services available in Evaluation Mode toward the title's billable meters.

The following example shows how PlayFab treats usage for two fictional titles:

| Title | Billing state | Example PlayStream usage | Billing treatment |
| --- | --- | ---: | --- |
| Fun Game | Usage-based billing | 1,000,000 events | Charged according to the applicable [meter rate](Meters/meters.md) |
| Fun Game 2: The Return of Fun | Evaluation Mode | 100,000 events | No usage charge while the title remains within Evaluation limits |

This example illustrates billing treatment only. Both titles remain subject to service-specific limits and API rate limits.

Evaluation titles also have service-specific operational and API limits. To view the current limits for a title, open the title in Game Manager and select **Settings** > **Limits**. For details about how API limits are applied, see [API rate limits](../live-service-management/service-gateway/throttling/what-is-throttling.md). Features that aren't available in Evaluation Mode, including CloudScript (classic), [Multiplayer Servers](../multiplayer/servers/index.md), Insights, automation and experimentation, and legacy APIs, aren't listed as allowances. Enable usage-based billing to access paid features and capacity.

> [!IMPORTANT]
> Requests to APIs that aren't available in Evaluation Mode return a permissions error and don't complete.

## Move beyond Evaluation Mode

When you're ready to move beyond Evaluation limits, choose one or both of the following options:

- **Enable usage-based billing.** Attach a payment instrument to the studio and turn on usage-based billing for the title. The title can then use paid PlayFab services and additional capacity. PlayFab charges usage according to the applicable [meters and rates](Meters/meters.md). There is no separate **Launch Title** step.
- **Link an XBOX product.** If your game is coming to XBOX, [link its Partner Center product to the PlayFab title](../identity/player-identity/platform-specific-authentication/xbox-live-add-on.md). A qualifying linked title receives the foundational set of PlayFab services at no additional cost through [XBOX Partner benefits](../get-started/foundation-benefits.md). A payment instrument isn't required when the title uses only those included services.
- **Use both.** An XBOX-linked title can also enable usage-based billing. The title receives its included XBOX Partner benefits. PlayFab charges paid features and usage outside those benefits according to the applicable meters and rates.

## Frequently asked questions

### Do I need to launch the title in Game Manager?

No. You don't need to use a separate **Launch Title** action. To move beyond Evaluation Mode, enable usage-based billing, link a qualifying XBOX product, or use both.

### Does linking an XBOX product enable paid PlayFab features?

Linking a qualifying XBOX product provides the foundational set of PlayFab services at no additional cost through XBOX Partner benefits. Features and capacity outside those benefits require usage-based billing.

### Is Multiplayer Servers available in Evaluation Mode?

No. Multiplayer Servers isn't available in Evaluation Mode. To use Multiplayer Servers, enable usage-based billing. PlayFab charges compute, storage, and network usage according to the applicable rates.

## See also

- [XBOX Partner benefits](../get-started/foundation-benefits.md)
- [Link an XBOX product to a PlayFab title](../identity/player-identity/platform-specific-authentication/xbox-live-add-on.md)
