# An Analysis of Female Candidate Success Over Time, with a Focus on Trends, Incumbency, and Electoral Factors

## Overview

This repository contains the code and data used to study how gender and incumbency affect election success in Canadian municipal elections overtime and use logistic regression model to predict future success rates. Results show that female candidates historically faced disadvantages but have seen steady improvements, while incumbency remains a strong predictor that disproportionately benefits male candidates. These findings highlight progress toward gender equity but underscore the need to address remaining structural barriers to representation.



The repo is structured as:
-   `data/00-simulated_data` contains the simulated dataset.
-   `data/01-raw_data` contains the raw data as obtained from [Borealis](https://borealisdata.ca/dataset.xhtml?persistentId=doi:10.5683/SP2/4MZJPQ ).
-   `data/02-analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains details about LLM chat interactions, datasheet, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean and test data.


## Statement on LLM usage

Aspects of the code, paper content, reference and wording refinements were written with the help of the ChatGPT4o. And the entire chat history is available in inputs/llms/usage.txt.
