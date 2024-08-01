---
title: Handling Multiple PlayFab Logins
author: amccalib
description: Describes how to use SDK features to manage multiple logins from a single client.
ms.author: andmcc
ms.date: 10/27/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, authentication, sdk, unity, unreal
ms.localizationpriority: medium
---

# Handling multiple PlayFab logins

By default, most PlayFab SDKs cache player login results. This caching can be convenient in the most common scenario when you expect a single player login. In games where you support multiple concurrent players or servers where you manage both players' authentication material and server credentials, that caching can get in the way. To facilitate these scenarios, PlayFab SDKs contain both static and instanced API classes.

## Static versus instanced API classes

Most examples and sample code for PlayFab are built using static API classes. In Unity, for example, you might see a reference to __PlayFabClientAPI__. These static classes write to and read from static state within the SDK. Their dependence on static state makes it difficult to use these classes when you're working with multiple players within the same game client. Instanced API classes avoid these problems in exchange for increased management and tracking requirements on your part. In cases where you need to support multiple simultaneous PlayFab logins, we recommend using instanced API classes.

In the Unity SDK, __PlayFabClientInstanceAPI__ is the instanced version of __PlayFabClientAPI__. All other API classes follow a similar naming pattern. When using the instanced version of an API class, you must create an instance of the class before you can call any methods. To create an instance, you have to specify some extra context. For most classes, the extra required context is just the player's authentication context. In Unity, this context is __PlayFabAuthenticationContext__. Some classes contain login calls. For these calls, you might not have a player's authentication context yet. If that's the case, you only have to provide basic settings like a title ID. These settings are passed in via a __PlayFabApiSettings__ object.

## Using instanced API classes

Once you have an instanced API class created with an appropriate authentication context or API settings object, it can be used similarly to a static class. All of the request and response objects are identical. The only difference is that you're responsible for tracking the lifetime of the instance and ensure that any potential callers of PlayFab are provided an appropriate instance. When you're dealing with multiple players, you require multiple instances of any API classes, one per player. It's often easiest to manage these instances encapsulated behind a player object as an owner, but that is left to you.

Instanced classes that log in a player (such as __PlayFabClientInstanceAPI__) also create and cache the authentication context for that player within the API class instance. This feature allows you to easily reference the authentication context when creating any more classes you need.

## Unity example

This sample code demonstrates how multiple players can log in to a game and have independent state tracked in separate class instances. In this example, the API classes and basic functionality are encapsulated behind a simplistic __PlayFabPlayer__ object. When the game starts, we log in two players and then get any data stored in PlayFab for each of those players.

```csharp
using PlayFab;
using PlayFab.ClientModels;
using PlayFab.DataModels;
using System.Collections.Generic;
using UnityEngine;

public class PlayFabLogin : MonoBehaviour
{
    PlayFabPlayer player1 = new PlayFabPlayer();
    PlayFabPlayer player2 = new PlayFabPlayer();

    // Start is called before the first frame update
    void Start()
    {
        if (string.IsNullOrEmpty(PlayFabSettings.staticSettings.TitleId))
        {
            // Please change the titleId below to your own titleId from PlayFab Game Manager.
            PlayFabSettings.staticSettings.TitleId = "";
        }

        player1.Login("testLogin1");
        player2.Login("testLogin2");
    }

    // Update is called once per frame
    void Update()
    {
        if (player1.loggedIn && !player1.dataLoaded && !player1.dataLoading)
        {
            player1.LoadData();
        }
        if (player2.loggedIn && !player2.dataLoaded && !player2.dataLoading)
        {
            player2.LoadData();
        }
    }
}

class PlayFabPlayer
{
    public bool loggedIn = false;
    public bool dataLoading = false;
    public bool dataLoaded = false;
    public string PlayFabId;
    public Dictionary<string, ObjectResult> playerData;

    private PlayFabClientInstanceAPI clientApi;
    private PlayFabDataInstanceAPI dataApi;

    public void Login(string customId)
    {
        clientApi = new PlayFabClientInstanceAPI(PlayFabSettings.staticSettings);

        var request = new LoginWithCustomIDRequest { CustomId = customId, CreateAccount = true };

        clientApi.LoginWithCustomID(request, result =>
        {
            PlayFabId = result.PlayFabId;
            loggedIn = true;
            dataApi = new PlayFabDataInstanceAPI(clientApi.authenticationContext);
            Debug.Log("Login call succeeded.");
        }, error =>
        {
            Debug.LogWarning("Something went wrong with the login call.");
            Debug.LogError("Here's some debug information:");
            Debug.LogError(error.GenerateErrorReport());
        });
    }

    public void LoadData()
    {
        dataLoading = true;
        var request = new GetObjectsRequest { Entity = new PlayFab.DataModels.EntityKey { Id = clientApi.authenticationContext.EntityId, Type = clientApi.authenticationContext.EntityType } };

        dataApi.GetObjects(request, result =>
        {
            playerData = result.Objects;
            dataLoaded = true;
            dataLoading = false;
            Debug.Log("Player data loaded.");
        }, error =>
        {
            Debug.LogWarning("Something went wrong with the GetObjects call.");
            Debug.LogError("Here's some debug information:");
            Debug.LogError(error.GenerateErrorReport());
        });
    }
}
```

## Unreal example

This code sample demonstrates an actor in Unreal that contains its own PlayFab login context. It shows how to encapsulate PlayFab API instance classes within an __ALoginActor__ class. Multiple __ALoginActor__ instances can be added to a map, given their own CustomIds, and perform PlayFab operations independently.

LoginActor.h:
```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "PlayFab.h"
#include "Core/PlayFabError.h"
#include "Core/PlayFabClientDataModels.h"
#include "Core/PlayFabClientAPI.h"
#include "Core/PlayFabDataAPI.h"
#include "LoginActor.generated.h"

UCLASS()
class MINUE_PF_MARKET_API ALoginActor : public AActor
{
	GENERATED_BODY()
	
public:	
	// Sets default values for this actor's properties
	ALoginActor();

    // Please change the TitleId below to your own TitleId from PlayFab Game Manager.
	UPROPERTY(EditAnywhere, config, Category = Settings)
	FString TitleId = TEXT("");

	UPROPERTY(EditAnywhere, config, Category = Settings)
	FString CustomId = TEXT("ExampleCustomId");

protected:
	// Called when the game starts or when spawned

	virtual void BeginPlay() override;

	void OnLoginSuccess(const PlayFab::ClientModels::FLoginResult& Result);
	void OnGetObjectsSuccess(const PlayFab::DataModels::FGetObjectsResponse& Result);
	void OnError(const PlayFab::FPlayFabCppError& ErrorResult) const;

public:	
	bool LoggedIn = false;

	// Called every frame
	virtual void Tick(float DeltaTime) override;

	PlayFabClientPtr clientAPI = nullptr;
	PlayFabDataPtr dataAPI = nullptr;

	TMap<FString, PlayFab::DataModels::FObjectResult> PlayerData;
	bool DataLoaded = false;
};
```

LoginActor.cpp:
```cpp
#include "LoginActor.h"

ALoginActor::ALoginActor()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void ALoginActor::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

void ALoginActor::BeginPlay()
{
	Super::BeginPlay();
    GetMutableDefault<UPlayFabRuntimeSettings>()->TitleId = TitleId;

    clientAPI = IPlayFabModuleInterface::Get().GetClientAPI();
    dataAPI = IPlayFabModuleInterface::Get().GetDataAPI();

    PlayFab::ClientModels::FLoginWithCustomIDRequest request;
    request.CustomId = CustomId;
    request.CreateAccount = true; 

    clientAPI->LoginWithCustomID(request,
        PlayFab::UPlayFabClientAPI::FLoginWithCustomIDDelegate::CreateUObject(this, &ALoginActor::OnLoginSuccess),
        PlayFab::FPlayFabErrorDelegate::CreateUObject(this, &ALoginActor::OnError)
    );
}

void ALoginActor::OnLoginSuccess(const PlayFab::ClientModels::FLoginResult& Result)
{
    UE_LOG(LogTemp, Log, TEXT("Login call succeeded."));
    LoggedIn = true;

    PlayFab::DataModels::FGetObjectsRequest dataRequest;
    dataRequest.AuthenticationContext = Result.AuthenticationContext;
    dataRequest.Entity.Id = Result.EntityToken->Entity->Id;
    dataRequest.Entity.Type = Result.EntityToken->Entity->Type;

    dataAPI->GetObjects(
        dataRequest,
        PlayFab::UPlayFabDataAPI::FGetObjectsDelegate::CreateUObject(this, &ALoginActor::OnGetObjectsSuccess),
        PlayFab::FPlayFabErrorDelegate::CreateUObject(this, &ALoginActor::OnError)
    );
}

void ALoginActor::OnError(const PlayFab::FPlayFabCppError& ErrorResult) const
{
    UE_LOG(LogTemp, Error, TEXT("Something went wrong with your API call.\nHere's some debug information:\n%s"), *ErrorResult.GenerateErrorReport());
}

void ALoginActor::OnGetObjectsSuccess(const PlayFab::DataModels::FGetObjectsResponse& Result)
{
    PlayerData = Result.Objects;
    DataLoaded = true;
	UE_LOG(LogTemp, Log, TEXT("Player data loaded."));    
}
```

## Server authentication

Similar to how instanced API classes allow a game client to handle multiple players, they allow servers to handle a combination of title and player authentication or even multiple titles simultaneously. The basic pattern is nearly identical. Instantiate an API class to handle server login, provide that instance the appropriate __PlayFabApiSettings__ object, and then call an authentication API. If you're on a server, that API is commonly __PlayFabAuthenticationInstanceAPI.GetEntityToken__. Just like a player login, the result of a __GetEntityToken__ call is cached in the API class instance and can be referenced to create more API class instances via the __authenticationContext__ instance property.