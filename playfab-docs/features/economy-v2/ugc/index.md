---
title: PlayFab User Generated Content
author: thomasgu
description: Overview of the PlayFab User Generated Content feature.
ms.author: thomg
ms.date: 06/17/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, ugc
ms.localizationpriority: medium
---

# PlayFab User Generated Content

PlayFab User Generated Content (UGC) empowers your players to create, upload, and search for moderated content. Designed to provide out-of-the box capabilities that normally require custom work and service expertise to accomplish, our UGC services can enable you to build an engaging creator community around your title in no time! Watch our [UGC Microsoft Game Dev](https://www.youtube.com/watch?v=Fv0bYvjuNwk) video to learn more.

## Key features

UGC provides the following key features:

* Easy-to-integrate APIs to allow you to build your own in-game experiences
* Moderation built into the publishing pipeline to ensure content is safe and appropriate for your players
* Search experiences to allow your UGC catalog to scale and players to quickly find interesting content for them
* Review and reporting capabilities to empower players to keep the quality high

## Key concepts

There are a few common terms used throughout the UGC service:

* **Catalog** - Catalogs are a place for you to store and manage your content. There are two main catalogs, the draft catalog and the public catalog which store draft and published items, respectively
* **(Published) Items** - PlayFab UGC Items are data blobs containing information about a specific item. Published Items are accessible to other players through the `GetItems` and `Search` APIs
* **Draft Items** - Draft Items are accessible to only the item creator and the `Title` Entity. Draft Items can become Published Items by calling the `PublishDraftItem` API
* **Content** - Content are the images and files that are uploaded to Items

## Limitations and important considerations

Before playing around with the UGC features and APIs, there are a few limitations and important considerations you should know about the service:

* UGC *only* supports PlayFab Entities - you will need to use entity-based authentication to utilize UGC.
* UGC does not work with PlayFab Economy (Legacy) APIs - it is a separate service built on top of the Economy v2 system.

## Getting Started

* The [UGC Quickstart](quickstart.md) guide walks you through the steps of publishing an item
* The [Publish your first user generated content](../tutorials/publish-ugc.md) tutorial goes over the details of uploading content and populating URL blobs.
