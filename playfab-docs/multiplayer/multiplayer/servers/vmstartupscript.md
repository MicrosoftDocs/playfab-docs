---
title: Run custom script during VM creation (preview)
author: dgkanatsios
description: Documentation about the VmStartupScript feature that allows you to run custom script during VM creation.
ms.author: digkanat
ms.date: 01/31/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, servers, performance metrics, monitoring, customization, vm, startup, script
ms.localizationpriority: medium
---

# Running custom script during VM creation - VmStartupScript (preview)

## Introduction

> [!Important]
> This feature is in preview. You're welcome to start using it today and give us your feedback. Instructions on how to connect with us is provided at the end of the article. Note that technical support is limited during preview.

VmStartupScript allows you to run a custom script on virtual machines (VMs) that are used in Azure PlayFab Multiplayer Servers (MPS). MPS is optimized for game servers hosting, making it easy for your title to scale dynamically according to demand. To improve the ease of customizing a large number of servers quickly during VM initialization, the custom script can run on every underlying VM that hosts your game servers. It can be used to accomplish tasks such as installing custom software, modifying security settings, using a custom service to log game server output and metrics, and more.

> [!Note]
> This is an advanced feature that should be used with extreme caution. The running script executes in the Virtual Machine (VM) level with admin (root) privileges. If not used properly, it can potentially disrupt the regular flow of the running game servers, or even prevent them from running at all. The end user is responsible for the content of the script.

## How to use VmStartupScript

To use the VmStartupScript feature, you have to provide a custom script, and all the relevant software (optional) you plan to install. The script starts executing when the Virtual Machine is initialized. This operation occurs before the game servers start on every VM. After the script has successfully finished executing, the MPS service proceeds to complete initializing the game servers and delivers them to the **StandingBy** state. To learn more about the different game server's state, see [Lifecycle of a multiplayer server](multiplayer-game-server-lifecycle.md).

To use this feature in an actual production environment, see [Recommended developer workflow](#recommended-development-workflow) before starting.

### Create a script

- Create a file called **PF_StartupScript.sh** for Linux VMs or **PF_StartupScript.ps1** for Windows VMs.
- Add set-up/execution commands in the file. If you need them, here are some commonly used [environment variables](#environment-variables) that you can use in the script. Some actions aren't supported or would cause the VMs to not start successfully, incurring unwanted charges. For details, see the [What is not supported](#what-is-not-supported) section.

For script examples, see [VmStartupScriptGallery](https://github.com/PlayFab/VmStartupScriptGallery).

### Create and upload the zipped file

1. Gather all the relevant software in a folder that your script is planning to use or call. If your script installs third party software, your script can download it during execution, or it can be bundled with it in the zipped file. Skip this step if you aren't installing anything.
2. Create a zipped file (.zip) with the script (.sh or .ps1) you created in the earlier section and the software you gathered in the earlier step, if needed. The script file should be at the root of the zipped file and not inside a directory. Additionally, if your script file isn't named **PF_StartupScript.sh** (Linux) or **PF_StartupScript.ps1** (Windows), it will not be executed and the game servers will fail to start.
3. Upload the zipped file using one of the following methods:

- Use [PlayFab Game Manager](deploy-using-game-manager.md#assets-for-builds)
- Issue a PUT request with the header {"x-ms-blob-type": "BlockBlob"} on the URL returned from the [GetAssetUploadUrl API](/rest/api/playfab/multiplayer/multiplayer-server/get-asset-upload-url) call.
- Use the [PowerShell cmdlets](deploy-using-powershell-api.md#upload-an-asset).

> [!Note]
> We recommend to include all binaries and assets needed by your script in the zipped file as this will result in faster execution and shorter time for MPS to deliver your game servers. Make sure to include the assets for the relevant platform your game servers will run on. For example, if you use Linux servers, you should include "amd64" Debian/Ubuntu packages.

### Apply the custom script to new builds

After uploading the .zip file, use the MPS API to create a new Build after configuring the **VmStartupScriptAssetReference** property. For instructions, see [How to create Builds using the MPS API](deploy-using-powershell-api.md).

- Add the **VmStartupScriptConfiguration.VmStartupScriptAssetReference** property that includes a reference to the uploaded assets file. This property is part of all the "CreateBuild" related APIs, like [CreateBuildWithCustomContainer](/rest/api/playfab/multiplayer/multiplayer-server/create-build-with-custom-container), [CreateBuildWithManagedContainer](/rest/api/playfab/multiplayer/multiplayer-server/create-build-with-managed-container) and [CreateBuildWithProcessBasedServer](/rest/api/playfab/multiplayer/multiplayer-server/create-build-with-process-based-server).
- Add a valid value for the **VmStartupScriptAssetReference.FileName** property. This value must be the same as the name of your assets file, for example **vmstartupscriptassets.zip**.
- The **VmStartupScriptAssetReference.MountPath** property must be empty, since isn't supported for the VmStartupScript feature.

> [!Note]
> If you set up a value for the **MountPath** property, the create build operation will fail.

The code example below creates a Build with Linux Containers and then uses the script in **vmstartupscriptassets.zip** to customize the VMs:

```csharp
var request = new CreateBuildWithCustomContainerRequest()
{ 
    ContainerImageReference = new ContainerImageReference()
    {
         ImageName= "testimagename",
         Tag= "0.1"
    },
    ContainerFlavor = ContainerFlavor.CustomLinux,
    BuildName = "testbuildwithvmstartupscript",
    VmSize = AzureVmSize.Standard_D2as_v4,
    MultiplayerServerCountPerVm = 3,
    Ports= new List<Port>
    {
        new Port()
        {
            Name= "port",
            Num= 123,
            Protocol = ProtocolType.TCP   
        }
    },
    RegionConfigurations = new List<BuildRegionParams> { new BuildRegionParams()
    {
        Region = "EastUs",
        StandbyServers = 3,
        MaxServers = 6

    } 
    },
    VmStartupScriptConfiguration = new VmStartupScriptParams()
    {
        VmStartupScriptAssetReference = new AssetReferenceParams()
        {
            FileName = "vmstartupscriptassets.zip"
        }
    }
};
var result = await PlayFabMultiplayerAPI.CreateBuildWithCustomContainerAsync(request);
```

The VmStartupScript executes during the "Propping" stage of the VM and must terminate successfully for the game servers to start. If it fails (exit code other than 0), VM won't transition to the "Running" state, and you'll need to RDP/SSH to the VM to debug. To learn more, see [Recommended developer workflow](#recommended-development-workflow). The VM will keep retrying to execute the VmStartupScript.

## Special considerations

### On Linux, do I need to have the PF_StartupScript.sh file marked as executable?

Before MPS runs the script file, it marks it as executable and then converts any Windows line endings ("\r\n") to Linux ones ("\n"). So, you don't need to worry about these two things.

### Environment variables

Here are environment variables that you can use in your startup script.

|         Name         |      Description      |
|----------------------|-----------------------|
| PF_TITLE_ID | PlayFab Title ID |
| PF_BUILD_ID | PlayFab MPS Build ID |
| PF_VM_ID | MPS Virtual Machine ID |
| PF_REGION | Azure region where the VM is hosted |
| PF_PUBLIC_IPV4_ADDRESS | Public IP address of the VM |
| PF_FQDN | Fully Qualified Domain Name that corresponds to the VM's Public IP |
| PF_SHARED_CONTENT_FOLDER_VM | folder with VM-wide shared content |

### What is not supported

You shouldn't do these actions from your script, as there is a high chance of disrupting the lifecycle of VM and game servers:

- Don't block during the execution of the startup script. The script must end successfully for the game servers to be created. If you need something to run in the background, you can install it either as a systemd service on Linux or a Windows service.
- Don't use ports starting from 30000 since they're used for the game servers or port 56001 as it's used by VmAgent process (the MPS game server orchestrator executable).
- Don't modify any of the files on the D: (Windows) or /mnt (Linux) paths as these files are necessary for VmAgent operation (apart from folders that contain editable content, like the `PF_SHARED_CONTENT_FOLDER_VM`).
- You shouldn't use [GSDK](https://github.com/PlayFab/gsdk) from within the VmStartupScript or an app that is launched by it. GSDK should only be used from GameServers.
- You shouldn't manually reboot the Virtual Machine as this operation will create challenges in the communication with the MPS Control Plane.

## Ports

When you use the VmStartupScript feature, it is possible to request a number of ports to be exposed on each VM. These ports can be used by any programs launched by your script and are different from the ports MPS opens for your game servers.

### Usage

You can request up to five ports for every VM. For each port, you must specify the protocol (TCP or UDP) and a name. Here is an example of how to request two ports:

```csharp
VmStartupScriptConfiguration = new VmStartupScriptParams()
{
    VmStartupScriptAssetReference = new AssetReferenceParams()
    {
        FileName = "vmstartupscriptassets.zip"
    },
    PortRequests = new List<VmStartupScriptPortRequest>()
        {
            new VmStartupScriptPortRequest()
            {
                Name = "port0",
                Protocol = ProtocolType.TCP
            },
            new VmStartupScriptPortRequest()
            {
                Name = "port1",
                Protocol = ProtocolType.UDP
            }
        }
}
```

Provided you ask for any ports, the following environment variables are available to your script to help you get information about the ports:

|         Name         |      Description      |
|----------------------|-----------------------|
| PF_STARTUP_SCRIPT_PORT_COUNT | Number of VmStartupScript ports |
| PF_STARTUP_SCRIPT_PORT_NAME_(index) | The name for the port, as described in the request |
| PF_STARTUP_SCRIPT_PORT_PROTOCOL_(index) | The protocol for the port, as described in the request |
| PF_STARTUP_SCRIPT_PORT_INTERNAL_(index) | The port that your program should bind to in the VM |
| PF_STARTUP_SCRIPT_PORT_EXTERNAL_(index) | The port that opens in the external endpoint. External clients should use this port to connect to the program that binds to the INTERNAL port |

For example, for the two ports requested in the above sample script, you should expect to find these environment variables in your VmStartupScript:

```bash
PF_STARTUP_SCRIPT_PORT_COUNT

PF_STARTUP_SCRIPT_PORT_INTERNAL_0
PF_STARTUP_SCRIPT_PORT_EXTERNAL_0
PF_STARTUP_SCRIPT_PORT_NAME_0
PF_STARTUP_SCRIPT_PORT_PROTOCOL_0

PF_STARTUP_SCRIPT_PORT_INTERNAL_1
PF_STARTUP_SCRIPT_PORT_EXTERNAL_1
PF_STARTUP_SCRIPT_PORT_NAME_1
PF_STARTUP_SCRIPT_PORT_PROTOCOL_1
```

> [!IMPORTANT]
> Similar to the ports we open for game servers, it is up to you to authenticate clients connecting to your ports. MPS doesn't provide any authentication mechanism for these ports.

> [!NOTE]
> Customers will find that ports that are allocated start from number 20000 and up. However, we recommend that you don't hardcode this value in your scripts as it might change in the future and always use the environment variables to obtain proper port information.

## Development/Debugging

Before using the VmStartupScript feature, we recommend that you check out these sample scripts on our open-source repository on GitHub ([VmStartupScriptGallery](https://github.com/PlayFab/VmStartupScriptGallery)). Contributions are welcome!

### Recommended development workflow

Initially, you should create a test Build with a single VM. This VM should have similar specs as the one you are planning to deploy your production Build on. When this single VM is deployed, you can RDP/SSH, copy the necessary files and try editing/running the script till it's successful.

Once this VM is up and running and you verify that your script behaves as expected, you can place the script and assets in a .zip file. Afterwards, you can upload it and try creating a Build with it. Try to create a single VM Build again to save on costs and scale up once you are certain that your script works.

If you encounter challenges in running your script, you can debug by logging in the VM via RDP/SSH and check the files **PF_StartupScriptStdOut.txt** and **PF_StartupScriptStdErr.txt** for the script's standard output and standard error streams, respectively. These files are located either on D: drive on Windows or on /mnt on Linux.

The script should be idempotent, since there is a chance that it will be executed more than once. For example, if the script tries to download an external resource and it fails because of a network issue, MPS retries the entire script execution.

## Support

MPS service will run whatever you have on your VmStartupScript. However, the team will not provide support for the individual actions and executables that are installed/executed as part of the script.

During preview, get support and give feedback using [PlayFab Community Forums](https://community.playfab.com/) and [Discord](https://aka.ms/msftgamedevdiscord). If you have issues with any script in the VmStartupScriptGallery repo or want to request a new one, use [open an issue](https://github.com/PlayFab/VmStartupScriptGallery/issues) on GitHub.
