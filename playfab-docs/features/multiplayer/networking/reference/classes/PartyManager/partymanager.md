---
author: jdeweyMSFT
title: "PartyManager"
description: TBD
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 11/08/2019
---

# PartyManager  

The primary management class for interacting with the Party library.  

## Syntax  
  
```cpp  
class PartyManager  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetSingleton](methods/partymanager_getsingleton.md) | Retrieves a reference to the PartyManager singleton instance. |  
| [SetOption](methods/partymanager_setoption.md) | Configures an option to fine-tune Party library functionality. |  
| [GetOption](methods/partymanager_getoption.md) | Retrieves an option used to fine-tune Party library functionality. |  
| [GetErrorMessage](methods/partymanager_geterrormessage.md) | Get the human-readable form of an error. |  
| [SerializeNetworkDescriptor](methods/partymanager_serializenetworkdescriptor.md) | Serializes a network descriptor structure into an opaque string that is safe to communicate over title and platform-specific communication channels. |  
| [DeserializeNetworkDescriptor](methods/partymanager_deserializenetworkdescriptor.md) | Deserializes a network descriptor structure from an opaque string serialized via a prior call to [SerializeNetworkDescriptor()](methods/partymanager_serializenetworkdescriptor.md). |  
| [SetMemoryCallbacks](methods/partymanager_setmemorycallbacks.md) | Optionally configures the memory allocation and freeing callbacks the Party library should use. |  
| [GetMemoryCallbacks](methods/partymanager_getmemorycallbacks.md) | Retrieves the memory allocation and freeing callbacks the Party library is using. |  
| [SetThreadAffinityMask](methods/partymanager_setthreadaffinitymask.md) | Optionally configures the processor on which internal Party library threads will run. |  
| [GetThreadAffinityMask](methods/partymanager_getthreadaffinitymask.md) | Retrieves the current set of processors on which internal Party library threads will run or are running as an affinity mask. |  
| [Initialize](methods/partymanager_initialize.md) | Initializes the PartyManager object instance. |  
| [Cleanup](methods/partymanager_cleanup.md) | Immediately reclaims all resources associated with the PartyManager object. |  
| [StartProcessingStateChanges](methods/partymanager_startprocessingstatechanges.md) | Retrieves an array of all PartyStateChanges to process since the last such call. |  
| [FinishProcessingStateChanges](methods/partymanager_finishprocessingstatechanges.md) | Returns an array of PartyStateChanges that were being processed. |  
| [GetRegions](methods/partymanager_getregions.md) | Gets an array containing the set of regions for which your title is configured, along with roundtrip latency information. |  
| [CreateNewNetwork](methods/partymanager_createnewnetwork.md) | Queues an asynchronous attempt to create a new network. |  
| [ConnectToNetwork](methods/partymanager_connecttonetwork.md) | Queues an asynchronous attempt to connect to a network. |  
| [GetLocalDevice](methods/partymanager_getlocaldevice.md) | Gets the local device. |  
| [CreateLocalUser](methods/partymanager_createlocaluser.md) | Creates a local user object that is used to represent a local user when performing networking and chat operations. |  
| [DestroyLocalUser](methods/partymanager_destroylocaluser.md) | Starts an asynchronous operation to destroy a local user. |  
| [GetLocalUsers](methods/partymanager_getlocalusers.md) | Gets an array containing all local users created by [CreateLocalUser()](methods/partymanager_createlocaluser.md). |  
| [GetNetworks](methods/partymanager_getnetworks.md) | Gets an array of all networks to which the local device is connected or connecting. |  
| [GetChatControls](methods/partymanager_getchatcontrols.md) | Gets an array that contains a combined list of all chat controls on the local device and all remote devices. |  

  
## Remarks  
  
Only a single instance of the class is permitted.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  

  
  
  
