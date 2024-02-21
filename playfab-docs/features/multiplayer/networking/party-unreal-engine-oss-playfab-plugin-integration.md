---
title: PlayFab SDK Unreal Engine Marketplace Plugin Integration Guide
description: Guidance on how to integrate the PlayFab SDK UE Marketplace Plugin into your existing PlayFab OnlineSubsystem project.
author: SahilAshar
ms.author: saashar
ms.date: 02/15/2024
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, unreal engine 5, ue4, ue5, middleware
---

# Quickstart Guide: Integrating OnlineSubsystem PlayFab with the PlayFab Unreal Engine Marketplace Plugin

This quickstart guide helps you authenticate via OnlineSubsystem (OSS) PlayFab and then reuse that authentication with the PlayFab Unreal Engine (UE) Marketplace Plugin.

## Prerequisites
- Ensure that you integrate OnlineSubsystem PlayFab as a plugin in your `<game>.build.cs` file. In the below example, we create a toggle option to allow integration, and set a definition to allow for `#ifdef` guarding.
    ```cs
    // OnlineSubsystem PlayFab Plugin Settings.
    //
    // While OSS PlayFab is integrated with the game at an engine level, we cannot directly access
    // OSS PF headers unless we integrate it as a plugin.
    //
    // `bOSSPlayFabAsPlugin` must be set to true to expose OSS PlayFab headers directly to the game.
    bool bOSSPlayFabAsPlugin = false;
    if (bOSSPlayFabAsPlugin)
    {
        PublicDependencyModuleNames.AddRange(new string[] { "OnlineSubsystemPlayFab" });
        PublicDefinitions.Add("WITH_OSS_PLAYFAB=1");
    }
    ```

- Ensure that you integrate the PlayFab Plugin in your `<game>.build.cs` file. In the below example, we create a toggle option to allow integration, and set a definition to allow for `#ifdef` guarding.
    ```cs
    // PlayFab Unreal Marketplace Plugin Settings.
    //
    // `bPlayFabPlugin` must be set to true to enable compilation and integration with the PlayFab
    // Unreal Marketplace Plugin.
    // Ensure that the PF Marketplace Plugin is installed via Engine plugin or as a local game plugin.
    bool bPlayFabPlugin = false;
    if (bPlayFabPlugin)
    {
        PrivateDependencyModuleNames.AddRange(new string[] { "PlayFab", "PlayFabCpp", "PlayFabCommon" });
        PublicDefinitions.Add("WITH_PLAYFAB_PLUGIN=1");
    }
    ```

- After you update your `<game.build.cs>` file (and every subsequent time you update it), be sure to regenerate your game's Visual Studio project files by right-clicking your `.uproject` file and selecting `Generate Visual Studio Project Files`.

- OSS PlayFab now offers a public `AuthenticateUserComplete` delegate that triggers on completion of the OSS PF user authentication flow. Bind to this delegate to retrieve details of your OSS PlayFab authentication.
    ```cpp
    /**
    * Delegate used on the completion of FOnlineIdentityPlayFab::AuthenticateUser().
    *
    * @param LocalUserNum the controller number of the associated user that made the request
    * @param bWasSuccessful true if authentication was successful, false if there was an error
    * @param PlatformUserIdStr user identifier returned from the service.
    * @param ErrorStr string representing the error condition
    */
    DECLARE_MULTICAST_DELEGATE_FourParams(FOnAuthenticateUserComplete, int32 /*LocalUserNum*/, bool /*bWasSuccessful*/, const FString& /*PlatformUserIdStr*/, const FString& /*ErrorStr*/);
    typedef FOnAuthenticateUserComplete::FDelegate FOnAuthenticateUserCompleteDelegate;
    ```

## Steps

You can also jump to the [Full Code Example](#full-code-example).

1. **Include the Correct Headers**
    ```cpp
    #ifdef WITH_OSS_PLAYFAB
    #include "OnlineSubsystemPlayFab.h"
    #endif // WITH_OSS_PLAYFAB

    #ifdef WITH_PLAYFAB_PLUGIN
    #include "PlayFab.h"
    #include "PlayFabCommon.h"
    #include "Core/PlayFabClientDataModels.h"
    #endif // WITH_PLAYFAB_PLUGIN
    ```

2. **Retrieve OSS PlayFab**
    ```cpp
    FOnlineSubsystemPlayFab* PFOnlineSub = static_cast<FOnlineSubsystemPlayFab*>(IOnlineSubsystem::Get(TEXT("PLAYFAB")));
    ```

3. **Bind to the `AuthenticateUserComplete` delegate**
    ```cpp
    const FOnlineIdentityPlayFabPtr PlayFabIdentityInterface = PFOnlineSub->GetIdentityInterfacePlayFab();
    PlayFabIdentityInterface->AddOnAuthenticateUserCompleteDelegate_Handle
    (
        0, // LocalUserNum
        FOnAuthenticateUserCompleteDelegate::CreateUObject(this, &UGameInstance::OnAuthenticateUserComplete)
    );
    ```

    Functions that bind to this delegate, must have the same signature as the delegate. For example:
    ```cpp
    void UGameInstance::OnAuthenticateUserComplete(int32 localUserNum, bool bWasSuccessful, const FString& platformUserIdStr, const FString& error)
    ```
  
    You can also bind a lambda to the delegate. For example:
    ```cpp
    // We don't pass the `FOnlineIdentityPlayFabPtr` pointer through the lambda capture since the original
    // local isn't guaranteed to live longer than the lambda and we want to avoid dangling references.
    //
    // You can retrieve `FOnlineIdentityPlayFabPtr` again inside the lambda.
    PlayFabIdentityInterface->AddOnAuthenticateUserCompleteDelegate_Handle
    (
        0, // LocalUserNum
        FOnAuthenticateUserCompleteDelegate::CreateLambda([this](int32 localUserNum, bool bWasSuccessful, const FString& platformUserIdStr, const FString& error)
        {
            // lambda execution
        });
    )
    ```


4. **Handle Authentication Result**: In the function bound to the delegate, handle the result of the authentication. If the authentication is successful, retrieve the authenticated local user via the `platformUserIdStr` from the delegate trigger. Then, construct a PlayFab `LoginResult` from the OSS PlayFab `LocalUser`.
    ```cpp
    void UGameInstance::OnAuthenticateUserComplete(int32 localUserNum, bool bWasSuccessful, const FString& platformUserIdStr, const FString& error)
    {
        if (!bWasSuccessful)
        {
            UE_LOG(LogOnlineGame, Error, TEXT("OSS PlayFab AuthenticateLocalUser Failed. Error: %s"), *error);
            return;
        }

        UE_LOG(LogOnlineGame, Display, TEXT("[%s] AuthenticateLocalUser Complete"), ANSI_TO_TCHAR(__FUNCTION__));

        FOnlineSubsystemPlayFab* PFOnlineSub = static_cast<FOnlineSubsystemPlayFab*>(IOnlineSubsystem::Get(TEXT("PLAYFAB")));
        const FOnlineIdentityPlayFabPtr PlayFabIdentityInterface = PFOnlineSub->GetIdentityInterfacePlayFab();

        if (PlayFabIdentityInterface)
        {
            if (const auto LocalUser = PlayFabIdentityInterface->GetPartyLocalUserFromPlatformIdString(platformUserIdStr))
            {
                // Setting PlayFab SDK Settings for future API calls
                auto& PFCommonModule = IPlayFabCommonModuleInterface::Get();
                PFCommonModule.SetClientSessionTicket(LocalUser->GetSessionTicket());
                PFCommonModule.SetEntityToken(LocalUser->GetEntityToken());

                // Create EntityKey
                auto LocalEntityKey = MakeShared<PlayFab::ClientModels::FEntityKey>();
                LocalEntityKey->Id = LocalUser->GetEntityId();
                LocalEntityKey->Type = LocalUser->GetEntityType();

                // Create EntityToken
                auto LocalEntityToken = MakeShared<PlayFab::ClientModels::FEntityTokenResponse>();
                LocalEntityToken->Entity = LocalEntityKey;
                LocalEntityToken->EntityToken = LocalUser->GetEntityToken();

                // Create LoginResult
                PlayFab::ClientModels::FLoginResult LoginResult;
                LoginResult.EntityToken = LocalEntityToken;
                LoginResult.LastLoginTime = LocalUser->GetEntityTokenUpdateTime();
                LoginResult.PlayFabId = LocalUser->GetPlayFabId();
                LoginResult.SessionTicket = LocalUser->GetSessionTicket();

                // With `LoginResult` populated, we can now use the PlayFab Marketplace Plug-in APIs
                // however we wish. This state is considered "authenticated".
                //
                // This delegate signature functions does not return anything. You can pass `LoginResult`
                // out of this function however you wish.
                // 
                // Example psuedocode for a non-existent function that takes `LoginResult` as a parameter:
                // void UGameInstance::OnAPILoginSuccess(PlayFab::ClientModels::FLoginResult LoginResult);
            }
        }
    }
    ```

5. **Use PlayFab Marketplace Plug-in APIs**: With `LoginResult` populated, you can now use the PlayFab Marketplace Plug-in APIs however you wish. This state is considered "authenticated".

## Full Code Example
```cpp
#ifdef WITH_OSS_PLAYFAB
#include "OnlineSubsystemPlayFab.h"
#endif // WITH_OSS_PLAYFAB

#ifdef WITH_PLAYFAB_PLUGIN
#include "PlayFab.h"
#include "PlayFabCommon.h"
#include "Core/PlayFabClientDataModels.h"
#endif // WITH_PLAYFAB_PLUGIN

...

void UGameInstance::Init()
{
    Super::Init();
    ...

    // This is an example scenario of integrating OnlineSubsystem PlayFab with the
    // PlayFab Unreal Marketplace Plugin.
    //
    // In this scenario, you can authenticate via OSS PlayFab,
    // and then re-use that authentication with the PlayFab Plugin.
    // 
    // OSS PF offers a public `AuthenticateUserComplete` delegate that can be bound;
    // this delegate triggers on completion of the OSS PF user authentication flow.
    // 
    // Below is an example of a game binding to that delegate, retrieving the
    // authenticated local user via the `platformUserIdStr` from the delegate
    // trigger, and then constructing a PlayFab `LoginResult` from the OSS PF
    // `LocalUser.`
    // 
    // These definitions are defined in `<game>.build.cs`.
#if defined(WITH_OSS_PLAYFAB) && defined(WITH_PLAYFAB_PLUGIN)
    // Explicitly retrieve OSS PlayFab - we can't assume it's the default OSS.
    FOnlineSubsystemPlayFab* PFOnlineSub = static_cast<FOnlineSubsystemPlayFab*>(IOnlineSubsystem::Get(TEXT("PLAYFAB")));

    UE_LOG(LogOnlineGame, Warning, TEXT("Retrieved PFOnlineSub"));

    if (PFOnlineSub)
    {
        const FOnlineIdentityPlayFabPtr PlayFabIdentityInterface = PFOnlineSub->GetIdentityInterfacePlayFab();

        PlayFabIdentityInterface->AddOnAuthenticateUserCompleteDelegate_Handle
        (
            0, // LocalUserNum
            FOnAuthenticateUserCompleteDelegate::CreateUObject(this, &UGameInstance::OnAuthenticateUserComplete)
        );
    }
    else
    {
        UE_LOG(LogOnlineGame, Error, TEXT("UGameInstance::Init: Unable to find OnlineSubsystemPlayFab"));
    }
#endif // WITH_OSS_PLAYFAB && WITH_PLAYFAB_PLUGIN

    ...
}

void UGameInstance::OnAuthenticateUserComplete(int32 localUserNum, bool bWasSuccessful, const FString& platformUserIdStr, const FString& error)
{
    if (!bWasSuccessful)
    {
        UE_LOG(LogOnlineGame, Error, TEXT("OSS PlayFab AuthenticateLocalUser Failed. Error: %s"), *error);
        return;
    }

    UE_LOG(LogOnlineGame, Display, TEXT("[%s] AuthenticateLocalUser Complete"), ANSI_TO_TCHAR(__FUNCTION__));

    FOnlineSubsystemPlayFab* PFOnlineSub = static_cast<FOnlineSubsystemPlayFab*>(IOnlineSubsystem::Get(TEXT("PLAYFAB")));
    const FOnlineIdentityPlayFabPtr PlayFabIdentityInterface = PFOnlineSub->GetIdentityInterfacePlayFab();

    if (PlayFabIdentityInterface)
    {
        if (const auto LocalUser = PlayFabIdentityInterface->GetPartyLocalUserFromPlatformIdString(platformUserIdStr))
        {
            // Setting PlayFab SDK Settings for future API calls
            auto& PFCommonModule = IPlayFabCommonModuleInterface::Get();
            PFCommonModule.SetClientSessionTicket(LocalUser->GetSessionTicket());
            PFCommonModule.SetEntityToken(LocalUser->GetEntityToken());

            // Create EntityKey
            auto LocalEntityKey = MakeShared<PlayFab::ClientModels::FEntityKey>();
            LocalEntityKey->Id = LocalUser->GetEntityId();
            LocalEntityKey->Type = LocalUser->GetEntityType();

            // Create EntityToken
            auto LocalEntityToken = MakeShared<PlayFab::ClientModels::FEntityTokenResponse>();
            LocalEntityToken->Entity = LocalEntityKey;
            LocalEntityToken->EntityToken = LocalUser->GetEntityToken();

            // Create LoginResult
            PlayFab::ClientModels::FLoginResult LoginResult;
            LoginResult.EntityToken = LocalEntityToken;
            LoginResult.LastLoginTime = LocalUser->GetEntityTokenUpdateTime();
            LoginResult.PlayFabId = LocalUser->GetPlayFabId();
            LoginResult.SessionTicket = LocalUser->GetSessionTicket();

            // With `LoginResult` populated, we can now use the PlayFab Marketplace Plug-in APIs
            // however we wish. This state is considered "authenticated".
            //
            // This delegate signature functions does not return anything. You can pass `LoginResult`
            // out of this function however you wish.
            // 
            // Example psuedocode for a non-existent function that takes `LoginResult` as a parameter:
            // void UGameInstance::OnAPILoginSuccess(PlayFab::ClientModels::FLoginResult LoginResult);
        }
    }
}
```