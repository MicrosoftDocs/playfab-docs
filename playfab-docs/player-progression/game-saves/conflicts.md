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

# Game Saves Conflicts and Atomic Units

## Overview

Save conflicts occur when the same game data has been modified on multiple devices, and the system needs to determine which version to keep. Understanding how conflicts are detected and resolved is crucial for game developers designing their save data structure.

## When Conflicts Happen

Conflicts only occur during the sync operation (`PFGameSaveFilesAddUserWithUiAsync`) when **all** of the following conditions are true:

1. **Local changes exist**: Files have been modified locally since the last sync
2. **Cloud changes exist**: Another device has uploaded newer data since the last sync
3. **Same atomic unit**: Both changes are in the same root-level folder

### Conflict Detection Matrix

| Local Device Changes | Cloud Has Changes in Same Atomic Unit | Result |
|---------------------|--------------------------------------|--------|
| Modified files | Yes | **CONFLICT** |
| Deleted files | Yes | **CONFLICT** |
| No changes | Yes | Download proceeds |
| Modified files | No | Upload proceeds |
| Deleted files | No | Delete proceeds |

## What is an Atomic Unit?

Some file sync systems treat conflicts on a file-by-file basis – if the same file needs to be uploaded and also needs to be downloaded, then there's a conflict. In Game Saves, each root-level subfolder is instead treated as an **atomic unit**.

> **Each root-level subfolder is treated as one atomic unit.**

If there are any files or subfolders inside a root-level subfolder that need to be downloaded **and** any files or folders in that same root subfolder that need to be uploaded, then the entire atomic unit is in conflict.

This approach allows you to:
- **Maintain data integrity**: Interdependent files stay consistent together
- **Provide isolation**: Independent data in separate folders can sync without conflicts
- **Minimize conflicts**: Changes to different atomic units on different devices merge automatically

### Example Save Structure

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

### Conflict Scenarios

| Device A Changes | Device B Changes | Conflict? | Why |
|-----------------|------------------|-----------|-----|
| `Save1/stats.json` | `Save1/inventory.json` | **YES** | Same atomic unit: Save1 |
| `Save1/stats.json` | `Save2/stats.json` | No | Different units: Save1 vs Save2 |
| `WorldState/map.dat` | `WorldState/npcs/positions.dat` | **YES** | Same atomic unit: WorldState |
| `save.dat` | `Save1/stats.json` | No | Different units: root vs Save1 |
| `player.dat` | `save.dat` | **YES** | Same atomic unit: root |

## Root-Level Files: Special Case

**All files at the save root share ONE atomic unit.**

Files placed directly in the save root (not in any subfolder) are all grouped together as a single atomic unit. If you modify one root-level file locally and another device modifies a different root-level file, this will trigger a conflict.

| Device A (local) | Device B (cloud) | Same Atomic Unit? | Result |
|-----------------|------------------|-------------------|--------|
| Modifies `rootfile1.txt` | Modifies `rootfile2.txt` | ✅ YES | **CONFLICT** |
| Modifies `rootfile1.txt` | Modifies `save1/config.ini` | ❌ NO | No conflict, both sync |
| Deletes `save.dat` | Modifies `progress.dat` | ✅ YES | **CONFLICT** |

## User Choice Options

When conflicts occur, players choose between:

- **Use Local Data (Keep Local)**: Keep the device's current save data
- **Use Cloud Data (Keep Cloud)**: Download and use the cloud save data

### Critical: Resolution is All-or-Nothing

> ⚠️ **Important**: While atomic units determine *when* a conflict is detected, the user's conflict resolution choice applies to the **entire save**, not per-atomic-unit.

### Example: Mixed Conflict Scenario

```
SaveRoot/
├── SlotA/ ← Local: modified, Cloud: modified  → CONFLICT
├── SlotB/ ← Local: modified, Cloud: unchanged → Local-only change
├── SlotC/ ← Local: unchanged, Cloud: modified → Cloud-only change
└── SlotD/ ← Local: modified, Cloud: unchanged → Local-only change
```

**User sees conflict prompt** (due to SlotA).

| User Choice | SlotA | SlotB | SlotC | SlotD |
|-------------|-------|-------|----------|--------------|
| **Keep Local** | ✅ Local kept | ✅ Local uploaded | ❌ Cloud change **LOST** | ✅ Local uploaded |
| **Keep Cloud** | ✅ Cloud downloaded | ❌ Local change **overwritten** | ✅ Cloud downloaded | ❌ Local change **overwritten** |

### Why This Matters

1. **Keep Local loses cloud-only changes**: If you choose "Keep Local" because of a conflict in SlotA, you will NOT receive the cloud update to SlotC that another device made.

2. **Keep Cloud loses local-only changes**: If you choose "Keep Cloud", your local changes to SlotB and SlotD are overwritten by the cloud state.

3. **Rollback available**: Both choices preserve the discarded branch for future rollback capability.

### Design Summary

| Aspect | Granularity |
|--------|-------------|
| Conflict **detection** | Per atomic unit (root subfolder) |
| Conflict **resolution** | Entire save (all-or-nothing) |

This all-or-nothing approach simplifies the player experience. While per-atomic-unit resolution would technically maintain data consistency (since atomic units define consistency boundaries), it would create user experience challenges:

- Players would need to understand the concept of atomic units and folder boundaries
- Mixed results (some folders from local, others from cloud) could leave players confused about the final state
- Prompting for each conflicting atomic unit separately would make conflict resolution overwhelming

By presenting a single "Keep Local" vs "Keep Cloud" choice, players make one clear decision without needing to understand the underlying save structure.

## When Conflicts Do NOT Occur

### Delete on Both Sides

If both devices delete the same file (or files in the same atomic unit), **no conflict occurs**. The system recognizes that both devices agree the file should be removed.

### Changes in Different Atomic Units

If Device A modifies files in `SlotA/` and Device B modifies files in `SlotB/`, no conflict occurs. Both changes merge automatically during sync.

## Best Practices

### 1. Design Folder Structure Carefully

Use subfolders for independent save units:

```
SaveRoot/
├── Slot1/           ← Each slot is independent
│   └── save.dat
├── Slot2/
│   └── save.dat
```

A slot-based game save system where each slot is a root-level subfolder is a simple example of how atomic units can be used effectively.

Other examples include:
- **Shared reference data**: Data that any save slot might use (e.g., unlocked content, achievements) can be stored in its own subfolder, syncing independently from individual save slots
- **Large asset collections**: If your game stores large sets of files that update independently (e.g., downloaded content packs, user-created levels), consider splitting them into multiple root subfolders so updates to one collection don't conflict with updates to another

### 2. Avoid Root-Level Files for Frequently Modified Data

Since all root-level files share one atomic unit, avoid placing frequently modified files at the root if they should be independently syncable.

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

### 3. Group Related Data Together

Files that must stay consistent together should be in the same folder:

```
SaveRoot/
├── Save1/
│   ├── stats.json       ← These files are interdependent
│   ├── inventory.json   ← and should conflict together
│   └── quests.json
```

### 4. Minimize Conflicts

Upload frequently to reduce the chance of conflicts. The more often you sync, the less likely two devices will have divergent changes.
