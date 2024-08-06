# STRIPS/PDDL PLANNING
## Automated Reasoning and Planning

This repository contains code developed for the STRIPS/PDDL planning activity, simulating the management of packages in a city using a train transportation system between different locations.

### Code Description

The base code used is a modified version of the simplified transport code, specifically adapted for this activity. New predicates and actions have been added to manage location capacities, package processing, and delivery, among other functionalities.

### Base Case

In the base case, an initial state is defined with a train, packages to be processed and delivered, and a network of roads. Two types of searches have been executed: BFWS and LAMA-first.

### Problem 2 and Problem 3

Problems 2 and 3 are also presented, with modifications to available roads, locations, and train capacities. Searches were executed again with different metrics and results.

### Results Comparison

A comparison table of the results obtained in the three problems is provided, highlighting differences in plan length, nodes generated, and nodes expanded between BFWS and LAMA-first.

| Problem        | Search       | Plan Length | Nodes Generated | Nodes Expanded |
|----------------|---------------|-------------|-----------------|----------------|
| Base Case      | BFWS          | 92          | 6357            | 858            |
|                | LAMA-first    | 75          | 3021            | 333            |
| Problem 2      | BFWS          | 97          | 1858            | 1624           |
|                | LAMA-first    | 82          | 1711            | 241            |
| Problem 3      | BFWS          | 96          | 2863            | 2412           |
|                | LAMA-first    | 71          | 2327            | 334            |


### Bibliography

- Example Material: Simplified Transport Domain and Problem
