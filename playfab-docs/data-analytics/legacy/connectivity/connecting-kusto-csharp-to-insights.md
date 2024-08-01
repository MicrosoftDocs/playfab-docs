---
title: Connecting Kusto C# SDK to Insights
author: natashaorie
description: Guide to connecting Kusto C# SDK to Insights.
ms.author: norie
ms.date: 05/05/2020    
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights
ms.localizationpriority: medium
---

# Tutorial: Connecting Kusto C# SDK to Insights

This guide helps you get started using the Kusto C# SDK along with Insights. After connecting, you can query your Insights from Azure functions. To learn more about other tools you can connect Insights with, see [Connecting external tools to Insights](index.md).

> [!NOTE]
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Insights**, continue to see this article for implementation details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

## Prerequisites

### PlayFab account authenticated with AAD

You need a PlayFab account or user for which the authentication provider is set to Microsoft. The Microsoft authentication provider uses Azure Active Directory (AAD) for authentication which is required to use the Azure services. See [Azure Active Directory Authentication for Game Manager](../../../features/authentication/aad-authentication/index.md) for instructions on creating an AAD-authenticated account or user.

To verify that the account, or user, is set to use the Microsoft authentication provider:

* Visit [developer.playfab.com](https://developer.playfab.com).
* Select **Sign in with Microsoft** to access your PlayFab account.

If you can sign in, then the account is set to use the Microsoft authentication provider.

### Game Manager permissions for Insights

You need to assign your account a [user role](../../../gamemanager/playfab-user-roles.md) with the following Game Manager permissions enabled:

* Admin status.
* Access to the Explorer tab and associated data.
* Read and write access to Analytics data.

You can either create a new user role or add these permissions to an existing role.

### Other prerequisites

* [Create an Azure Active Directory (AAD) application and connect it to your title database](creating-AAD-app-for-insights.md)

## Install packages

1. Install the following NuGet packages:

   * Required: [Microsoft.Azure.Kusto.Data](https://www.nuget.org/packages/Microsoft.Azure.Kusto.Data/)
   * Optional: [Microsoft.Azure.Kusto.Ingest](https://www.nuget.org/packages/Microsoft.Azure.Kusto.Ingest/)
   * For more optional packages, see the [Kusto .NET SDK documentation](/azure/data-explorer/kusto/api/netfx/about-the-sdk)

2. Below is some sample code to get started with.

```csharp
namespace HelloPlayFabInsights
{
    using System;
    using Kusto.Data;
    using Kusto.Data.Common;
    using Kusto.Data.Net.Client;

    class Program
    {
        const string Cluster = "https://insights.playfab.com";
        const string Database = "<title id>";
        const string AzureAuthority = "microsoft.onmicrosoft.com";
        const string ClientId = "<app id>";
        const string ClientSecret = "<app secret>";

        static void Main()
        {
            var kcsb = new KustoConnectionStringBuilder(Cluster, Database).WithAadApplicationKeyAuthentication(ClientId, ClientSecret, AzureAuthority);

            Console.WriteLine("Run Query...");
            RunQuery(kcsb);

            Console.WriteLine("Run Command...");
            RunCommand(kcsb);
            
        }
    
        /// <summary>
        /// Run a query on your Insights database, and write the results to the console.
        /// </summary>
        /// <param name="kcsb"></param>
        static void RunQuery(KustoConnectionStringBuilder kcsb)
        {
            using (var queryProvider = KustoClientFactory.CreateCslQueryProvider(kcsb))
            {
                var query = "['events.all'] | limit 10";

                var clientRequestProperties = new ClientRequestProperties() {
                    Application = "DotNetSDK",
                    ClientRequestId = Guid.NewGuid().ToString() 
                };
                using (var reader = queryProvider.ExecuteQuery(query, clientRequestProperties))
                { 
                    while (reader.Read())
                    {
                        string name = reader.GetString(2);
                        string titleId = reader.GetString(5);
                        DateTime timestamp = reader.GetDateTime(8);
                        Console.WriteLine("{0}\t{1}\t{2}", name, titleId, timestamp);
                    }
                }
            }
        }

        /// <summary>
        /// Run the ".show tables" command on your Insights database, and write the results to the console.
        /// </summary>
        /// <param name="kcsb"></param>
        static void RunCommand(KustoConnectionStringBuilder kcsb)
        {
            using (var commandProvider = KustoClientFactory.CreateCslAdminProvider(kcsb))
            {
                var command = ".show tables";

                var clientRequestProperties = new ClientRequestProperties()
                {
                    Application = "DotNetSDK",
                    ClientRequestId = Guid.NewGuid().ToString()
                };
                using (var reader = commandProvider.ExecuteControlCommand(command, clientRequestProperties))
                {
                    while (reader.Read())
                    {
                        string tableName = reader.GetString(0);
                        string databaseName = reader.GetString(1);
                        Console.WriteLine("{0}\t{1}", tableName, databaseName);
                    }
                }
            }
        }
    }
}
```

## Additional resources

* [Azure Kusto .NET Samples](https://github.com/Azure/azure-kusto-samples-dotnet)
* [Kusto client library documentation](/azure/data-explorer/kusto/api/netfx/about-kusto-data)
