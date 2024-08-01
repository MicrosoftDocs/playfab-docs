---
title: Experimentation APIs
author: yegarci
description: Provides API names and purposes.
ms.author: yegarci
ms.date: 11/20/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, experiments, experimentation, api
ms.localizationpriority: medium
---

# Experimentation APIs

PlayFab has scalable and integrable [APIs](/rest/api/playfab/experimentation/experimentation) for experimentation. The APIs and associated operation details are as below:  


| **API Name**                    | **Operation**                              | 
|:---------------------------------- |:-----------------------------------| 
| **Create Experiment**        | Allows a client to request the creation of an experiment for the title. The experiment configuration gets defined as part of it, containing the experiment details, like target audience, start date, variant groups, and associated variables for orchestrating the change in experience (or treatment assignment). The treatment assignment can include virtually anything on the client or PlayFab services. |
| **Update Experiment**        | Allows a client to request an update in the experiment configuration of an existing experiment for the title based on the experimentation ID. |
| **Start Experiment**         | Allows a client to request the start of an existing experiment for the title based on the experiment ID. The client code gets orchestrated for the change in experience as per the treatment assignment given for the experimental study on the target audience. |
| **Stop Experiment**          | Allows a client to request the stop of an existing running experiment for the title based on the experiment ID. The default client code (control variant) gets orchestrated for the change in experience for the entire audience. |
| **Delete Experiment**        | Allows a client to request a delete of an experiment in completed/stopped status for the title based on the experiment ID. |
| **Get Experiments**           | Lists all the experiments and its details, no matter which state (drafted, running, and completed/stopped) for the title. |
| **Get Treatment Assignment** | List the treatment assignments for a player for every running experiment in the title. |
| **Get Latest Scorecard** | Gives the latest scorecard result for an experiment of the title. |

> [!Note]
> For more information about the Experiments APIs, see [Experimentation](/rest/api/playfab/experimentation/experimentation) APIs.

## Next steps
* [Codeless experiments quickstart](quickstart.md)
* [Manage Experiments](manage-experiments.md)
* [Analyze Experiments](analyze-experiments.md)
* [Scorecard metrics](scorecard-metrics.md)
* [Integrating Experiments with other PlayFab services](experiments-other-services.md)
* [Prevent Interaction Effects with Exclusion Group](exclusion-groups.md)