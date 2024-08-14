---
title: PlayFab Roadmap
author: shikha-tarware
description: PlayFab Roadmap
ms.author: shtarwar
ms.date: 04/03/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, roadmap, features, development
ms.localizationpriority: medium
---

# PlayFab Roadmap Update - April 2024

_Last Update: 4/4/2024_

At PlayFab, we are more committed than ever to the future development of our platform. Our team is constantly working to bring you new updates and features, and we're excited to share the latest updates to our roadmap with you. Your feedback is invaluable to us as we strive to tailor our platform to your evolving needs and aspirations. Whether you're already immersed in the PlayFab ecosystem or gearing up to integrate our services into your games, we're here to support you every step of the way. 

Our commitment to understanding your needs remains steadfast. Don't hesitate to reach out if you have any thoughts or questions. The PlayFab leadership also hosts a series of ‘Outside-In’ sessions where game studios meet with our team to help us understand your needs and goals. If you're interested in participating, reach out to us at: PFOutsideInRequest@microsoft.com.

So, let's dive into the exciting new features and enhancements, along with the future updates that await you!

## **What's New:**

### **_Game Integration_**

- **Services SDK for C/C++ cross-platform refresh:**  We made [the PlayFab Services SDK for C/C++](../sdks/c/index.md) available across all supported platforms to ensure a consistent development experience. This SDK is recommended for all new C++ projects, except the ones using a [game engine-specific SDK](../sdks/game-engines/index.yml), providing the following benefits compared to the [legacy cross-platform C++ SDK](../sdks/languages/index.yml):
    - Allows titles to control memory allocations when calling Playfab Services. To learn more, see [managing memory allocations to learn more](../sdks/c/memory.md).
    - Allows titles to gain full control of thread handling when calling Playfab Services. To learn more, see [making async calls in the PlayFab Services SDK](../sdks/c/async.md).
    - Portable C interface that allows maximum compatibility across platforms, compilers, and languages.
- **Configurable PlayFab event pipelines (C/C++ SDK):** Our [event pipelines](../sdks/c/event-pipeline/eventpipeline.md) within the [PlayFab Services SDK](../sdks/playfab-sdk-intro.md) now support various optimizations such as telemetry keys, compression, batching, and more. Allowing for better cost and resource utilization for PlayStream and telemetry event ingestion.
- **Compressed service response handling (C# and Unity SDK):** The [PlayFab Services SDK for C#](../sdks/c-sharp/index.md) and [PlayFab Services SDK for Unity](../sdks/unity3d/index.md) now supports compressed service responses with transparent decompression, enhancing performance and supporting new features like [Economy v2 TurboLoading](../features/economy-v2/inventory/turboloading.md).
- **Online Subsystem for Unreal Engine:** We refreshed the [PlayFab Multiplayer Online Subsystem](../features/multiplayer/networking/party-unreal-engine-oss-overview.md) for Unreal Engine (through 5.3, latest version), offering improvements across various areas such as platform invites, search keys, session settings, compilation, and certification compliance.

### **_Multiplayer Server and Multiplayer Experiences Services:_**
- **Matchmaking/Lobby/PubSub:** Added support for game_server entities to securely add data into client-owned lobbies, facilitating scenarios such as adding server connection details. The game_server entity joins similarly like another member and can access a new serverData field to store information for clients to read.
- **Request Party Service API:** Added new API, to learn more, see  [request party API](https://developer.microsoft.com/games/articles/2023/10/playfab-party-request-party-service-launch/).
- **Entity Stats & Leaderboards (Private Preview):** The much-anticipated "Leaderboards v2" is now in Private Preview. See [The Future of Stats and Leaderboards](../features/social/tournaments-leaderboards/index.md) to learn more. Already eager to join? Studios with a willingness to provide feedback are encouraged to request access via the following survey: [Private Preview Program Application](https://forms.office.com/r/RdiQuf9768).
- **VmStartupScript:** Enables customers to run custom scripts on VMs, streamlining tasks such as software installation, configuration adjustments, custom logging, etc., providing extensibility and flexibility. To learn more, see [Running custom script during VM creation](../features/multiplayer/servers/vmstartupscript.md). 

### **_Economy Services:_**
- **Targeted Offers and Segment Actions:** Segmentation support for game monetization has been steadily rolling out over the last few quarters. You can now create dynamic pricing strategies for each of your player segments, and actions for those segments are supported in our automation tooling. To learn more, see [targeted offers](../features/economy-v2/targeted-offers.md).
- **Limits Boosts:** Increased service limits for Catalog and Inventory to better accommodate our partners' needs. To learn more, see [economy limits](../features/economy-v2/limits.md).
- **Turbo Loading (Private Preview):** Streamlines inventory retrieval, eliminating the need for paging through multiple results. To learn more, see [turboloading](../features/economy-v2/inventory/turboloading.md).
- **Catalog Views (Private Preview):** Revolutionizes item loading by utilizing a Content Delivery Network (CDN) to access items easily with improved performance and lower costs through caching. To learn more, see [catalog view](../features/economy-v2/catalog/catalog-views.md).
- **Mobile Subscriptions:** Updates store redemption to link virtual subscriptions to real-world subscription offers in Apple and Google Play stores. To learn more, see [subscriptions](../features/economy-v2/subscriptions.md). 

### **_Data Analytics & LiveOps Services:_**
- **Churn Prediction:** Introduced PlayFab's first Azure Artificial Intelligence (AI) and Machine Learning (ML) Predictive Service for identifying player churn, directly integrated into Segmentation service to tailor engagement strategies. With no extra integration requirement, Churn Prediction can be easily enabled via Game Manager to build segments that identify potential low, medium, and high risk churn players. To learn more, see [Azure PlayFab churn prediction: all-in-one risk assessment and mitigation solution](../data-analytics/learn-data/churn-prediction/overview.md).
- **PlayFab and Microsoft Fabric Integration with open-source Power BI dashboards:** Land game data in Microsoft Fabric from PlayFab's Data Connections service to generate near-real-time analytics and insights. We have also provided a sample Power BI dashboard in an open-source GitHub repository to get you to from data to insights in under 10 minutes. To learn more, see [PlayFab data in Microsoft Fabric for Synapse real-time analytics](../data-analytics/learn-data/reports/real-time-analytics-tutorial.md).
- **Data Connections:** We introduced many new features and enhancements below for more powerful data management capabilities:
    - Introduced **Delta Tables (Private Preview)** for large-scale data processing. Using indexing and caching, they expedite query execution while ensuring data consistency and reliability through ACID transactions, even in the face of failures or concurrent access. Moreover, Delta tables simplify data management by enabling versioning, allowing you to track changes and roll back to previous versions with ease.
    - Introduced **Event Partitioning (Private Preview)**, enabling creators to gain granular control over data organization. This feature empowers you to specify which events should be partitioned, resulting in the creation of dedicated Parquet files for each event. This streamlined approach facilitates efficient data storage and retrieval, optimizing your analytical workflows. To learn more, see [event partitioning](../data-analytics/export-data/event-partitioning-overview.md).
    - Introduced **Telemetry keys**, enabling simplified authorization so creators can start getting game telemetry before logging in their first player. To learn more, see [PlayFab telemetry keys](../data-analytics/ingest-data/telemetry-keys-overview.md).
    - Introduced **Multi-Region Support** providing creators with a flexibility to configure their data connections in any Azure supported region with Multi-Region Support. This empowers you to take control of your data and optimize its placement to extract maximum value. Whether you're targeting specific regions or using Azure's global infrastructure, Multi-Region Support ensures seamless data accessibility wherever you operate.
- **Simplified ADX** eliminates the need for adding secrets to use Data connections, streamlining the data access process. By removing the necessity to manage secrets, this enhancement reduces overhead and enhances security, allowing creators to focus on extracting insights from their data effortlessly.
- Introduced **Segments as a Dimension:** enabling creators to easily filter the Trends dashboard KPIs based on specific player groups, which enables them to analyze data that is relevant to their target audience. Using on Trends dashboard they are now able to compare data of their different segments, track trends and measure the effect of changes over time. To learn more, see [Segments as Dimensions](../data-analytics/learn-data/trends/segments-dimension-overview.md). 
- Introduced **Custom Properties:** enabling creators to enrich player profiles by adding key-value data pairs, facilitating personalized experiences. This information is stored with other player information such as display names, statistics, and tags. To learn more, see [Custom Properties](../data-analytics/acting-data/player-custom-properties.md).

## **What’s on-deck?**

### **_Game Integration:_**

- **SDK unification:** We know it can be confusing to choose from among the [many PlayFab](../sdks/sdk-overview.md) SDKs we offer across all the services that PlayFab exposes, so we’ve been working to rationalize and merge them. This will provide you with a set of common components to leverage, more predictable interoperability, and make it easier to understand and successfully integrate our SDK into your game. It will also help us to accelerate the pace of delivery of new features to help you build the most engaging and successful games.
- **Online Services Plugin for Unreal Engine:** Following the update we recently delivered for [PlayFab Multiplayer Online Subsystem](../features/multiplayer/networking/party-unreal-engine-oss-overview.md), we’re getting ready to deliver a PlayFab plugin that implements the new Online Services model that Epic has been previewing in beta.
- **Multiplayer Game Server SDKs:** We’re planning to enhance VM maintenance events in the [PlayFab Multiplayer Game Server SDK](../features/multiplayer/servers/server-sdks.md) to make it easier to plan for and handle scheduled service interruptions. We’re also planning to automate game server entity authentication workflows to make it easier to adopt recommended security best practices within your game servers.
- **Client-side event sampling:** We’re planning to complement server-side event sampling with support in our SDKs for sampling events before they leave the client.

### **_Multiplayer Servers and Multiplayer Experiences Services:_**
- **Multi-IP and Routing Preference:** This feature aims to improve resilience, reliability of the game server hosting, and optimize latency for players by assigning multiple public IP addresses to game servers and selecting preferred routing paths (routed via Microsoft Premium Global Network or Transit ISP network).
- **Debugging Local Game Servers:** This feature aims to streamline local development in Multiplayer Servers (MPS) by integrating local compute resources with the MPS management layer, facilitating local iteration and boosting productivity.
- **Improved Certificate and Secrets Management:** This feature aims to simplify the management of secrets and certificates for your game servers, making adherence to security best practices more straightforward.
- **Predictive Standby:** This feature aims to predict and modify Standby server needs intelligently, using historical usage data from title, minimizing management efforts and responding to fluctuating player demand for optimized resource allocation.

### **_Economy Services:_**
- **Further Segment Integration:** We continue integration of PlayFab Segments within Economy V2. Next up is fully supporting Entity Segments and Player Profile.
- **Catalog Upload and Versioning:** Based on community feedback, we also have plans to further enhance usability of the V2 Catalog with improvements in catalog upload and item versioning.
- **Subscription Enhancements:** We continue to expand mobile support for Virtual Subscriptions to more marketplaces and enable scenarios like automated clawback.

### **_Data Analytics & LiveOps Services:_**
- **PlayFab Copilot:** At GDC 2024, we showcased an early preview of our PlayFab Copilot, an AI chat experience within Game Manager, providing insights into your titles, their performance, and even let's you configure PlayFab services all through natural language. Sign up [here](https://aka.ms/playfabcopilot/signup) to hear more and be notified of preview releases for this feature.

### **Thank you!**
THANK YOU to all our amazing game creators building with PlayFab today. None of this would be possible without you. Your support is greatly appreciated, keep the feedback coming and engage with us on the PlayFab [Discord forums](https://discord.com/invite/msftgamedev)! 
