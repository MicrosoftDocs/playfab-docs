---
title: Game Saves conflicts
author: jasonsandlin
description: Game Saves conflicts
ms.author: jasonsa
ms.date: 01/06/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game saves
ms.localizationpriority: medium
---

# Game Save conflicts and atomic units

## Overview

Save conflicts happen when you modify the same game data on multiple devices. The system needs to decide which version to keep. To design your save data structure, you need to understand how the system detects and resolves conflicts.

## When conflicts happen

Conflicts happen during the sync operation (`PFGameSaveFilesAddUserWithUiAsync`) only when all of the following conditions are true:

1. **Local changes exist**: You modified files locally since the last sync.
2. **Cloud changes exist**: Another device uploaded newer data since the last sync.
3. **Same atomic unit**: Both changes are in the same root-level folder.

### Conflict detection matrix

| Local device changes | Cloud has changes in same atomic unit | Result |
|---------------------|--------------------------------------|--------|
| Modified files | Yes | **CONFLICT** |
| Deleted files | Yes | **CONFLICT** |
| No changes | Yes | Download proceeds |
| Modified files | No | Upload proceeds |
| Deleted files | No | Delete proceeds |

## What is an atomic unit?

Some file sync systems treat conflicts on a file-by-file basis. If the same file needs to be uploaded and downloaded, there's a conflict. In Game Saves, each root-level subfolder is treated as an *atomic unit*.

> **Each root-level subfolder is one atomic unit.**

If any files or subfolders inside a root-level subfolder need to be downloaded and any files or folders in that same root subfolder need to be uploaded, then the entire atomic unit is in conflict.

This approach allows you to:
- **Maintain data integrity**: Interdependent files stay consistent together
- **Provide isolation**: Independent data in separate folders sync without conflicts
- **Minimize conflicts**: Changes to different atomic units on different devices merge automatically

### Example save structure

```
SaveRoot/
├── save.dat              ← Atomic unit: root
├── player.dat            ← Atomic unit: root
├── Save1/
│   ├── stats.json        ← Atomic unit: Save1
│   └── inventory.json    ← Atomic unit: Save1
├── Save2/
│   ├── stats.json        ← Atomic unit: Save2
│   └── inventory.json    ← Atomic unit: Save2
└── WorldState/
    ├── map.dat           ← Atomic unit: WorldState
    └── npcs/
        └── positions.dat ← Atomic unit: WorldState
```

### Conflict scenarios

| Device A changes | Device B changes | Conflict? | Why |
|-----------------|------------------|-----------|-----|
| `Save1/stats.json` | `Save1/inventory.json` | **YES** | Same atomic unit: Save1 |
| `Save1/stats.json` | `Save2/stats.json` | No | Different units: Save1 vs Save2 |
| `WorldState/map.dat` | `WorldState/npcs/positions.dat` | **YES** | Same atomic unit: WorldState |
| `save.dat` | `Save1/stats.json` | No | Different units: root vs Save1 |
| `player.dat` | `save.dat` | **YES** | Same atomic unit: root |

## Root-level files: special case

**All files at the save root share one atomic unit.**

The system groups all files you place directly in the save root (not in any subfolder) together as a single atomic unit. If you modify one root-level file locally and another device modifies a different root-level file, this difference triggers a conflict.

| Device A (local) | Device B (cloud) | Same Atomic Unit? | Result |
|-----------------|------------------|-------------------|--------|
| Modifies `rootfile1.txt` | Modifies `rootfile2.txt` | ✅ YES | **CONFLICT** |
| Modifies `rootfile1.txt` | Modifies `save1/config.ini` | ❌ NO | No conflict, both sync |
| Deletes `save.dat` | Modifies `progress.dat` | ✅ YES | **CONFLICT** |

## User choice options

When conflicts occur, players choose between:

- **Use Local Data (Keep Local)**: Keep the device's current save data.
- **Use Cloud Data (Keep Cloud)**: Download and use the cloud save data.

### Critical: resolution is all or nothing

> ⚠️ **Important**: While atomic units determine *when* a conflict is detected, the user's conflict resolution choice applies to the **entire save**, not per atomic unit.

### Example: Mixed conflict scenario

```
SaveRoot/
├── SlotA/ ← Local: modified, Cloud: modified  → CONFLICT
├── SlotB/ ← Local: modified, Cloud: unchanged → Local-only change
├── SlotC/ ← Local: unchanged, Cloud: modified → Cloud-only change
└── SlotD/ ← Local: modified, Cloud: unchanged → Local-only change
```

**User sees conflict prompt** (due to SlotA).

| User choice | SlotA | SlotB | SlotC | SlotD |
|-------------|-------|-------|----------|--------------|
| **Keep Local** | ✅ Local kept | ✅ Local uploaded | ❌ Cloud change **LOST** | ✅ Local uploaded |
| **Keep Cloud** | ✅ Cloud downloaded | ❌ Local change **overwritten** | ✅ Cloud downloaded | ❌ Local change **overwritten** |

### Why this matters

1. **Keep Local loses cloud-only changes**: If you choose "Keep Local" because of a conflict in SlotA, you don't receive the cloud update to SlotC that another device made.

2. **Keep Cloud loses local-only changes**: If you choose "Keep Cloud", the cloud state overwrites your local changes to SlotB and SlotD.

3. **Rollback available**: Both choices preserve the discarded branch for future rollback capability.

### Design summary

| Aspect | Granularity |
|--------|-------------|
| Conflict **detection** | Per atomic unit (root subfolder) |
| Conflict **resolution** | Entire save (all-or-nothing) |

This all-or-nothing approach simplifies the player experience. While per-atomic-unit resolution technically maintains data consistency (since atomic units define consistency boundaries), it creates user experience challenges:

- Players need to understand the concept of atomic units and folder boundaries.
- Mixed results (some folders from local, others from cloud) can leave players confused about the final state.
- Prompting for each conflicting atomic unit separately makes conflict resolution overwhelming.

By presenting a single **Keep Local** vs **Keep Cloud** choice, players make one clear decision without needing to understand the underlying save structure.

## When conflicts don't occur

### Delete on both sides

If both devices delete the same file (or files in the same atomic unit), **no conflict occurs**. The system recognizes that both devices agree the file should be removed.

### Changes in different atomic units

If Device A modifies files in `SlotA/` and Device B modifies files in `SlotB/`, no conflict occurs. Sync automatically merges both changes.

## Best practices

### 1. Design folder structure carefully

Use subfolders for independent save units:

```
SaveRoot/
├── Slot1/           ← Each slot is independent
│   └── save.dat
├── Slot2/
│   └── save.dat
```

A slot-based game save system where each slot is a root-level subfolder is a simple example of how you can use atomic units effectively.

Other examples include:
- **Shared reference data**: Store data that any save slot might use, such as unlocked content or achievements, in its own subfolder so it syncs independently from individual save slots.
- **Large asset collections**: If your game stores large sets of files that update independently, such as downloaded content packs or user-created levels, consider splitting them into multiple root subfolders so updates to one collection don't conflict with updates to another.

### 2. Avoid root-level files for frequently modified data

All root-level files share one atomic unit. Avoid placing frequently modified files at the root if you want to sync them independently.

**Instead of:**
```
SaveRoot/
├── autosave.dat     ← All root files = 1 atomic unit
└── save1.dat
└── save2.dat
```

**Consider:**
```
SaveRoot/
├── AutoSave/
│   └── autosave.dat     ← Independent unit
└── Save1/
    └── gamesave.dat ← Independent unit
```

### 3. Group related data together

Use the same folder for files that must stay consistent together.

```
SaveRoot/
├── Save1/
│   ├── stats.json       ← These files are interdependent
│   ├── inventory.json   ← and should conflict together
│   └── quests.json
```

### 4. Minimize conflicts

Upload frequently to reduce the chance of conflicts. The more often you sync, the less likely two devices have divergent changes.

### 5. Monitor conflict rates

Use [PlayStream events](playstream-events.md) to track how often conflicts occur and how players resolve them. A rising conflict rate or a strong skew toward "keep local" versus "keep remote" can signal UX or save-cadence problems worth investigating.
