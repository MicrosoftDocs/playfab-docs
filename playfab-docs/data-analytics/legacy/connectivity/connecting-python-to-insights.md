---
title: Connecting Python to Insights
author: natashaorie
description: Guide to connecting Python to Insights.
ms.author: norie
ms.date: 02/27/2020    
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights, python
ms.localizationpriority: medium
---

# Tutorial: Connecting Python to Insights

This guide helps you get started using Python with Insights. It uses the Azure Kusto Python SDK. After connecting, you can query your game data with Python and use the library from Jupyter Notebooks. To learn more about other tools you can connect with Insights, see [Connecting external tools to Insights](index.md).

> [!NOTE]
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Insights**, continue to see this article for implementation details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

## Prerequisites

### PlayFab account authenticated with Azure AD

You need a PlayFab account or user for which the authentication provider is set to Microsoft. The Microsoft authentication provider uses Azure Active Directory (Azure AD) for authentication which is required to use the Azure services. See [Azure Active Directory Authentication for Game Manager](../../../features/authentication/aad-authentication/index.md) for instructions on creating an Azure AD-authenticated account or user.

To verify that the account, or user, is set to use the Microsoft authentication provider:

* Visit the PlayFab [log in page](https://developer.playfab.com/en-us/login).
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

from msal import ConfidentialClientApplication

cluster = "https://insights.playfab.com"

# These parameters are taken from your Azure app
client_id = "<Azure app client id>"
client_secret = "<Azure app client secret>" 
tenant = "<Azure app tenant id>"

authority_url = "https://login.microsoftonline.com/" + tenant

client_instance = ConfidentialClientApplication(
  client_id=client_id,
  client_credential=client_secret,
  authority=authority_url,
)

# Acquire a token from AAD to pass to PlayFab
_scopes = ["https://help.kusto.windows.net"]
token_response = client_instance.acquire_token_for_client(scopes=_scopes)

token = None
if token_response:
    if token_response['access_token']:
        token = token_response['access_token']

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
