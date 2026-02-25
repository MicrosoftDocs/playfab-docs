---
title: Artifact
author: ronnyparedes
description: Artifact data type.
ms.author: ronnyparedes
ms.date: 02/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# Artifact

Provides details about an exported artifact (e.g Azure blob, Amazon S3 object, etc.)

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|NumberOfEvents|int64|The number of events in the artifact.|
|Path|String|The location in storage where the artifact was written to.|
|SizeInBytes|int64|The size of the artifact in bytes.|
