---
title: Microsoft Entra ID authentication for PlayFab APIs
author: iouris
description: Describes how to authenticate to PlayFab APIs using Microsoft Entra ID delegated tokens instead of developer secret keys.
ms.author: iouris
ms.date: 05/13/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, authentication, entra, azure active directory, oauth, api
ms.localizationpriority: medium
---

# Microsoft Entra ID authentication for PlayFab APIs

PlayFab supports Microsoft Entra ID (formerly Azure Active Directory) authentication for calling Admin, Server and entity APIs. With Entra ID authentication, you sign in with your Microsoft identity and use a delegated access token instead of a developer secret key. Your application handles the sign-in experience using standard OAuth 2.0 public client flows such as authorization code with PKCE, device code, or implicit grant.

> [!NOTE]
> Entra ID authentication is an alternative to developer secret keys for Admin, Server and some entity API calls. Player-facing Client and entity APIs continue to use session tickets and entity tokens obtained through player sign-in. Only entity APIs that are callable with a _title_ entity token can be used with Entra ID.   For more information about secret keys, see [Secret key management](../../../live-service-management/gamemanager/secret-key-management.md).

## Why use Entra ID authentication

Developer secret keys are simple to use, but Entra ID authentication offers several advantages:

- **No shared secrets**—Public client flows don't require a client secret. Tokens are short-lived and scoped to the signed-in user.
- **Individual accountability**—Each API call is tied to a specific user identity, making it easy to audit who did what.
- **Conditional access**—Your organization can apply Entra ID policies like IP restrictions, multifactor authentication (MFA), and device compliance checks.

## How Entra ID authentication works

If you've never worked with Microsoft Entra ID before, it's Microsoft's cloud identity service—the same identity system that backs Microsoft 365, Xbox developer accounts, and Azure. Instead of PlayFab issuing your studio a long-lived secret key, your tool asks Entra ID to sign in a developer and hand back a short-lived **access token**. PlayFab trusts tokens that Entra ID issues for users who are members of your studio.

Three parties are involved:

- **The developer.** You, signed in with a Microsoft Account (personal) or a work or school account (Entra ID).
- **An app registration in Entra ID.** This represents the tool that calls PlayFab—a CLI, a build script, an internal dashboard, and so on. It tells Entra ID "this app is allowed to ask for PlayFab access tokens on behalf of a signed-in user."
- **The PlayFab service.** PlayFab is registered in Entra ID under the application ID `448adbda-b8d8-4f33-a1b0-ac58cf44d4c1` and exposes a delegated permission called `plugin`. When your code requests the scope `448adbda-b8d8-4f33-a1b0-ac58cf44d4c1/plugin`, Entra ID issues a token that PlayFab accepts.

A typical call looks like this:

1. Your code uses the Microsoft Authentication Library (MSAL) to start a sign-in—usually a browser pop-up or a device code prompt.
2. The user signs in with their Microsoft identity and consents to your app calling PlayFab on their behalf.
3. MSAL returns an access token (a JWT) and caches a refresh token so future calls can skip the prompt.
4. Your code sends the token in the `Authorization: Bearer <token>` header on each PlayFab request.
5. PlayFab validates the token, maps it to the matching studio user, and authorizes the call based on that user's role.

For definitions of Entra ID terms used throughout this article, see the [Glossary](#glossary) at the end.

## Prerequisites

- A Microsoft account backed by Entra ID (a work or school account) or a personal Microsoft account (MSA).
- A PlayFab title. For more information, see [Create a PlayFab account](../pfab-account.md).
- Permissions to register applications in your Microsoft Entra ID tenant.
- The calling user must be added to the PlayFab studio and assigned as a title admin. For more information about roles, see [PlayFab user roles](../permissions/playfab-user-roles.md).

## Register a public client application in Entra ID

You need to register an application in your Entra ID tenant so your code can request delegated tokens on behalf of a signed-in user. For public client flows (SPA, device code, implicit), no client secret is needed.

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Search for and select **App registrations**, then select **New registration**.

3. Enter a name for your application (for example, `PlayFab API Client`).

4. Under **Supported account types**, select the option that matches your organization's requirements. For maximum flexibility, select **Accounts in any organizational directory (Any Microsoft Entra ID tenant - Multitenant) and personal Microsoft accounts**. This option allows any Microsoft account to authenticate.

5. Configure the **Redirect URI** based on your application type:
   - For a single-page application (SPA), select **Single-page application (SPA)** and enter your redirect URI (for example, `http://localhost:3000`).
   - For a native or console application using device code flow, select **Public client/native (mobile & desktop)** and enter `http://localhost`.

6. Select **Register**. On the overview page, note the **Application (client) ID**. You need this value when requesting tokens.

7. Add the PlayFab API permission to your app registration:
   1. In the Azure portal, navigate to your app registration and select **API permissions**.
   2. Select **Add a permission** > **APIs my organization uses**.
   3. Search for the PlayFab application ID `448adbda-b8d8-4f33-a1b0-ac58cf44d4c1` and select it.
   4. Select **Delegated permissions**, check the **plugin** permission, and select **Add permissions**.

> [!NOTE]
> If your scenario requires a confidential (web app) client, you also need to create a client secret under **Certificates & secrets**. This article focuses on public client flows, which don't require a secret. For more information about confidential client flows, see [Microsoft identity platform and OAuth 2.0 authorization code flow](/entra/identity-platform/v2-oauth2-auth-code-flow).

## Set up PlayFab studio access

PlayFab validates Entra ID tokens against studio membership. The calling user must be added to the PlayFab studio and granted the appropriate role.

1. Have a studio admin sign in to [Game Manager](https://developer.playfab.com).

2. Navigate to the studio's **Users** section.

3. Select **Add User** and enter the Microsoft account email of the developer who needs API access.

4. Select **Microsoft** as the authentication provider.

5. Assign the user a role that includes Admin or Server API access. At minimum, the user must be a **title admin** for the titles they need to call APIs against.

6. Select **Add user** to send the invitation.

For more information about adding users and assigning roles, see [Account authentication for PlayFab Game Manager](aad-authentication.md).

## Obtain an access token

Your application is responsible for signing in the user and obtaining a delegated access token from Entra ID. The following examples show common public client flows.

### Interactive browser flow (recommended for desktop and console apps)

Interactive browser flow opens a system browser window for sign-in. It's the recommended option for desktop applications and local development tools.

```csharp
using Microsoft.Identity.Client;

// Build an MSAL public client app. The client ID identifies your Entra app
// registration; "common" lets users sign in from any Entra tenant or with a
// personal Microsoft account.
var app = PublicClientApplicationBuilder.Create("your-client-id")
    .WithAuthority("https://login.microsoftonline.com/common")
    .WithDefaultRedirectUri()
    .Build();

// The scope identifies the PlayFab API and the delegated permission ("plugin")
// your app is requesting on behalf of the signed-in user.
string[] scopes = ["448adbda-b8d8-4f33-a1b0-ac58cf44d4c1/plugin"];

AuthenticationResult result;
try
{
    // Try to get a token from MSAL's cache without prompting the user.
    // This succeeds on subsequent runs while the cached refresh token is valid.
    var accounts = await app.GetAccountsAsync();
    result = await app.AcquireTokenSilent(scopes, accounts.FirstOrDefault())
        .ExecuteAsync();
}
catch (MsalUiRequiredException)
{
    // No cached token, or it expired and can't be refreshed silently.
    // Open the system browser so the user can sign in interactively.
    result = await app.AcquireTokenInteractive(scopes)
        .WithUseEmbeddedWebView(false)
        .ExecuteAsync();
}

// The access token is what you send to PlayFab in the Authorization header.
string accessToken = result.AccessToken;
```

### Authorization code with PKCE (recommended for SPAs)

Authorization code flow with Proof Key for Code Exchange (PKCE) is the recommended approach for single-page applications. The following JavaScript example uses the Microsoft Authentication Library (MSAL):

```javascript
import { PublicClientApplication } from "@azure/msal-browser";

// MSAL config. clientId is your Entra app registration's Application (client) ID.
// "common" lets users sign in from any tenant or with a personal account.
// redirectUri must match a Single-page application redirect URI on the app registration.
const msalConfig = {
    auth: {
        clientId: "your-client-id",
        authority: "https://login.microsoftonline.com/common",
        redirectUri: "http://localhost:3000"
    }
};

const msalInstance = new PublicClientApplication(msalConfig);
await msalInstance.initialize();

// loginPopup runs the auth code + PKCE flow in a pop-up window. The scope
// asks Entra ID for a delegated token that PlayFab will accept.
const loginResponse = await msalInstance.loginPopup({
    scopes: ["448adbda-b8d8-4f33-a1b0-ac58cf44d4c1/plugin"]
});

// Send this token to PlayFab in the Authorization header.
const accessToken = loginResponse.accessToken;
```

## Call PlayFab APIs with the access token

Include the Entra ID access token in the `Authorization` header as a Bearer token in your PlayFab API requests, instead of using the `X-SecretKey` header.

### Example request

```http
POST https://{titleId}.playfabapi.com/Server/GetPlayerProfile
Content-Type: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOi...

{
    "PlayFabId": "ABCDEF1234567890"
}
```

> [!NOTE]
> You can't use both `X-SecretKey` and `Authorization: Bearer` in the same request. Use one authentication method per call.

### C\# example

The following example uses the Microsoft Authentication Library (MSAL) to obtain a token and calls the `Server/GetTime` API. Replace `your-client-id` with the **Application (client) ID** from your app registration.

```csharp
using Microsoft.Identity.Client;
using System.Net.Http.Headers;
using System.Text;

// PlayFab API endpoint. Every title gets its own subdomain on playfabapi.com.
string titleId = "YOUR_TITLE_ID";
string host = $"{titleId}.playfabapi.com";
string url = $"https://{host}/Server/GetTime";

// MSAL configuration.
// clientId   - your Entra app registration's Application (client) ID.
// authority  - "common" lets any Entra tenant or personal Microsoft account sign in.
// scopes     - the PlayFab application ID + the "plugin" delegated permission.
string clientId = "your-client-id";
string authority = "https://login.microsoftonline.com/common";
string[] scopes = ["448adbda-b8d8-4f33-a1b0-ac58cf44d4c1/plugin"];

// Build the MSAL public client. Public clients (desktop, CLI, mobile) don't use
// a client secret; tokens are bound to the signed-in user instead.
var app = PublicClientApplicationBuilder.Create(clientId)
    .WithAuthority(authority)
    .WithDefaultRedirectUri()
    .Build();

AuthenticationResult authResult;
try
{
    // Reuse a cached token if MSAL has one. Avoids prompting on every run.
    var accounts = await app.GetAccountsAsync();
    authResult = await app.AcquireTokenSilent(scopes, accounts.FirstOrDefault())
        .ExecuteAsync();
}
catch (MsalUiRequiredException)
{
    // First run, or the cached token expired. Open the system browser to sign in.
    authResult = await app.AcquireTokenInteractive(scopes)
        .WithUseEmbeddedWebView(false)
        .ExecuteAsync();
}

// Call PlayFab. Replace X-SecretKey with an Authorization: Bearer header
// containing the Entra ID access token.
using var httpClient = new HttpClient();
var request = new HttpRequestMessage(HttpMethod.Post, url);
request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", authResult.AccessToken);
request.Content = new StringContent("{}", Encoding.UTF8, "application/json");

var response = await httpClient.SendAsync(request);
var body = await response.Content.ReadAsStringAsync();

Console.WriteLine($"Status: {response.StatusCode}");
Console.WriteLine($"Response: {body}");
```

### Node.js example

The following example uses the `@azure/msal-node` library to obtain a token and calls the `Server/GetTime` API. Replace `your-client-id` with the **Application (client) ID** from your app registration.

```javascript
import { PublicClientApplication } from "@azure/msal-node";
import open from "open";

// PlayFab API endpoint for your title.
const titleId = "YOUR_TITLE_ID";
const host = `${titleId}.playfabapi.com`;
const url = `https://${host}/Server/GetTime`;

// MSAL configuration.
// clientId  - your Entra app registration's Application (client) ID.
// authority - "common" accepts any Entra tenant or personal Microsoft account.
const msalConfig = {
    auth: {
        clientId: "your-client-id",
        authority: "https://login.microsoftonline.com/common",
    },
};

const pca = new PublicClientApplication(msalConfig);

// Token request:
// scopes      - PlayFab application ID + the "plugin" delegated permission.
// redirectUri - must match a Public client redirect URI on the app registration.
// openBrowser - MSAL calls this to launch the user's default browser for sign-in.
const tokenRequest = {
    scopes: ["448adbda-b8d8-4f33-a1b0-ac58cf44d4c1/plugin"],
    redirectUri: "http://localhost:3000",
    openBrowser: async (url) => { await open(url); },
    successTemplate: "<h1>Authentication complete. You can close this window.</h1>",
};

// Sign the user in and obtain a delegated access token.
const authResult = await pca.acquireTokenInteractive(tokenRequest);

// Call PlayFab with the token in the Authorization header instead of X-SecretKey.
const response = await fetch(url, {
    method: "POST",
    headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${authResult.accessToken}`,
    },
    body: JSON.stringify({}),
});

const body = await response.json();
console.log(`Status: ${response.status}`);
console.log("Response:", JSON.stringify(body, null, 2));
```

## Token refresh

Entra ID access tokens are short-lived (typically 60–90 minutes). If you're using MSAL, call `AcquireTokenSilent` (C#) or check the token cache before each request—MSAL handles refresh automatically when a cached refresh token is available.

If you're managing tokens manually, request a new token using the same sign-in flow before the current one expires.

> [!IMPORTANT]
> If a token expires during use, PlayFab returns a `401 Unauthorized` response. Your application should handle this error by requesting a new token and retrying the call.


## Troubleshooting

| Issue | Cause | Resolution |
|---|---|---|
| `401 Unauthorized` | Token is expired or invalid | Sign in again and request a new token |
| `403 Forbidden` | User doesn't have the required role on the title | Verify studio membership and title admin role in Game Manager |
| `AADSTS50076: Need multifactor authentication` | Conditional access policy requires MFA | Complete the MFA challenge and retry |
| `AADSTS700016: Application not found` | Client ID is incorrect or the app isn't in the expected tenant | Verify the client ID and tenant ID |

### Example error responses

A `401 Unauthorized` from PlayFab when the Bearer token is missing, malformed, or expired looks like this:

```json
{
    "code": 401,
    "status": "Unauthorized",
    "error": "NotAuthenticated",
    "errorCode": 1074,
    "errorMessage": "Invalid \"Authorization\" header."
}
```

A `403 Forbidden` from PlayFab when the signed-in user is authenticated but lacks admin permissions on the title looks like this:

```json
{
    "code": 403,
    "status": "Forbidden",
    "error": "NotAuthorizedByTitle",
    "errorCode": 1191,
    "errorMessage": "Developer does not have admin permission for this title."
}
```

## Limitations

The PlayFab SDKs don't currently support Entra ID authentication. To call PlayFab APIs with an Entra ID token today, use direct HTTP calls and set the `Authorization: Bearer <token>` header yourself, as shown in the [C#](#c-example) and [Node.js](#nodejs-example) examples. SDK support is planned for a future release.

## Glossary

| Term | Meaning |
|---|---|
| **Tenant** | An isolated directory in Entra ID. Your company has one; personal Microsoft accounts use a shared tenant called *consumers*. The `common` authority used in the samples lets users sign in from any tenant. |
| **App registration** | The record in Entra ID that describes your client application (its client ID, allowed redirect URIs, requested API permissions). |
| **Delegated permission** | A permission your app receives *on behalf of* a signed-in user, as opposed to acting on its own. |
| **Public client** | A client that can't safely store a secret—a desktop or mobile app, a CLI, or a single-page web app. Public clients use flows like authorization code with PKCE or device code instead of a client secret. |
| **Scope** | The API permission your code is asking Entra ID for. For PlayFab, the scope is `448adbda-b8d8-4f33-a1b0-ac58cf44d4c1/plugin`. |
| **MSAL** | Microsoft Authentication Library. The official client library that implements all of these flows so you don't have to construct OAuth requests by hand. |

## See also

- [Secret key management](../../../live-service-management/gamemanager/secret-key-management.md)
- [Account authentication for PlayFab Game Manager](aad-authentication.md)
- [PlayFab user roles](../permissions/playfab-user-roles.md)
- [API access policy](../../../api-references/api-access-policy.md)
- [Microsoft Entra ID documentation](/entra/fundamentals/whatis)
