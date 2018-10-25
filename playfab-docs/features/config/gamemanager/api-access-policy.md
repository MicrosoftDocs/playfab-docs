# API Access Policy

Often times, it is necessary for a title to allow/deny certain APIs from the game client for anti-cheat or other security purposes. This tutorial will walk you through how to use API permission policies to achieve this.

> [!NOTE]
> This is an advanced guide. Please be aware that it is possible to completely disable client access to your title using this feature.

## Policy control and structure

Policy is a set of rules, a.k.a. Policy Statements that are applied in a specific situation. Right now, PlayFab only supports API Access Policy. Thus, by definition, it controls access to API resources.

Policies are fetched and updated using API calls from the [PlayFab Admin API](https://api.playfab.com/documentation/admin); specifically, the [GetPolicy](https://api.playfab.com/documentation/admin/method/GetPolicy) and [UpdatePolicy](https://api.playfab.com/documentation/admin/method/UpdatePolicy) methods. Since we will be utilizing the Admin API, please, see our tutorial [Getting PlayFab Developer Keys](../dev-test-live/getting-playfab-developer-keys.md). Developer Keys will let you authorize for Admin API calls. Each policy contains a list of statements, which are, essentially, rules for one or more PlayFab resources. 

The following code illustrates basic operations with policies (please, read the code comments for more details):

```csharp
public void Start() {
    PlayFabSettings.DeveloperSecretKey = "<insert key here>";
    PlayFabSettings.TitleId = "< insert title id here >";
    FetchApiPolicy(UpdateApiPolicy);
}

private void FetchApiPolicy(Action nextAction = null) {
    PlayFabAdminAPI.GetPolicy(new GetPolicyRequest() {
        PolicyName = "ApiPolicy"
    }, result => {
        Debug.Log(result.PolicyName);
        foreach (var statement in result.Statements)
        {
            Debug.Log("Action: "+ statement.Action);
            Debug.Log("Comment: "+ statement.Comment);
            if(statement.ApiConditions != null)
                Debug.Log("ApiCondition.HashSignatureOrEncryption: "+ statement.ApiConditions.HasSignatureOrEncryption);
            Debug.Log("Effect: "+ statement.Effect);
            Debug.Log("Principal: "+statement.Principal);
            Debug.Log("Resource: "+ statement.Resource);
        }

        if (nextAction != null) nextAction();

    },error=>Debug.LogError(error.GenerateErrorReport()));
}

private void UpdateApiPolicy() {
    PlayFabAdminAPI.UpdatePolicy(new UpdatePolicyRequest() {
        PolicyName = "ApiPolicy",
        OverwritePolicy = false, // Append to existing policy. Set to True, to overwrite.
        Statements = new List<PermissionStatement>() {
            new PermissionStatement() {
                Action = "*", // Statement effects Execute action
                ApiConditions = new ApiCondition() {
                    HasSignatureOrEncryption = Conditionals.False // Require no RSA encrypted payload or signed headers
                },
                Comment = "Do not allow clients to confirm purchase",
                Resource = "pfrn:api--/Client/ConfirmPurchase", // Resource name
                Effect = EffectType.Deny, // Do not allow,
                Principal = "*"
            }
        }
    }, result => {
        FetchApiPolicy();
    }, error => Debug.LogError(error.GenerateErrorReport()));
}
```

The program will fetch and print the existing policy **(1)**, then update the policy **(2)**, then fetch and print it again **(3)**. After you run this code for the first time, the (C#) output will look like this:

![Game Manager - Admin API - Get-Update Policy - C# Output](media/tutorials/game-manager-admin-api-get-update-policy-csharp-output.png)  

As shown in the preceding picture, a Policy consists of several [Policy Statements](https://api.playfab.com/documentation/Admin/datatype/PlayFab.Admin.Models/PlayFab.Admin.Models.PermissionStatement).

Each Policy Statement consists of the following items:

[RESOURCE](https://api.playfab.com/documentation/Admin/datatype/PlayFab.Admin.Models/PlayFab.Admin.Models.PermissionStatement) - A **string** that uniquely identifies one or more PlayFab resources. To describe the API resource, please, use the following convention:

  `pfrn:api--/API-GROUP/API-CALL`

  `API-GROUP` should be replaced with one of PlayFab APIs: `Client`, `Server` or `Admin`

  `API-CALL` should be replaced with concrete API name (ex. "ConfirmPurchase", "LoginWithTwitch", "ReportPlayer" etc.

  A resource string supports wildcards. The following resource string will match any resource:

  `pfrn:api--*`

[ACTION](https://api.playfab.com/documentation/Admin/datatype/PlayFab.Admin.Models/PlayFab.Admin.Models.PermissionStatement) - A **string** that describes operation over the resource. Use `*` to match any operation.

[EFFECT](https://api.playfab.com/documentation/Admin/datatype/PlayFab.Admin.Models/PlayFab.Admin.Models.PermissionStatement) - A **string** that serves as a rule definition. Use `Allow` or `Deny` to allow or deny operations over the resource.

[PRINCIPAL](https://api.playfab.com/documentation/Admin/datatype/PlayFab.Admin.Models/PlayFab.Admin.Models.PermissionStatement) - A **string** that uniquely identifies the class of the user. Use `*` to match any user.

[COMMENT](https://api.playfab.com/documentation/Admin/datatype/PlayFab.Admin.Models/PlayFab.Admin.Models.PermissionStatement) - A user-defined **string** that serves to provide more information about the Policy Statement.

[APICONDITIONS](https://api.playfab.com/documentation/Admin/datatype/PlayFab.Admin.Models/PlayFab.Admin.Models.PermissionStatement) - An **optional object** that defines advanced rule conditions, for example Encryption and Signed Headers.

By modifying your policy to use more detailed policy statements, you can set up strong security rules for your application, by only allowing the API you use in your application.
