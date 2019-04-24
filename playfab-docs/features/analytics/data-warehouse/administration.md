---
title: PlayFab Insights tutorial - administration
author: cjwilliams
description: Learn how to administer permissions and tables with PlayFab Insights
ms.author: CJ.Williams
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, insights, analytics, permissions, tables, administration
ms.localizationpriority: medium
---

# PlayFab Insights tutorial - administration

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com).

The PlayFab Insights Premium offering grants customers access to an isolated cluster to conduct queries or create, schedule and monitor custom data pipelines without sharing compute or storage resources.

When enabling the offering, an organizational or Microsoft account (MSA) is required, to access the cluster and perform administrative tasks like create tables or assign user permissions. This tutorial demonstrates helpful queries to complete these tasks.

## Administering Permissions

Adds a new user with a [Microsoft Account](https://account.microsoft.com/account) to access the cluster:

```cmd
.add follower database {DATABASENAME} admins/users ('msauser={MSA Email}')
```

Adds a new user with a organizational account (i.e. AAD):

```cmd
.add follower database {DATABASENAME} admins/users ('aaduser=imikeoein@fabrikam.com;TENANTID'')
```

> [!NOTE]
> You can easily select the database name for copy and paste, as shown below.

 ![Select Database Name](../../data/playerdata/media/tutorials/dw-tutorial-select-database.png)

## Table Administration

Run a query against the raw events and insert results into a newly created table:

```cmd
.set-or-append TestOutputTable <| database("SOURCEDATABASE").SourceTable | count
```

Alter/update a table with new column:

```cmd
.alter-merge table TestOutputTable (newColumnName:string)
```
