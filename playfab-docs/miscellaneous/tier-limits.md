---
title: PlayFab Tier Limits
author: nathankong-microsoft
description: Describes the limits for each PlayFab resource by tier.
ms.author: joanlee
ms.date: 04/29/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing, billing, essentials, tier, tiers, limit, limits
ROBOTS: NOINDEX, NOFOLLOW
ms.localizationpriority: medium
---

# PlayFab Tier Limits

Below are the limits per PlayFab resource. All tiers share the same limits, though it may be possible in an Enterprise contract for some limits to be made higher. More information on the Enterprise tier is available through the [PlayFab sales team](mailto:playfabsales@microsoft.com).

> [!NOTE]
>To learn more about the pricing of each PlayFab tier, please take a look at the [Pricing Page](https://playfab.com/pricing/).

### Economy

| Resource | Unit | Limit |
| --- | --- | --- |
| CatalogItemCount | items | 3,000 |
| VirtualCurrencyCount | virtual currencies | 10 |
| PlayerInventoryItemCount | items | 1,500 |
| CatalogItemCustomDataValueSize | Bytes | 1,000 |
| StoreItemCustomDataValueSize | Bytes | 1,000 |
| StoreMetadataValueSize | Bytes | 10,000 |

### Statistics
| Resource | Unit | Limit |
| --- | --- | --- |
| PlayerStatisticDefinitionsCount | statistic names | 300 |

### Leaderboards
| Resource | Unit | Limit |
| --- | --- | --- |
| LeaderboardVersionHistoryRetentionLength | previous leaderboard versions | 1 |
| LeaderboardVersionChangeTopRankEventsSent | prize table ranks | 1,000 |

### Promotions
| Resource | Unit | Limit |
| --- | --- | --- |
| NewsItemCount | items | 10 |

### Email Templates
| Resource | Unit | Limit |
| --- | --- | --- |
| EmailTemplateCount | templates | 100 |

### Cloud Script
| Resource | Unit | Limit |
| --- | --- | --- |
| ScriptExecutionTime | Seconds | 10 |
| ScriptExecutionAPIRequestsIssued | Count | 25 |
| ScriptFileSize | Bytes | 1,000,000 |
| FunctionArgumentSize | Bytes | 30,000 |

### Game Servers
| Resource | Unit | Limit |
| --- | --- | --- |
| BuildCount | Count | 100 |
| BuildSize | Bytes | 5,000,000,000 |
| RunningHostedServerCount | server hosts | 100 |
| RunningHostedServerHours | server host hours | 75,000 |

### PlayStream
| Resource | Unit | Limit |
| --- | --- | --- |
| PlayerSegmentCount | player segments | 100 |
| ActionTriggerCount | action triggers | 100 |
| JobCount | tasks | 25 |
| ABTestCount | A/B tests | 25 |
| ABTestSegmentsPerTestCount | player buckets | 5 |
| WebhookEndpointCount | webhook endpoints | 10 |
| TriggeredActionCloudScriptExecutionTime | Seconds | 1 |
| TriggeredActionCloudScriptExecutionAPIRequestsIssued | Count | 5 |
| ElasticSearchEventHistoryTTL | days | 30 |
| WriteEventAPIBodySize | Bytes | 10,000 |
| SegmentBulkActionConcurrentJobs | concurrent tasks | 5 |
| PlayerTagCount | tags per player | 5 |
| EventArchiveCount | event archives per title | 3 |
| EventArchiveEventNamesCount | event names per title | 250 |

### Data Storage
| Resource | Unit | Limit |
| --- | --- | --- |
| UserDataUpdateKeysCount | items | 10 |
| UserDataIndividualValueSize | Bytes | 300,000 |
| UserDataValueUpdatesPer15Seconds | update operations | 10 |
| UserDataValueUpdatesPer5Minutes | update operations | 150 |
| UserDataValueUpdatesPer1Hour | update operations | 3,600 |
| CharacterDataUpdateKeysCount | pairs | 10 |
| CharacterDataIndividualValueSize | Bytes | 300,000 |
| CharacterDataValueUpdatesPer15Seconds | update operations | 5 |
| CharacterDataValueUpdatesPer5Minutes | update operations | 30 |
| CharacterDataValueUpdatesPer1Hour | update operations | 60 |
| SharedGroupDataUpdateKeysCount | pairs | 10 |
| SharedGroupDataIndividualValueSize | Bytes | 300,000 |
| InventoryItemCustomDataUpdateKeysCount | pairs | 5 |
| InventoryItemCustomDataIndividualKeySize | Bytes | 20 |
| InventoryItemCustomDataIndividualValueSize | Bytes | 100 |
| TitleDataIndividualValueSize | Bytes | 1,000,000 |
| TitleDataKeysTotalCount | pairs | 1,000 |
| TitleInternalDataKeysTotalCount | pairs | 1,000 |
| TitleObjectCount | objects | 10 |
| TitleObjectSize | bytes | 2,000 |
| PublisherPlayerAccountObjectCount | objects | 5 |
| PublisherPlayerAccountObjectSize | bytes | 1,000 |
| MasterPlayerAccountObjectCount | objects | 5 |
| MasterPlayerAccountObjectSize | bytes | 1,000 |
| TitlePlayerAccountObjectCount | objects | 5 |
| TitlePlayerAccountObjectSize | bytes | 1,000 |
| CharacterObjectCount | objects | 5 |
| CharacterObjectSize | bytes | 1,000 |
| TitleFileCount | files | 10 |
| PublisherPlayerAccountFileCount | files | 10 |
| MasterPlayerAccountFileCount | files | 10 |
| TitlePlayerAccountFileCount | files | 10 |
| CharacterFileCount | files | 10 |
| TitleFileStorageLimit | gigabytes | 50,000 |
| GroupFileCount | files | 10 |
| GroupObjectCount | objects | 5 |
| GroupObjectSize | bytes | 1,000 |
| EntityEventsPer15Seconds | update operations | 25 |
| EntityEventsPer5Minutes | update operations | 100 |
| EntityEventsPer1Hour | update operations | 900 |
| EntityUpdatesPer15Seconds | update operations | 10 |
| EntityUpdatesPer5Minutes | update operations | 50 |
| EntityUpdatesPer1Hour | update operations | 900 |

### Add-Ons
| Resource | Unit | Limit |
| --- | --- | --- |
| CommunitySiftDisplayNameUsage | profanity checks | 500 |

### Title Services
| Resource | Unit | Limit |
| --- | --- | --- |
| SecretKeyCount | secret keys | 5 |

### Groups
| Resource | Unit | Limit |
| --- | --- | --- |
| GroupMemberCount | members | 1,000 |
| GroupRoleCount | roles | 10 |

### Matchmaking
| Resource | Unit | Limit |
| --- | --- | --- |
| TicketMembershipsPerMinute | requests | 5 |
| TicketGetsPerMinute | requests | 6 |
| ListTicketsForPlayerPerMinute | requests | 3 |
| MatchGetsPerMinute | requests | 3 |
| MatchGetsPerMinuteForTitle | requests | 100 |
| ServerBackfillTicketCreatesPerMinute | requests | 5 |
| ServerBackfillTicketGetsPerMinute | requests | 6 |
| ServerBackfillListTicketsForPlayerPerMinute | requests | 3 |
| QueueStatisticGetsPerMinute | requests | 1 |
