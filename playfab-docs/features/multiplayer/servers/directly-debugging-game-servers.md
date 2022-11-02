---
title: Connect directly to debug game servers
author: dgkanatsios
description: Describes how to connect directly to debug a running server.  
ms.author: digkanat
ms.date: 04/13/2021
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer servers, debugging, integration, thunderhead, playfab game server sdk
ms.localizationpriority: medium
---

# Connect directly to debug game servers

Many debugging tasks of PlayFab Multiplayer Servers can be done locally using [LocalMultiplayerAgent](https://github.com/PlayFab/LocalMultiplayerAgent). However, sometimes the behavior of the game server can differ between the local environment and the actual service so you would like to connect directly to debug a running server because it is marked as unhealthy or not performing as expected.

In order to connect to the VM hosting your game server (either Windows or Linux), you can get Remote Desktop (RDP)/SSH credentials using the "Connect" button on playfab.com web application. You can see this button on the "Virtual Machines" page on your Multiplayer Build) or using [CreateRemoteUser](/rest/api/playfab/multiplayer/multiplayer-server/create-remote-user) API call.

As soon as you connect to the VM, you can use the console of the operating system to monitor your game servers. MPS service uses Docker containers to spin up game server processes. To run Docker CLI commands, you'll need an admin powershell on Windows and __sudo su -__ on Linux.

> [!IMPORTANT]
>
> These are advanced Docker container debugging instructions. Using these instructions may break your game servers. We do not recommend using these commands on containers running your production game servers.
>
> We strongly advise you not to take any dependency on behavior or information you see while debugging the containers. Only publicly documented APIs and behavior are supported, other things can change without notice.

## Instructions for both Windows and Linux

#### How can I get started with Docker containers?
Regardless if you're developing on Linux or Windows, you should get acquainted with the basics of Docker containers. 

You can watch the official "Get Started" video [here (external link)](https://docs.docker.com/get-started/) and experiment in an [interactive playground on Katacoda (external link)](https://www.katacoda.com/courses/docker). To learn more about Windows Containers, see [Windows and containers](/virtualization/windowscontainers/about/).

#### Once I RDP/SSH into the VM, how can I see a list of my running game servers running in Docker containers?
Use __docker ps__. You will see container name and hashes as well as port mapping from the VM port(s) to the Docker container port(s).

#### How can I see the ports used by my game servers?
This information is listed on __docker ps__. You will see something like that:

```
980d7e80457265230a0bf   "/bin/sh -c ./cppLin…"   About a minute ago   Up About a minute   0.0.0.0:30000->3600/tcp, 0.0.0.0:30001->3601/udp  great_archimedes
```

In this case, port 30000 on the VM is mapped onto 3600 on the container for TCP whereas 30001 on the VM is mapped on 3601 on the container for UDP. For more information, see [Docker networking](https://docs.docker.com/network/).

> [!NOTE]
> In both Windows and Linux, Docker containers are part of the "playfab" Docker network. You can do docker inspect network playfab to see information about the network.

#### How can I see runtime details for a container?

Once you do docker ps you can grab the container name or hash and do __docker inspect \<nameOrHash>__. You will see lots of information, like the state of the container, the volume binding on the host VM, port bindings, environment variables passed into the container and more.

#### How can I get the logs of my game server?

You can use the command docker logs \<nameOrHash>. These logs contain everything your app sends to standard output/standard error streams. Bear in mind that these logs exist only for existing containers. If your game server crashes, our monitoring process in the VM will delete this container and create a new one.

Consequently, it's a better practice to use GSDK to log from inside your game server. To learn more, see [Logging with GSDK](integrating-game-servers-with-gsdk.md#logging-with-the-gsdk) and [Archiving and retrieving multiplayer server logs](archiving-and-retrieving-multiplayer-server-logs.md) to access the logs from terminated game servers.

### Can I connect "inside" a running container to see what's going on?

Yup! You can do docker exec -it \<nameOrHash> powershell on Windows and docker exec -it \<nameOrHash> bash on Linux. There, you get access to a command line process in the container where you can issue native commands to debug/diagnose issues.

For this command to work on Linux, Bash shell must be installed in your base container. If it isn't, you can use Bourne shell by running __docker exec -it \<nameOrHash> sh__.

#### How can I see the ports that are open on my container?

Once you are connected "inside" the container, you can use __netstat -ano__ on Windows and __netstat -tulpn__ on Linux when you have a command line process inside your container (check the previous instruction).

If this command doesn't work on Linux, try installing netstat by __apt update && apt install net-tools__. On Linux, you can use __nestatst -tulpn__ inside the VM to see that the ports are indeed open. Recall that VM ports will be different than container ports, you can see this port mapping with __docker ps__ for your containers.

## Linux specific instructions

#### How can I see diagnostics about my container?

You can install __apt install procps__ and then run:

* __ps -aux__ for the current running processes (observer that your main process in the container has a PID of 1. If this process dies, your container will be gone)
* __top__ for real time process information

#### How can I monitor TCP and UDP packets?

* Consider using a tool like [TCPdump (external link)](https://www.tcpdump.org/) utility. 
* Run __apt update && apt install tcpdump__ to install it. In order to use it for a specific port, run __tcpdump port 7777__ for TCP and __tcpdump udp port 7778__ for UDP. 

You can use tcpdump both from inside the VM and from inside the container. However, ensure that you will be monitoring for the correct port value, since there is a port mapping between VM ports and container ports.

## Windows specific instructions

#### How can I determine the required DLLs that need to be in my asset package?

For instructions, see [Determining required DLLs](determining-required-dlls.md). This article is also useful if your game server fails to start because of one or more missing DLLs.

#### LocalMultiplayerAgent is crashing and restarting my Docker container with no error messages. Help!

When this happens, you would see an output similar to this.

```
info: PlayfabMultiplayerAgent[0]
      Waiting for heartbeats from the game server.....
info: PlayfabMultiplayerAgent[0]
      Container 4179fa451214251a45d1a8e8338203a9ff05dc6ec1231c50e1f81f5508b3e1c8 exited with exit code 1.
info: PlayfabMultiplayerAgent[0]
      Collecting logs for container 4179fa451214251a45d1a8e8338203a9ff05dc6ec1231c50e1f81f5508b3e1c8.
info: PlayfabMultiplayerAgent[0]
      Copying log file C:\ProgramData\Docker\containers\4179fa451214251a45d1a8e8338203a9ff05dc6ec1231c50e1f81f5508b3e1c8\4179fa451214251a45d1a8e8338203a9ff05dc6ec1231c50e1f81f5508b3e1c8-json.log for container 4179fa451214251a45d1a8e8338203a9ff05dc6ec1231c50e1f81f5508b3e1c8 to D:\playfab\PlayFabVmAgentOutput\2020-09-29T01-42-01\GameLogs\032e7357-1956-4a60-9682-ca462cc3ea12\PF_ConsoleLogs.txt.
info: PlayfabMultiplayerAgent[0]
      Deleting container 4179fa451214251a45d1a8e8338203a9ff05dc6ec1231c50e1f81f5508b3e1c8.
```

**Debugging steps**

* Check PF_ConsoleLogs.txt for any useful error message
* Check if your .zip asset package contains all the required DLLs for your game. For instructions, see [Determining required DLLs](determining-required-dlls.md).
* Check the Windows Event log to see if there's any useful information about Docker failures

#### On LocalMultiplayerAgent, I am not getting any heartbeats

There might be some leftover containers from previous attempts. You can use __docker ps -a__ to see all containers and __docker rm -f \<containerNameOrTag>__ to delete them.

#### On Windows, how can I monitor TCP and UDP packets?

Consider using a tool like [Wireshark (external link)](https://www.wireshark.org/) utility.

#### How can I debug a deployed multiplayer server using Visual Studio?

For instructions, see [Using Visual Studio to debug servers](allocating-game-servers-and-configuring-vs-debugging-tools.md#debugging-a-deployed-multiplayer-server)

## See also

* [Locally debugging game servers](locally-debugging-game-servers-and-integration-with-playfab.md)
