---
title: Experiments Best Practices and Recommendations
author: shikha-tarware
description: Experiments Best Practices
ms.author: shtarwar
ms.date: 03/03/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, a/b testing, experimentation
ms.localizationpriority: medium
---

# Experiments Recap
This guide introduces you to the practice of experimentation. It details why you should experiment early, best practice recommendations, and provides information to help your become comfortable with the process.

## Reasons experiment matters
Experiments are the gold standard for identifying the effects of game experience changes. If you understand the effects of game experience changes, and have data to back it up, it's easier to make a decision that allows you, to craft more effective game design, experiences, and marketing strategies. Continual experimentation enables you to determine if the effectiveness of your changes diminishes over time.

Regardless of what stage of game development journey (creation or operation) you’re on, PlayFab Experiments allows individuals, teams, and studios to make careful changes to the game experiences while collecting empirical data, which in-turn helps you figure out exactly what works best for the game.

Experiments are an effective practice that gives you insights into a gamer’s behavior in a controlled and limited audience (player traffic). Thus, protecting your player base from an unsatisfactory game experience. Also, you can make better use of the resources and easily enable or disable game features in a live game. Experiments help you transform from “we think” to “we know” decision making power. It's an effective practice, which gives you insights into gamer’s behavior with controlled and limited audience (player traffic). Thus, protecting your player base from repulsive game experience. Also, one can make better use of the resources and easily enable/ disable game features in a live game. 

Here are some common goals for game studios when experimenting: 
- Increased Active Player Base 
- Higher Conversion Rate
- Lower Churn Rate

## Experiment's trustworthiness is Important

When you make decisions based on the results of experiments that you're running, you'll want to make sure that a relationship/ causation exists. An experiment's trustworthiness is equated by the statistical significance of the experiment results.

Trustworthiness is the focus of PlayFab's experiment results. All metrics are checked for statistical significance.

For example, if you run an experiment that measures a two percent lift in retention and it's shown as statistically significant with a p-value of 0.04, that means there's 4% chance that a result of 2% or greater would have been observed assuming there was no difference between A and B (that is, assuming the null hypothesis is true).  The true difference isn't directly measurable, and statistics are used to get a reasonable estimate.  There's a chance that noise (randomness) misleads us. 

Statistical significance is important because it reflects your risk tolerance and confidence level. The metrics can fluctuate from day to day, and statistical analysis provides the sound mathematical foundation for making business decisions in a noisy environment. 

PlayFab Experiments, flags metric movements as statistically significant at 95% confidence or a p-value of 0.05.

## Sample Ratio Mismatch (SRM) 

A sample ratio mismatch (known as an SRM) is a data quality check that indicates a significant difference between expected proportions of users among experiment variants (for example, configured before the experiment started) and the actual proportions of users observed at the end of the experiment.

An SRM indicates that there's some missing data or a redundancy issue that impacts the control and treatment variants in an uneven manner. The basic principle of controlled experiments requires that the treatment and control variants must be statistically equivalent. When this principle is violated, the results of the experiment can suffer from a selection bias..

An analysis that has SRMs is viewed as untrustworthy and you shouldn't use it to make decisions. Indeed, if one's experiment has an SRM, don't draw any conclusions from the analysis (not until you have addressed the SRM.)

### How to detect SRM
Let's take an example where an experiment is configured to run with 10% traffic in each control and treatment variants. 

| **Type**                    | **1 Day** | **2 Day**  | **3 Day**  | **5 Day**  |  **7 Day** | **14 Day** | **21 Day** |
|:----------------------------|:----------|:-----------|:-----------|:-----------|:-----------|:-----------|:-----------| 
| **Treatment Variant Count** | 105       | 1,050      | 10,500     | 105,000    | 1,050,000  | 10,500,000 | 100,500,000| 
| **Control Variant Count**   | 100       | 1,000      | 10,000     | 100,000    | 1,000,000  | 10,000,000 | 100,000,000| 
| **Sample Ratio**            | 1.05      | 1.05       | 1.05       | 1.05       | 1.05       | 1.05       | 1.05       | 
| **SRM p-value**             | 0.7269    | 0.2695     | 0.0005     | ~=0        | ~=0        | ~=0        | ~=0        | 

In this scenario, even though the actual ratio between the two flights is the same in each scenario, one have an increasingly smaller p-value for larger user counts in Treatment and Control. This indicates that the observed outcome isn't as expected.

### How to investigate SRM

SRM investigation and resolution are a complex and uncertain process. Therefore, resolving an SRM requires a structural approach, with a panoramic view, and an awareness of the likelihood of root causes and resolutions strategies. For this,
- Start with the question "why did this happen?" 
- Formulate a hypothesis on the cause of that SRM
- Predict what would be the evidence observed if that hypothesis was true
- Find those pieces of evidence
- Analyze the cause to identify a solution

Asking follow-up questions can help in the investigation to devise the necessary steps for resolution. For example:
* Did this happen in only one analysis/experiment or in multiple?
* What does the treatment do? What is the nature of the experiment?
* Did something change between now (SRM) and before (previous experiment with no SRM)
* Did any of the views, pipelines, filters change?

### Common root-causes for SRMs
- Treatment experience in the game crashes more than control experience
- Treatment experience unintendedly sending different amounts of data. For example, an experiment on the client that increases the telemetry buffer will certainly increase the amount of data that makes it back, which will cause an SRM

## Experiments as a Practice

-	**Start with a hypothesis** 

    Hypothesize to ensure that the experiment has a clear goal and scenario for the experiment. Also, make sure the changes you're testing are significant enough to matter.
    
    To form a hypothesis, use the following template:

    Because of observation [A] and feedback [B], the belief is that changing [C] for players [D] will make [E] happen. It will be validated when I see [F] and obtain [G].

-	**Schedule experiment correctly**
    
    To get reliable results, run your A/B experiments for comparable periods. Do account for seasonal peaks and troughs.

-	**Duration of an experiment** 

    Give the experiment enough time. Insufficient time allocated for the experiment can skew the results. If the run time is too short, you might not collect enough data points for a statistically accurate conclusion. If the run time is too long, you might risk missing conversions by not rolling the winning variant to the potentials. If you are in doubt, it's perfectly reasonable to retest.

-	**Pay attention to % of a flight** 
    
    % of flight determines your sample size. Target the audience with the right sample size, otherwise, you won't get reliable results and the decisions made based on that data might be flawed.

-	**Avoid Type 1 and Type 2 errors** 
    Statistics in experiments provides probability, not a certainty. Therefore, it can't provide 100% certainty whether one variant of the experiment is best. So, avoid Type 1 and Type 2 errors.
    
    To avoid type 1 error, raise the required significance level before reaching a decision (which we have done for you by setting it to 95%, by default) and running the experiment longer to collect more data. And to reduce the chance of type 2 error, increase the experiment's flighting population (sample size).

-	**Do not make changes mid-way to an experiment**

    If you interrupt the test before the end of the ideal duration or introduce new variables that weren't part of the original hypothesis, the results won't be reliable. Meaning, it would be difficult to determine whether one of the changes caused the lift in conversions or just a random chance.

    Please note, the more variations there are, the longer you must run the tests to get reliable results. Take a granular approach. The recommendation is to experiment with 2-4 variables in any variant group at the same time. That gives the best balance of test duration and efficiency.

-	**Pay attention to statistical significance as reflected in p-value**

    Make sure that the data is reliable. The measure of data reliability is the statistical significance, which determines that the results aren't due to random chance.

    p-values are used to determine statistical significance in a null hypothesis onto which AB experiments are based. It measures the compatibility between the collected data and the null hypothesis. The lower it is, the more confident one can be in rejecting the null hypothesis.
-	**Keep an open mind**

    At times, you might be tempted to ignore statistical information in favor of using conventional knowledge or even previous experience, to make the decision – no matter how much it surprises you. If you aren't convinced by the results of a test, run it again and compare the data.

## Adopt Experiments Culture and Process
Experiments culture is valuable. You must imbibe it as part of the other processes, so everyone is benefitted from it across the organization. Consistent A/B experimentation can substantially improve conversion as you have a greater chance of finding ways to add positive product value for the players.

You can shift the decision-making paradigm from relying on HiPPOs (the Highest Paid Person’s Opinion) to data-driven choices. More employee ideas will see daylight in the form of tests. Importantly, when it's easy to try ideas, speak about results and the next steps. On top of it, employees feel motivated to come to work.

To build an experimentation culture, introduce reliable and repeatable processes for game iteration. You can acquire a culture of constant experimentation by using the following foundational steps:
-	**Set goals**
    
    Actionable experiment goals (ex. engagement) allow the team to move forward with experiments, rather than getting stuck in abstract objectives like ‘growth’.
-	**Test more with your team’s support and prioritize**

    Collect and analyze qualitative and quantitative data such that hypotheses/ ideas can be brainstormed and prioritized based on the business impact. Guide your team throughout the experimentation journey using a reliable and repeatable framework, otherwise, the team will feel lost if you suddenly ask them to experiment more and make multiple changes. 
-	**Communicate results back to your team**
    
    Build momentum around experimentation by communicating test results as a team. Sharing provides the team with insights on how to iterate and improve future testing. This gets people excited about further experimentation.
-	**Embrace failure** 

    Failure is a part of testing, normalize failure. Don't let failure stall experimentation, reflect, learn, and move on to continue experimenting. 
-	**Practice good experiment hygiene**

    Create a standard protocol for every experiment your team runs. It helps to keep experiments’ results accurate and meaningful, regardless of who is controlling the experiment.

## Recommended planning process for running experiments

| **Stages**                                      | **Description**                       | 
|:----------------------------------------------- |:-----------------------------------| 
| **Opportunity Analysis**               
| Investigation                                 | Experiment owner investigates and analyzes experiments opportunities. Prioritize the experiments |
| **Experiment Design**         
| Scoping                                 | Start experiment design. Identify goal metric(s) to formulate a hypothesis  |
| Feature Design Review                                 | Finalize design for feature/ experience change. As part of the experiment, it's introduced to a treatment variant group via variables   |
| Coding                                 | Implement the feature change |
| Prod Deployment                                 | Review the experiment design. Deploy the associated code   |
| **Experiment Creation**  
| Experiment Configuration                                  | Create an experiment in PlayFab |
| **Experiment Execution**  
| Run A/B Experiment                                  | Experiment starts as per the experiment configuration. Experiences are orchestrated to the targeted audience. Telemetry is collected and statistical computations are performed |
| **Experiment Analysis**  
| Evaluate Results                               | Evaluate the results via Scorecards |
| Make Launch Decision                             | Stakeholders evaluate the launch decision |
| **Roll-out or roll-back**   
| Wrap-up Experiment                               | Winning variant is rolled up to 100% of the audience  |
