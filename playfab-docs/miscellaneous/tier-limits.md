---
title: PlayFab Tier Limits
author: tcrawf23
description: Describes the limits for each PlayFab resource by tier.
ms.author: tcrawf23
ms.date: 04/29/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, pricing, billing, essentials, tier, tiers, limit, limits
ROBOTS: NOINDEX, NOFOLLOW
ms.localizationpriority: medium
---

# PlayFab Tier Limits

Below are the limits per PlayFab resource. The Essentials tier provides enough resources to fully test your title, but not enough to launch your title in production. The Indie, Pro, and Enterprise tiers all provide the same higher limits, which are enough to support a production title.

> [!NOTE]
>To learn more about the pricing of each PlayFab tier, please take a look at the [Pricing Page](https://playfab.com/pricing/).

### Economy

| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| CatalogItemCount | items | 250 | 3,000 |
| VirtualCurrencyCount | virtual currencies | 8 | 10 |
| PlayerInventoryItemCount | items | 100 | 1,500 |
| CatalogItemCustomDataValueSize | Bytes | 1,000 | 1,000 |
| StoreItemCustomDataValueSize | Bytes | 1,000 | 1,000 |
| StoreMetadataValueSize | Bytes | 10,000 | 10,000 |

### Statistics
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| PlayerStatisticDefinitionsCount | statistic names | 25 | 300 |

### Leaderboards
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| LeaderboardVersionHistoryRetentionLength | previous leaderboard versions | 1 | 1 |
| LeaderboardVersionChangeTopRankEventsSent | prize table ranks | 10 | 1,000 |

### Promotions
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| NewsItemCount | items | 10 | 10 |

### Email Templates
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| EmailTemplateCount | templates | 100 | 100 |

### Cloud Script
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| ScriptExecutionTime | Seconds | 4.5 | 10 |
| ScriptExecutionAPIRequestsIssued | Count | 15 | 25 |
| ScriptFileSize | Bytes | 50,000 | 1,000,000 |
| FunctionArgumentSize | Bytes | 30,000 | 30,000 |

### Game Servers
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| BuildCount | Count | 100 | 100 |
| BuildSize | Bytes | 1,000,000,000 | 5,000,000,000 |
| RunningHostedServerCount | server hosts | 10 | 100 |
| RunningHostedServerHours | server host hours | 20 | 75,000 |

### PlayStream
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| PlayerSegmentCount | player segments | 10 | 100 |
| ActionTriggerCount | action triggers | 3 | 100 |
| JobCount | tasks | 5 | 25 |
| ABTestCount | A/B tests | 1 | 25 |
| ABTestSegmentsPerTestCount | player buckets | 5 | 5 |
| WebhookEndpointCount | webhook endpoints | 1 | 10 |
| TriggeredActionCloudScriptExecutionTime | Seconds | 1 | 1 |
| TriggeredActionCloudScriptExecutionAPIRequestsIssued | Count | 3 | 5 |
| ElasticSearchEventHistoryTTL | days | 7 | 30 |
| WriteEventAPIBodySize | Bytes | 1,024 | 10,000 |
| SegmentBulkActionConcurrentJobs | concurrent tasks | 1 | 5 |
| PlayerTagCount | tags per player | 5 | 5 |
| EventArchiveCount | event archives per title | 3 | 3 |
| EventArchiveEventNamesCount | event names per title | 250 | 250 |

### Data Storage
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| UserDataUpdateKeysCount | items | 10 | 10 |
| UserDataIndividualValueSize | Bytes | 10,000 | 300,000 |
| UserDataValueUpdatesPer15Seconds | update operations | 10 | 10 |
| UserDataValueUpdatesPer5Minutes | update operations | 150 | 150 |
| UserDataValueUpdatesPer1Hour | update operations | 3,600 | 3,600 |
| CharacterDataUpdateKeysCount | pairs | 5 | 10 |
| CharacterDataIndividualValueSize | Bytes | 1,000 | 300,000 |
| CharacterDataValueUpdatesPer15Seconds | update operations | 5 | 5 |
| CharacterDataValueUpdatesPer5Minutes | update operations | 30 | 30 |
| CharacterDataValueUpdatesPer1Hour | update operations | 60 | 60 |
| SharedGroupDataUpdateKeysCount | pairs | 5 | 10 |
| SharedGroupDataIndividualValueSize | Bytes | 1,000 | 300,000 |
| InventoryItemCustomDataUpdateKeysCount | pairs | 5 | 5 |
| InventoryItemCustomDataIndividualKeySize | Bytes | 20 | 20 |
| InventoryItemCustomDataIndividualValueSize | Bytes | 100 | 100 |
| TitleDataIndividualValueSize | Bytes | 20,000 | 1,000,000 |
| TitleDataKeysTotalCount | pairs | 50 | 1,000 |
| TitleInternalDataKeysTotalCount | pairs | 50 | 1,000 |
| TitleObjectCount | objects | 3 | 10 |
| TitleObjectSize | bytes | 1,000 | 2,000 |
| PublisherPlayerAccountObjectCount | objects | 3 | 5 |
| PublisherPlayerAccountObjectSize | bytes | 500 | 1,000 |
| MasterPlayerAccountObjectCount | objects | 3 | 5 |
| MasterPlayerAccountObjectSize | bytes | 500 | 1,000 |
| TitlePlayerAccountObjectCount | objects | 3 | 5 |
| TitlePlayerAccountObjectSize | bytes | 500 | 1,000 |
| CharacterObjectCount | objects | 3 | 5 |
| CharacterObjectSize | bytes | 500 | 1,000 |
| TitleFileCount | files | 1 | 10 |
| PublisherPlayerAccountFileCount | files | 1 | 10 |
| MasterPlayerAccountFileCount | files | 1 | 10 |
| TitlePlayerAccountFileCount | files | 1 | 10 |
| CharacterFileCount | files | 1 | 10 |
| TitleFileStorageLimit | gigabytes | 1 | 50,000 |
| GroupFileCount | files | 1 | 10 |
| GroupObjectCount | objects | 3 | 5 |
| GroupObjectSize | bytes | 500 | 1,000 |
| EntityEventsPer15Seconds | update operations | 25 | 25 |
| EntityEventsPer5Minutes | update operations | 100 | 100 |
| EntityEventsPer1Hour | update operations | 900 | 900 |
| EntityUpdatesPer15Seconds | update operations | 10 | 10 |
| EntityUpdatesPer5Minutes | update operations | 50 | 50 |
| EntityUpdatesPer1Hour | update operations | 900 | 900 |

### Add-Ons
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| CommunitySiftDisplayNameUsage | profanity checks | 500 | 500 |

### Title Services
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| SecretKeyCount | secret keys | 5 | 5 |

### Groups
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| GroupMemberCount | members | 1,000 | 1,000 |
| GroupRoleCount | roles | 10 | 10 |

### Beta Economy
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| WalletVirtualCurrencyCount | wallet virtual currencies | 8 | 10 |

### Matchmaking
| Resource | Unit | Essentials Limit | Indie/Pro/Enterprise Limit |
| --- | --- | --- | --- |
| TicketMembershipsPerMinute | requests | 5 | 5 |
| TicketGetsPerMinute | requests | 6 | 6 |
| ListTicketsForPlayerPerMinute | requests | 3 | 3 |
| MatchGetsPerMinute | requests | 3 | 3 |
| MatchGetsPerMinuteForTitle | requests | 100 | 100 |
| ServerBackfillTicketCreatesPerMinute | requests | 5 | 5 |
| ServerBackfillTicketGetsPerMinute | requests | 6 | 6 |
| ServerBackfillListTicketsForPlayerPerMinute | requests | 3 | 3 |
| QueueStatisticGetsPerMinute | requests | 1 | 1 |