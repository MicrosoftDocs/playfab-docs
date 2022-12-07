---
title: Connecting Python to Insights
author: natashaorie
description: Guide to connecting Python to Insights.
ms.author: norie
ms.date: 02/27/2020    
ms.topic: article
ms.service: playfab
keywords: playfab, insights, python
ms.localizationpriority: medium
---

# Tutorial: Connecting Python to Insights

This guide helps you get started using Python with Insights. It uses the Azure Kusto Python SDK. After connecting, you can query your game data with Python and use the library from Jupyter Notebooks. To learn more about other tools you can connect with Insights, see [Connecting external tools to Insights](index.md).

## Prerequisites

### PlayFab account authenticated with AAD

You need a PlayFab account or user for which the authentication provider is set to Microsoft. The Microsoft authentication provider uses Azure Active Directory (AAD) for authentication which is required to use the Azure services. See [Azure Active Directory Authentication for Game Manager](../../authentication/aad-authentication/index.md) for instructions on creating an AAD-authenticated account or user.

To verify that the account, or user, is set to use the Microsoft authentication provider:

* Visit the PlayFab [log in page](https://developer.playfab.com/login).
* Select **Sign in with Microsoft** to access your PlayFab account.

If you can sign in, then the account is set to use the Microsoft authentication provider.

### Game Manager permissions for Insights

You need to assign your account a [user role](/gaming/playfab/gamemanager/playfab-user-roles) with the following Game Manager permissions enabled:

* Admin status.
* Access to the Explorer tab and associated data.
* Read and write access to Analytics data.

You can either create a new user role or add these permissions to an existing role.

### Other prerequisites

* [Create an Azure Active Directory (AAD) application and connect it to your title database](creating-AAD-app-for-insights.md)

## Install Python packages

1. Install the following python packages using [pip](https://pypi.org/project/pip/):

   * azure-kusto-data
   * azure-kusto-ingest
   * adal

2. Below is an example script to get started with.

```python
from azure.kusto.data.exceptions import KustoServiceError
from azure.kusto.data.request import KustoClient, KustoConnectionStringBuilder, ClientRequestProperties

from adal import AuthenticationContext

cluster = "https://insights.playfab.com"

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

crp = ClientRequestProperties()
crp.application = "KustoPythonSDK"
response = client.execute(db, query)

# Response processing
print(response)
```

## Additional resources

* [Azure Kusto Python SDK documentation](/azure/data-explorer/kusto/api/python/kusto-python-client-library)
* To learn about other tools to connect to Insights, see  [Connecting external tools to Insights](index.md)
