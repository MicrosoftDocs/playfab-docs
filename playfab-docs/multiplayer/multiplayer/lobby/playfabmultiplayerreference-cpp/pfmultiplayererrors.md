---
author: fschober-atg
title: "PlayFab Multiplayer C++ SDK Error Codes"
description: "Error codes used by the PlayFab Multiplayer, Lobby and Matchmaking APIs"
ms.author: fschober
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/19/2022
---

# PlayFab Multiplayer C++ SDK Error Codes

The following error codes are used by the PlayFab Multiplayer, Lobby and Matchmaking APIs and can be used for debugging purposes. For diagnostics, the error messages can also be retrieved at runtime via [PFMultiplayerGetErrorMessage](./pfmultiplayer/functions/pfmultiplayergeterrormessage.md).

For additional guidance on handling these errors, check out [Handling Lobby and Matchmaking C++ SDK errors](../lobby-and-matchmaking-client-sdk-errors.md)

### Multiplayer
| Hex | Dec | Description |
| ------ | ------ | ------ |
|	0x89236400	|	-1994169344	|	The PlayFabMultiplayer library must be initialized.	|
|	0x89236401	|	-1994169343	|	Only one PlayFabMultiplayer instance may exist at a time.	|
|	0x89236402	|	-1994169342	|	No PlayFab entity token was associated with the provided entity key. Use PFMultiplayerSetEntityToken to associate a PlayFab entity token with a PlayFab entity key before passing that entity key to the API.	|
|	0x89236403	|	-1994169341	|	The provided multiplayer thread ID is invalid/unknown.	|
|	0x89236404	|	-1994169340	|	The provided PlayFab entity key is malformed or otherwise invalid.	|
|	0x89236405	|	-1994169339	|	The Microsoft Game Core XNetworking feature is unavailable	|
|	0x89236406	|	-1994169338	|	The PlayFab Multiplayer library could not be initialized because the Game Core Network stack was not initialized. Use the Microsoft Game Core XNetworkingGetConnectivityHint API to determine when the network stack is initialized.	|
|	0x89236408	|	-1994169336	|	The operation was canceled due to the title suspending.	|
|	0x89236409	|	-1994169335	|	An unexpected error code was returned by the PlayFab service with a 4XX response code.	|
|	0x8923640A	|	-1994169334	|	An unexpected error code was returned by the PlayFab service with a 5XX response code.	|
|	0x8923640B	|	-1994169333	|	The Entity ID is invalid.	|
|	0x8923640C	|	-1994169332	|	The Entity Type is invalid or unsupported.	|
|	0x8923640D	|	-1994169331	|	A request rate limit was exceeded. The request was not automatically retried again because retries are disabled or the retry-after period was too long.	|

### Lobby
| Hex | Dec | Description |
| ------ | ------ | ------ |
|	0x89236200	|	-1994169856	|	Cannot create local user; local user limit reached.	|
|	0x89236202	|	-1994169854	|	A user with the provided entity ID already exists.	|
|	0x89236203	|	-1994169853	|	Requested, provided, or configured Lobby owner migration policy is invalid.	|
|	0x89236204	|	-1994169852	|	Requested, provided, or configured Lobby access policy is invalid.	|
|	0x89236205	|	-1994169851	|	Requested object is still pending asynchronous creation.	|
|	0x89236206	|	-1994169850	|	The provided max member count value is outside of the allowed range of values.	|
|	0x89236207	|	-1994169849	|	Provided lobby property count exceeds maximum allowed.	|
|	0x89236208	|	-1994169848	|	An unexpected error was encountered.	|
|	0x89236209	|	-1994169847	|	Failed to parse json data.	|
|	0x8923620B	|	-1994169845	|	A parameter or value provided to the PlayFab service was invalid.	|
|	0x8923620C	|	-1994169844	|	An unexpected error code was returned by the PlayFab service.	|
|	0x8923620D	|	-1994169843	|	The provided entity token has expired.	|
|	0x8923620E	|	-1994169842	|	The user is not authorized to execute the operation.	|
|	0x89236212	|	-1994169838	|	An unknown error code was returned by the PlayFab service.	|
|	0x89236213	|	-1994169837	|	The PlayFab entity token is malformed or otherwise invalid.	|
|	0x89236214	|	-1994169836	|	The specified Lobby entity ID is invalid.	|
|	0x89236215	|	-1994169835	|	The provided property bag contains duplicate property keys.	|
|	0x89236216	|	-1994169834	|	A Lobby request rate limit was exceeded. The request was not automatically retried again because retries are disabled or the retry-after period was too long.	|
|	0x89236217	|	-1994169833	|	The owner of the lobby is not a member of the lobby.	|
|	0x8923621A	|	-1994169830	|	The operation could not be completed because the entity provided was not locally authenticated. Please login the entity first and provide the library a token using SetEntityToken.	|
|	0x8923621B	|	-1994169829	|	The provided Lobby state change type is invalid/unknown.	|
|	0x8923621C	|	-1994169828	|	The provided Lobby state change result is invalid/unknown.	|
|	0x8923621D	|	-1994169827	|	The provided Lobby disconnect reason is invalid/unknown.	|
|	0x8923621E	|	-1994169826	|	The PlayFab service returned unexpected 'bad request' error.	|
|	0x8923621F	|	-1994169825	|	The provided Lobby thread ID is invalid/unknown.	|
|	0x89236220	|	-1994169824	|	The operation could not be completed because the entity provided was not a member of the lobby.	|
|	0x89236221	|	-1994169823	|	The PlayFab service returned an invalid/malformed response.	|
|	0x89236222	|	-1994169822	|	Either a lobby update or a member update must be provided.	|
|	0x89236223	|	-1994169821	|	Updates cannot be queued after disconnecting from the lobby.	|
|	0x89236224	|	-1994169820	|	The provided lobby join request contained an invalid property deletion.	|
|	0x89236225	|	-1994169819	|	The requested user was already a member of the lobby.	|
|	0x89236226	|	-1994169818	|	The requested lobby does not exist.	|
|	0x89236227	|	-1994169817	|	The requested lobby was not in a joinable state.	|
|	0x89236228	|	-1994169816	|	The provided Lobby member removed reason is invalid/unknown.	|
|	0x89236229	|	-1994169815	|	The operation could not be completed because the acting member was not the owner.	|
|	0x8923622A	|	-1994169814	|	Lobby member cannot self-promote to owner while owner is still connected using current owner migration policy.	|
|	0x8923622B	|	-1994169813	|	The arrangement string version is not supported.	|
|	0x8923622C	|	-1994169812	|	An arrangement string for the specified entity key was not found in the packed arrangement string.	|
|	0x8923622D	|	-1994169811	|	The arrangement string is an invalid format and could not be parsed.	|
|	0x8923622E	|	-1994169810	|	Requested, provided, or configured Lobby invite listener status is invalid.	|
|	0x8923622F	|	-1994169809	|	The invite listener is already set and must be stopped before resetting.	|
|	0x89236230	|	-1994169808	|	The invite listener is not set and so cannot be stopped.	|
|	0x89236231	|	-1994169807	|	Requested,  provided,  or configured Lobby membership lock is invalid.	|
|	0x89236232	|	-1994169806	|	The member cannot rejoin the lobby because they have been banned.	|
|	0x89236233	|	-1994169805	|	The member cannot join the lobby because they are already concurrently a member of the maximum number of allowed lobbies.	|
|	0x89236234	|	-1994169804	|	The owner cannot promote disconnected member to owner if owner migration policy is Automatic.	|
|	0x89236235	|	-1994169803	|	The connection status is invalid.	|

### Matchmaking
| Hex | Dec | Description |
| ------ | ------ | ------ |
|	0x89236300	|	-1994169600	|	The provided matchmaking ticket status is invalid/unknown.	|
|	0x89236301	|	-1994169599	|	The provided matchmaking ticket result is invalid/unknown.	|
|	0x89236302	|	-1994169598	|	The provided matchmaking ticket cancel reason is invalid/unknown.	|
|	0x89236303	|	-1994169597	|	The provided matchmaking state change type is invalid/unknown.	|
|	0x89236304	|	-1994169596	|	The ticket was canceled due to a cancelation request.	|
|	0x89236305	|	-1994169595	|	The ticket was canceled due to a service error.	|
|	0x89236306	|	-1994169594	|	The ticket was canceled because the timeout elapsed before a match could be found.	|
|	0x89236307	|	-1994169593	|	The ticket was canceled for an unknown reason.	|
|	0x89236308	|	-1994169592	|	Duplicate users are not allowed in the ticket parameters.	|
|	0x89236309	|	-1994169591	|	At least one local user must be specified in the ticket parameters.	|
|	0x8923630A	|	-1994169590	|	There were too many users in the ticket for the queue.	|
|	0x8923630B	|	-1994169589	|	The ticket is already completed.	|
|	0x8923630C	|	-1994169588	|	An unrecoverable failure was encountered when attempting to cancel the ticket.	|
|	0x8923630D	|	-1994169587	|	One of the users is a member of too many tickets.	|
|	0x8923630F	|	-1994169585	|	A matchmaking request rate limit was exceeded. The request was not automatically retried again because retries are disabled or the retry-after period was too long.	|
|	0x89236310	|	-1994169584	|	The timeout elapsed without the service completing the ticket.	|
|	0x89236311	|	-1994169583	|	The calling entity is invalid.	|
|	0x89236312	|	-1994169582	|	One of the users in the ticket has invalid attributes.	|
|	0x89236313	|	-1994169581	|	The queue was not found.	|
|	0x89236314	|	-1994169580	|	The match was not found.	|
|	0x89236315	|	-1994169579	|	The ticket was not found.	|
|	0x89236316	|	-1994169578	|	The user already joined the ticket.	|
|	0x89236317	|	-1994169577	|	The queue config is invalid.	|
|	0x89236318	|	-1994169576	|	One of the users in the ticket has an invalid entity profile.	|
|	0x89236319	|	-1994169575	|	Matchmaking is not enabled for this title.	|
|	0x8923631A	|	-1994169574	|	One of the users in the ticket has attributes that are too large.	|
|	0x8923631B	|	-1994169573	|	One of the ticket attributes is invalid.	|
|	0x8923631C	|	-1994169572	|	The user has not joined the ticket.	|
|	0x8923631D	|	-1994169571	|	The number of queues has exceeded the limit for this title.	|
|	0x8923631E	|	-1994169570	|	The API called does not match the type of ticket requested.	|
|	0x8923631F	|	-1994169569	|	The request was malformed.	|
|	0x89236320	|	-1994169568	|	Match details can only be provided when the ticket is in the matched state.	|
|	0x89236321	|	-1994169567	|	The provided multiplayer protocol type is invalid.	|
  
## Global HRESULT error codes

The following HRESULT errors are gobal error codes and can also be raised by underlying libraries: 

### Global

| Name | Hex | Dec |
| ------ | ------ | ------ |
| E_NOTIMPL | 0x80004001  | -2147467263 |
| E_OUTOFMEMORY | 0x8007000E  | -2147024882 |
| E_INVALIDARG  | 0x80070057  | -2147024809 |
| E_ABORT | 0x80004004  | -2147467260 |
| E_FAIL  | 0x80004005  | -2147467259 |
| E_ACCESSDENIED  | 0x80070005  | -2147024891 |
| E_PENDING | 0x8000000A  | -2147483638 |
| E_UNEXPECTED  | 0x8000FFFF  | -2147418113 |
| E_POINTER | 0x80004003  | -2147467261 |
| E_TIME_CRITICAL_THREAD  | 0x800701A0  | -2147024480 |
| E_NO_TASK_QUEUE | 0x800701AB  | -2147024469 |
| E_NOT_SUPPORTED | 0x80070032  | -2147024846 |
| E_NOT_SUFFICIENT_BUFFER | 0x8007007A  | -2147024774 |
| E_NOINTERFACE | 0x80004002  | -2147467262 |
| E_BOUNDS  | 0x8000000B  | -2147483637 |
| E_ILLEGAL_METHOD_CALL | 0x8000000E  | -2147483634 |

### HTTP Client

| Name | Hex | Dec |
| ------ | ------ | ------ |
| HTTP_E_STATUS_AMBIGUOUS | 0x8019012C  | -2145844948 |
| HTTP_E_STATUS_BAD_GATEWAY | 0x801901F6  | -2145844746 |
| HTTP_E_STATUS_BAD_METHOD  | 0x80190195  | -2145844843 |
| HTTP_E_STATUS_BAD_REQUEST | 0x80190190  | -2145844848 |
| HTTP_E_STATUS_CONFLICT  | 0x80190199  | -2145844839 |
| HTTP_E_STATUS_DENIED  | 0x80190191  | -2145844847 |
| HTTP_E_STATUS_EXPECTATION_FAILED  | 0x801901A1  | -2145844831 |
| HTTP_E_STATUS_429_TOO_MANY_REQUESTS | 0x801901AD  | -2145844819 |
| HTTP_E_STATUS_FORBIDDEN | 0x80190193  | -2145844845 |
| HTTP_E_STATUS_GATEWAY_TIMEOUT | 0x801901F8  | -2145844744 |
| HTTP_E_STATUS_GONE  | 0x8019019A  | -2145844838 |
| HTTP_E_STATUS_LENGTH_REQUIRED | 0x8019019B  | -2145844837 |
| HTTP_E_STATUS_MOVED | 0x8019012D  | -2145844947 |
| HTTP_E_STATUS_NONE_ACCEPTABLE | 0x80190196  | -2145844842 |
| HTTP_E_STATUS_NOT_FOUND | 0x80190194  | -2145844844 |
| HTTP_E_STATUS_NOT_MODIFIED  | 0x80190130  | -2145844944 |
| HTTP_E_STATUS_NOT_SUPPORTED | 0x801901F5  | -2145844747 |
| HTTP_E_STATUS_PAYMENT_REQ | 0x80190192  | -2145844846 |
| HTTP_E_STATUS_PRECOND_FAILED  | 0x8019019C  | -2145844836 |
| HTTP_E_STATUS_PROXY_AUTH_REQ  | 0x80190197  | -2145844841 |
| HTTP_E_STATUS_RANGE_NOT_SATISFIABLE | 0x801901A0  | -2145844832 |
| HTTP_E_STATUS_REDIRECT  | 0x8019012E  | -2145844946 |
| HTTP_E_STATUS_REDIRECT_KEEP_VERB  | 0x80190133  | -2145844941 |
| HTTP_E_STATUS_REDIRECT_METHOD | 0x8019012F  | -2145844945 |
| HTTP_E_STATUS_REQUEST_TIMEOUT | 0x80190198  | -2145844840 |
| HTTP_E_STATUS_REQUEST_TOO_LARGE | 0x8019019D  | -2145844835 |
| HTTP_E_STATUS_SERVER_ERROR  | 0x801901F4  | -2145844748 |
| HTTP_E_STATUS_SERVICE_UNAVAIL | 0x801901F7  | -2145844745 |
| HTTP_E_STATUS_UNEXPECTED  | 0x80190001  | -2145845247 |
| HTTP_E_STATUS_UNEXPECTED_SERVER_ERROR | 0x80190005  | -2145845243 |
| HTTP_E_STATUS_UNSUPPORTED_MEDIA | 0x8019019F  | -2145844833 |
| HTTP_E_STATUS_URI_TOO_LONG  | 0x8019019E  | -2145844834 |
| HTTP_E_STATUS_USE_PROXY | 0x80190131  | -2145844943 |
| HTTP_E_STATUS_VERSION_NOT_SUP | 0x801901F9  | -2145844743 |
| ONL_E_ACTION_REQUIRED | 0x8086000C  | -2138701812 |
| WEB_E_INVALID_JSON_STRING | 0x83750007  | -2089484281 |
| WEB_E_UNEXPECTED_CONTENT  | 0x83750005  | -2089484283 |
