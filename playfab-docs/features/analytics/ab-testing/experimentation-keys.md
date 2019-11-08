---
title: Experimentation Conceptual Recap
author: shtarwar
description: Experimentation Conceptual Recap and Best Practices.
ms.author: shtarwar
ms.date: 11/07/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, a/b testing, experimentation
ms.localizationpriority: medium
---

# Experimentation Recap

> [!IMPORTANT]
> This improvised experimentation feature is currently in **Private Preview**. 
> It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development. 
> 
> Access to this feature is restricted to select titles. If you are interested in trying it, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com). 

Experimentations explained conceptually by keeping Game and its Players at the center as below:

## A/B Experimentation
A/B Experimentation (Or just “Experimentation”) is a method of comparing two or more different versions (or variants) of a game screen against each other to determine the one which performs or converts the best. This is done so by enabling the versions to users at random, and statistical analysis is done on the collected telemetry to determine which variation performs better as per the conversion goal. 

Please note, despite the name (A/B Experimentation), the experiment can be conducted with as many versions as desired. Also, you can run experiment to compare against existing or entirely new version of the game screen(s). 

## Reasons A/B Experimentation matters
If you know what works and what doesn’t, and have data to back it up, it is easier to make decision, and you can often craft more effective game design, experiences, marketing strategies from the outset. Just remember to keep testing regularly, since the effectiveness of anything can change over time. 

Regardless of what stage of game development journey (creation or operation) you’re on, PlayFab’s A/B experimentation allows individuals, teams, and studios to make careful changes to the game experiences while collecting empirical data which in-turn helps you figure out exactly what works best for the game. 

A/B experimentation helps you transform from “we think” to “we know” decision making power as it gives you insights into gamer’s behavior. It is an effective practice which continuously allow room for growth of your game, be it on any conversion arena - engagement and monetization. Also, one can make better use of the resources and easily enable/ disable game features in a live game.

Here are some common goals for the game studios when A/B testing:
- Increased Active Player Base 
- Higher Conversion Rate
- Lower Churn Rate

## Statistical Significance of an Experiment
A result of an experiment is said to have statistical significance, or be statistically significant, if it is likely not caused by chance for a given statistical significance level. 

When you make decisions based on the results of experiments that you are running, you will want to make sure that a relationship exists. Statistical significance indicates it. 

For example, if you run an A/B experiment with a significance level of 95%, this means that if you determine a winner, you can be 95% confident that the observed results are real and not an error caused by randomness. It also means that there is a 5% chance that you could be wrong.

Statistical significance is important because it reflects your risk tolerance and confidence level. The metrics can fluctuate from day to day, and statistical analysis provides a sound mathematical foundation for making business decisions and eliminating false positives. 

PlayFab Experimentation operates on a build-in statistical computation engine which ensures 95% statistical significance level for your experiments.

## Key Terms
### Conversion Rate
A conversion refers to any desired action that you want the player to take. Conversions do not have to be tied to monetary goals. This can include anything from a click on a button to making a purchase and becoming a player. 

Conversion is the goal of A/B experiments.

Conversions are an absolute number, whereas a conversion rate is the number of conversions divided by the total player traffic. 

### Hypothesis
A hypothesis refers to a claim about the mechanism according to which a given intervention will affect player behavior. It is an idea about what need to be experimented and why, and what changes might appear after the changes.

### Control Variant
A control variant is an existing experience which is used in an experiment as a measure of comparison to ensure that the experiment works. It provides a baseline measurement for the experiment. It makes sure that the treatment you are giving is causing the experimental results, and not something outside the experiment.

### Treatment Variant
A treatment variant receives the experimental treatment(s) or difference in experience(s) in an experiment. It is the treatment variant(s) which are studied in an A/B experiment and contains the experience changes.

### Variables
Variables are defined to set the feature or experience configuration. Defining feature variables allows you to iterate on your feature without redeploying the code.

### % of Flight (Flight Allocation)
A percentage of the total player base (audience) that are considered for the A/B experiment and will receive the control or treatment variant.

### Segment
Segments organizes individual players into group(s) which shares common characteristic(s) as per the user-defined qualifying condition(s)/ criteria(s). 
One can flight an experiment with a customized experience for a Segment to verify the hypothesis that an audience will respond more positively.

### P-Value
The p-value in an A/B experiment is the probability that one would get the observed difference between the variant groups (or a more extreme difference) by random chance. 

When the p-value is high implies that the probability of randomly seeing a difference between the A and B groups is high, due to sampling noise. When the p-value is low (below our threshold) implies that the probability of seeing a difference randomly is low and one can be confident about making the change to the new alternative applicable treatment variant from the original control variant. 

### Confidence Interval
In A/B testing, confidence intervals mitigate the risk of sampling errors, in a sense manages the risk associated with implementing a new variant. If tool says, “We are 95% confident that the conversion rate is X% +/- Y%,” then you need to account for the +/- Y% as the margin of error. How confident you are in your results depends largely on how large the margin of error is. If the two conversion ranges overlap, you need to keep testing to get a valid result.

**Type 1 Error:** 
A type 1 error is a measure of “false positive,” an incorrect belief that a variation in an experiment has made a statistically significant difference. A conclusive winner is declared although the test turned out as inconclusive.

**Type 2 Error:**
A type 2 error is a measure of “false negatives,” an incorrect belief that a variation in an experiment has made no statistically significant difference. No conclusive winner is declared between a control and a variation when there should be one.

## Experimentations as a Practice

-	**Start with hypothesis** 

    Hypothesize to ensure that the experiment have a clear focus and goal. Also, make sure the changes you are testing are significant enough to matter.
    
    To form a hypothesis, use below template: 

    Because of observation [A] and feedback [B], the belief is that changing [C] for players [D] will make [E] happen. It will be validated when I see [F] and obtain [G].

-	**Schedule experiment correctly**
    
    To get reliable results, run your A/B experiments for comparable periods. Do account for seasonal peaks and troughs.

-	**Duration of an experiment** 

    Give the experiment enough time. An experiment’s insufficient time can mean skewed results. Run it too short and you might not collect enough data points for statistically accurate conclusion. Run it too long and you might risk missing out on conversions by not rolling the winning variant to the potentials. If you are in doubt, it is perfectly reasonable to retest.

-	**Pay attention to % of a flight** 
    
    % of flight determines your sample size. Target the audience with a right sample size, otherwise, you will not get reliable results and the decisions made based on that data may be flawed.

-	**Avoid Type 1 and Type 2 errors** 
    Statistics in A/B experimentation can never tell with 100% certainty whether one variant of the experiment is best. It only provides probability, not certainty. So, avoid Type 1 and Type 2 errors. 

    To avoid type 1 error, raise the required significance level before reaching a decision (which we have done for you by setting it to 95%, by default) and running the experiment longer to collect more data. And to reduce the chance of type 2 error, increase the experiment's flighting population (sample size).

-	**Do not make changes mid-way to an experiment**

    If you interrupt the test before the end of the ideal duration or introduce new variables that were not part of the original hypothesis, the results will not be reliable. Meaning, it would be difficult to determine whether one of the changes caused the lift in conversions, or just a random chance.

    Please note, the more variations there are, the longer you must run the tests to get reliable results. Take a granular approach. Recommendation is to experiment with 2-4 variables in any variant group at the same time. That gives the best balance of test duration and efficiency.

-	**Pay attention to statistical significance as reflected in p-value**

    Make sure that the data is reliable. The measure of data reliability is statistical significance which determines that the results are not due to random chance.

    p-values are used to determine statistical significance in a null hypothesis onto which AB experiments are based. Basically, it measures the compatibility between the collected data and the null hypothesis. The lower it is, the more confident one can be in rejecting the null hypothesis.
-	**Keep an open mind**

    At times, one ignores statistical information in favor of using conventional knowledge or even previous experience, to make decision. Use A/B experiment data to inform business decisions – no matter how much it surprises you. If you are not convinced by the results of a test, run it again and compare the data.

## Adopt Experimentation Culture and Process
Experimentation culture is valuable. You must bake it as part of the other processes, so everyone feel/ take its benefits throughout the organization. A/B experimentation done consistently, can improve conversion substantially as you have greater chance of finding ways to add positive product value for the players.

You can shift the decision-making paradigm from relying on HiPPOs (the Highest Paid Person’s Opinion) to data-driven choices. More employee ideas will see daylight in the form of tests. Importantly, when it is easy to try ideas, speak about results and next steps. On top of it, employees feel motivated to come to work.

To build an experimentation culture, introduce reliable and repeatable processes for game iteration. With below foundational steps, one can acquire the culture of constant experimentation. 
-	**Set goals**
    
    Actionable experiment goals (ex. engagement) allow team to move forward with experiments, rather than getting stuck in abstract objectives like ‘growth’.
-	**Test more with your team’s support and prioritize**

    Collect and analyze qualitative and quantitative data such that hypothesizes/ ideas can be brainstormed and prioritized based on the business impact. Guide your team throughout experimentation journey using a reliable and repeatable framework, otherwise, team will feel lost if you suddenly ask them to experiment more and make multiple changes. 
-	**Communicate results back to your team**
    
    Build momentum around experimentation by communicating test results as a team. Sharing provides the team with insights on how to iterate and improve future testing. Plus, gets people excited about further experimentation.
-	**Embrace failure** 

    Failure is a part of testing, normalize failure. Do not let failure stall experimentation, reflect, learn, and move on to continue experimenting. 
-	**Practice good experiment hygiene**

    Create a standard protocol for every experiment your team runs. It helps to keep experiments’ results accurate and meaningful, regardless of who is controlling the experiment.

## Recommended Experimentation Planning Process

| **Stages**                    | **Description**                       | 
|:---------------------------------- |:-----------------------------------| 
| **Opportunity Analysis**                               |
| Investigation                                 | Experiment owner investigate and analyzes A/B experimentation opportunities. Prioritize the experiments |
| **Experiment Design**                               |
| Scoping                                 | Start experiment design. Identify goal metric(s) to formulate a hypothesis  |
| Feature Design Review                                 | Finalize design for feature/ experience change. As part of experiment, it is introduced to a treatment variant group via variables   |
| Coding                                 | Implement the feature change |
| Prod Deployment                                 | Review the experiment design. Deploy the associated code   |
| **Experiment Creation**                               |
| Experiment Configuration                                  | Create an experiment in PlayFab |
| **Experiment Execution**                               |
| Run A/B Experiment                                  | Experiment starts as per the experiment configuration. Experiences are orchestrated to the targeted audience. Telemetry is collected and statistical computations are performed |
| **Experiment Analysis**                               |
| Evaluate Results                               | Evaluate the results via Scorecards |
| Make Launch Decision                             | Stakeholders evaluate the launch decision |
| **Roll-out or roll-back**                               |
| Wrap-up Experiment                               | Winning variant is rolled up to a 100% of audience  |