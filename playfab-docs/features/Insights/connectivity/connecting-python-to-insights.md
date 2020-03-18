---
title: Connecting Python to Insights
author: natashaorie
description: Guide to connecting Python to Insights.
ms.author: norie
ms.date: 02/27/2020    
ms.topic: article
ms.prod: playfab
keywords: playfab, insights, python
ms.localizationpriority: medium
---

# Tutorial: Connecting Python to Insights

[comment]: < Replace links with relative links once placement of article is determined. >

This guide helps you get started using Python with Insights. It uses the Azure Kusto Python SDK. To learn more about other tools you can connect with Insights, go to the [connectivity guide](index.md).

## Prerequisites
* A PlayFab user account authenticated with [AAD (Azure Active Directory)](https://docs.microsoft.com/gaming/playfab/features/authentication/aad-authentication/).
* The following [Game Manager permissions](https://docs.microsoft.com/gaming/playfab/features/config/gamemanager/playfab-user-roles#assigning-roles) enabled for your user:
    *  Admin status.
    *  Access to the Explorer tab and associated data.
    *  Read and write access to Analytics data.

## Create an Azure Active Directory (AAD) application and connect it to your title database

1. Follow the steps in this [guide](creating-AAD-app-for-insights.md) to create an Azure Active Directory (AAD) application and connect it to your title database.

## Install Python packages

1. Install the following python packages using [pip](https://pypi.org/project/pip/):
   * azure-kusto-data
   * azure-kusto-ingest
   * adal

Below is an example script to get started with. 

```python
from azure.kusto.data.exceptions import KustoServiceError
from azure.kusto.data.request import KustoClient, KustoConnectionStringBuilder, ClientRequestProperties

from adal import AuthenticationContext

cluster = "https://<title id>.playfabapi.com"

# These parameters are taken from your Azure app
client_id = "<Azure app client id>"
client_secret = "<Azure app client secret>" 
tenant = "<Azure app tenant id>"

authority_url = "https://login.microsoftonline.com/" + tenant
context = AuthenticationContext(authority_url)

# Acquire a token from AAD to pass to PlayFab
resource = "https://help.kusto.windows.net"
token_response = context.acquire_token_with_client_credentials(resource, client_id, client_secret)

token = None
if token_response:
    if token_response['accessToken']:
        token = token_response['accessToken']

kcsb = KustoConnectionStringBuilder.with_aad_application_token_authentication(cluster, token)
client = KustoClient(kcsb)

db = "<title id>"
query = "['events.all'] | count"

# Force Kusto to use the v1 query endpoint
client._query_endpoint = cluster + "/v1/rest/query"

response = client.execute(db, query)

# Response processing
print(response)
```

## Additional resources

* Azure Kusto Python SDK [documentation](https://docs.microsoft.com/azure/kusto/api/python/kusto-python-client-library).
* Connect [more tools](index.md) with Insights.