---
title: "Title states and transitions"
description: "Understand title access options, how new titles move beyond Evaluation Mode, and how existing Development Mode titles transition."
author: joannaleecy
ms.author: jenelleb
ms.topic: article
ms.service: azure-playfab
ms.localizationpriority: medium
keywords: playfab, pricing, titles, launch, live
ms.date: '11/19/2026'
---

# Title states and transitions

New PlayFab titles begin in **Evaluation Mode**, a limited, no-charge title state for exploring PlayFab services. The legacy **Launch** step isn't part of the new-title experience.

This article explains the access options available to new titles, how to move beyond Evaluation Mode, and transition considerations for existing Development Mode titles.

## Title access options

New PlayFab titles begin in Evaluation Mode. When a title needs features or capacity beyond Evaluation Mode limits, enable usage-based billing, link a qualifying XBOX product, or use both.

- **Evaluation Mode:** Explore PlayFab services before adopting them for your game. Evaluation titles have a lifetime limit of 1,000 unique player accounts and service-specific limits. No setup is required. See [Evaluation Mode](development-mode.md).
- **Usage-based billing:** Attach a payment instrument to the studio and enable usage-based billing for the title. The title can then use paid PlayFab features and additional capacity. PlayFab charges usage according to the applicable meters and rates.
- **XBOX Partner benefits:** If the game is coming to XBOX, [link a qualifying Partner Center product](../identity/player-identity/platform-specific-authentication/xbox-live-add-on.md). The title receives the foundational set of PlayFab services at no additional cost while the game continues to ship on the XBOX Store. See [XBOX Partner benefits](../get-started/mode-overview.md).

XBOX Partner benefits and usage-based billing are independent. A title can receive XBOX Partner benefits, enable usage-based billing, or use both.

## Existing Development Mode titles

Existing titles in Development Mode transition individually to per-title billing. Before transitioning a title, you can review its readiness, current bill, and estimated bill under the studio billing settings.

## Before moving beyond Evaluation Mode

- **Player cap:** Evaluation titles have a lifetime limit of 1,000 unique player accounts. Enable usage-based billing, link a qualifying XBOX product, or use both before the title reaches this limit.
- **Event configuration:** Service-generated PlayStream events can contribute to usage charges. If you don't need real-time processing or automation for an event, consider using lower-cost Telemetry or disabling unwanted events. See [Enable or disable service-generated events](../data-analytics/ingest-data/opt-in-events.md).
- **Acceptable use:** XBOX Partner benefits are subject to the [PlayFab Acceptable Use Policy](https://developer.microsoft.com/en-us/games/products/playfab/acceptable-use/).
