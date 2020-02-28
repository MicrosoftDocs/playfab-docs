---
title: Insights Management Commands
author: john-smith-microsoft
description: management commands for title adx
ms.author: johsmi
ms.date: 1/9/2020    
ms.topic: article
ms.prod: playfab
keywords: playfab, insights, explorer
ms.localizationpriority: medium
---

# Insights Management Commands
Insights management commands allow users express more control over or to gather additional information on their data system. The commands fall into two primary categories:
1. Management - These commands allow users to view more information about queries, commands and retention as well as alter retention
2. Data Control - These commands allow users to create and drop custom tables, ingest local and cloud data and purge data from their DB

Some commands are not available in evaluation mode.

| Category     | Commands                                                                                                                              |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Management   | .show queries<br>.show running queries<br>.show commands-and-queries<br>.show table policy retention<br>.alter table policy retention |
| Data Control | .create table<br>.drop table<br>.set<br>.append<br>.set-or-append<br>.set-or-replace<br>.ingest into table<br>.purge table            |

## Management
**.show queries**<br>
Returns a list of currently-executing queries by the user, or by another user, or by all users.<br>
Usage: `.show  queries`<br>
Example: `.show queries | where StartedOn > ago(1d)`<br>
This shows all queries that executed in the last day<br>

**.show running queries**<br>
Shows all currently executing queries<br>
Usage: `.show running queries`<br>
Example: `.show running queries`<br>
This shows all currently running queries.<br>

**.show database policy caching**<br>
Shows the current caching policy on the database<br>
Usage: `.show database DatabaseName policy caching`<br>
Example: `.show database myDatabase policy caching`<br>
This shows the current caching policy for the specified database.<br>

**.show table policy caching**<br>
Shows the current caching policy on the table<br>
Usage: `.show database DatabaseName.TableName policy caching`<br>
Example: `.show database myDatabase.myTable policy caching`<br>
This shows the current cachingt policy for the specified table.<br>

**.show commands-and-queries**<br>
Returns a table with admin commands and queries which have reached a final state. These commands and queries are available to query for 30 days.<br>
Usage: `.show commands-and-queries`<br>
Example: `.show commands-and-queries | where StartedOn > ago(1d) | where State != "Completed"`<br>
This Shows all commands and queries that failed in the last day<br>

**.show table policy retention**<br>
Shows tables' effective retention policy taking cluster and database rules into account<br>
Usage: `.show table(s) (<table_name> [, ...]) policy retention`<br>
Example: `.show table ['events.all'] policy retention`<br>
This shows the current retention policy for the "events.all" table.


**.alter table policy retention** (restricted to performance level 2 and above)<br>
Change the current retention policy on table(s) to <retention_policy><br>
Usage: `.alter tables (<table_name> [, ...]) policy retention <retention_policy>`<br>
Example: `.alter table ['events.all'] policy retention softdelete = 90d`<br>
This sets data in the "events.all" table to be removed from the table after 90 days.

## Data Control
**.create table** (restricted to performance level 2 and above)<br>
Creates a new empty table. The command must run in context of a specific database. If the table already exists the command will return success.<br>
Usage: `.create table TableName ([columnName:columnType], ...)`<br>
Example: `.create table ['custom.logs'] (Level:string, Timestamp:datetime, Id:string, Message:string)`<br>
This creates a new table called "custom.logs" with four columns. **IMPORTANT Custom tables must begin with "custom.".**

**.drop table** (restricted to performance level 2 and above)<br>
Drops the specified table. Note: This cannot be undone.<br>
Usage: `.drop table TableName [ifexists]`<br>
Example: `.drop table ['custom.logs']`<br>
This drops the table named "custom.logs".

**.set** (restricted to performance level 2 and above)<br>
Creates a table with results of Query Or Command<br>
Usage: `.set  TableName [with (PropertyName = PropertyValue [, ...])] <| QueryOrCommand`<br>
Example: `.set [‘custom.recentEvents’] <| [‘events.all’] | where Timestamp > now() – time(1h)`<br>
This creates a table "custom.recentEvents" containing the results of the above query

**.append** (restricted to performance level 2 and above)<br>
Appends an existing table with results of QueryOrCommand<br>
Usage: `.append  TableName [with (PropertyName = PropertyValue [, ...])] <| QueryOrCommand`<br>
Example: `.append [‘custom.recentEvents’] <| [‘events.all’] | where Timestamp > now() – time(1h)`<br>
This adds to existing table "custom.recentEvents" with the results of the above query

**.set-or-append** (restricted to performance level 2 and above)<br>
Create or appends to a table with results of QueryOrCommand<br>
Usage: `.set-or-append  TableName [with (PropertyName = PropertyValue [, ...])] <| QueryOrCommand`<br>
Example: `.set-or-append [‘custom.weekEvents’] <| [‘events.all’] | where Timestamp > now() – time(7d)`<br>
This appends data from the above query to table "custom.weekEvents". If the table does not exist, create it.

**.set-or-replace** (restricted to performance level 2 and above)<br>
Replaces the data of the table if it exists (drops the existing data shards), or creates the target table if doesn't already exist. The table schema will be preserved unless one of extend_schema or recreate_schema ingestion property is set to true. If the schema is modified, this happens before the actual data ingestion in its own transaction, so a failure to ingest the data doesn't mean the schema wasn't modified.<br>
Usage: `.set-or-replace  TableName [with (PropertyName = PropertyValue [, ...])] <| QueryOrCommand`<br>
Example: `.set-or-replace [‘custom.dayEvents’] <| [‘events.all’] | where Timestamp > now() – time(1d)`<br>
This replaces the data in table "custom.dayEvents" with the above query.

**.ingest into** (restricted to performance level 2 and above)<br>
Ingests data into a table by "pulling" the data from one or more cloud storage artifacts. <br>
Usage: `.ingest  into table TableName SourceDataLocator [with ( IngestionPropertyName = IngestionPropertyValue [, ...] )]`<br>
Example: `.ingest into table [‘custom.myData’] (h’<your url here>’) with(ignoreFirstRecord=true)`<br>
This pushes data into table "custom.myData" from your cloud storage listed in the url.

**.purge table** (restricted to performance level 2 and above)<br>
Permanently deletes data in table from the database<br>
Usage: `.purge table [TableName] in database [DatabaseName] allrecords with (noregrets='true')`<br>
Example: `.purge table [‘custom.toPurge’] in database MyDatabase allrecords`<br>
This purges all data from table "custom.toPurge", permenantly deleting it from your data system.