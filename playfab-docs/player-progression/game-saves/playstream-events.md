---
title: Game Saves PlayStream events
author: amccalib
description: PlayStream events emitted by Game Saves, including save finalization, conflict resolution, and known-good rollback telemetry.
ms.author: andmcc
ms.date: 03/06/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves, playstream, telemetry, events, conflicts, rollback
ms.localizationpriority: medium
---

# Game Saves PlayStream events

PlayFab Game Saves emits PlayStream events that you can use to track how players save, sync, and manage their game data. Use these events to monitor save activity, detect conflicts, and understand cross-device usage patterns across your player base.

All Game Saves events are emitted against `title_player_account` entities in the `playfab.gamesave` namespace.

## Events

### `gamesave_version_finalized`

Emitted each time a game save version is finalized. All files are uploaded and the version is complete. This event is the primary signal for tracking save activity.

| Field | Type | Description |
|-------|------|-------------|
| `Version` | `long` | The version number of the finalized game save |
| `FinalizedAt` | `DateTime` | Timestamp when the version was finalized |
| `TotalSizeBytes` | `long` | Total size of the finalized version, including all files |
| `TotalFileCount` | `int` | Total number of files in the finalized version |
| `NewFileCount` | `int` | Number of new files added in this version |
| `NewFilesSizeBytes` | `long` | Size of the new files added in this version |
| `PlayerIdentityProvider` | `string` | The identity provider the player used (for example, Steam, Xbox Live) |
| `DeviceType` | `string` | The type of device the save was uploaded from |
| `IsGeneratedByRollback` | `bool` | `true` if this version was created by rolling back to a previous version |
| `Conflict` | `Conflict` | Present when this version was finalized as part of a conflict resolution. `null` otherwise. See [Conflict resolution](#scenario-conflict-resolution) |

**Conflict** (nested object, present only during conflict resolution):

| Field | Type | Description |
|-------|------|-------------|
| `IsWinner` | `bool` | Whether the player's local changes won the conflict. The event always corresponds to a new manifest created from the client's local data. `true` means that manifest became the canonical version; `false` means the manifest was preserved as a rollback point while the existing cloud version remained canonical |
| `ConflictingVersion` | `long` | The version number of the existing cloud version that was in conflict |

### `gamesave_version_marked_known_good`

Emitted when a game save version is explicitly marked as "known good." A known-good version serves as a trusted restore point. The version the system rolls back to if a player or the title needs to recover from a bad save state.

| Field | Type | Description |
|-------|------|-------------|
| `Version` | `long` | The version that was marked as known good |
| `MarkedAt` | `DateTime` | Timestamp when the version was marked |

---

## Scenarios

### Scenario: Standard cross-device usage

A typical cross-device flow looks like a player saving on one device and resuming on another. In PlayStream, this pattern appears as a sequence of `gamesave_version_finalized` events with incrementing `Version` numbers.

**What you see:**

- A `gamesave_version_finalized` event each time the player saves, with `DeviceType` and `PlayerIdentityProvider` indicating which device and identity provider were used.
- `NewFileCount` and `NewFilesSizeBytes` show how much data changed compared to the previous version. A version where `NewFileCount` is 0 means the player finalized a version with no new file content (for example, a metadata-only update).
- `Conflict` is `null` and `IsGeneratedByRollback` is `false` for normal saves.

**What to watch for:**

- **Save frequency per player**: Track the rate of finalization events to understand player engagement and saving behavior.
- **Save sizes over time**: Monitor `TotalSizeBytes` and `NewFilesSizeBytes` to catch unexpected growth in save data that could affect storage costs or sync times.
- **Device distribution**: Aggregate `DeviceType` to understand which platforms your players save from most frequently.

### Scenario: Conflict resolution

Conflicts occur when two devices finalize a game save version against the same base version. For example, a player might play offline on their console and PC at the same time, and both devices try to sync when they come back online.

**What you see:**

- During conflict resolution, the client always uploads its local files to a new manifest and finalizes the manifest. This process produces a single `gamesave_version_finalized` event with a non-null `Conflict` object. The existing cloud version (already finalized in a prior event) doesn't produce a new event.
- `Conflict.IsWinner` tells you whether the player's local changes won the conflict:
  - `true`—the player chose **keep local**. The new manifest becomes the canonical version, and the prior cloud version is superseded.
  - `false`—the player chose **keep remote**. The new manifest is preserved as a rollback point (containing the rejected local data), while the existing cloud version remains canonical.
- `Conflict.ConflictingVersion` points to the existing cloud version that was in conflict.

**What to watch for:**

- **Conflict rate**—Filter for `gamesave_version_finalized` events where `Conflict` is present. A rising conflict rate might indicate that players frequently switch devices without syncing, or that your title's save cadence causes unnecessary version collisions.
- **Local vs. remote preference**—Compare the ratio of `IsWinner = true` (kept local) vs. `IsWinner = false` (kept remote) to understand how players resolve conflicts. A strong skew toward one side might indicate a UX issue with the conflict prompt.
- **Cross-device conflict patterns**—Use `DeviceType` and `PlayerIdentityProvider` on conflict events to understand which platform combinations are most prone to conflicts.

### Scenario: Known good and rollback

The "known good" mechanism lets you mark a specific version as a trusted restore point. If a player's save becomes corrupted or they need to recover, the system can roll back to the most recent known-good version and create a new version from it.

**What you see:**

- A `gamesave_version_marked_known_good` event when you designate a version as the restore point, with the `Version` number and `MarkedAt` timestamp.
- If a rollback occurs, the system emits a new `gamesave_version_finalized` event with `IsGeneratedByRollback = true`. This new version's content is based on the known-good version, but it gets a new, incremented version number.
- The rollback-generated version might also have `Conflict` data if the rollback was triggered as part of a conflict resolution.

**What to watch for:**

- **Rollback frequency**—Track `gamesave_version_finalized` events where `IsGeneratedByRollback = true`. Frequent rollbacks for a title might indicate save corruption issues or problems with the title's save logic.
- **Known-good freshness**—Compare the `Version` in `gamesave_version_marked_known_good` against the latest finalized `Version` for the same player. A large gap means the player would lose significant progress if a rollback is needed.
- **Rollback + conflict correlation**—If rollback-generated versions frequently appear alongside conflict data, that pattern might suggest that your conflict resolution strategy is triggering rollbacks as a side effect.
