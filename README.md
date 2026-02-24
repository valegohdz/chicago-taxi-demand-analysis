# Chicago Taxi Demand Analysis — Weather Impact & Trip Patterns

## Overview
This project analyzes taxi trip data in Chicago to identify demand patterns and evaluate the impact of weather conditions on trip duration. The analysis combines SQL-based data extraction with Python-based exploratory data analysis and statistical testing.

## Objectives
- Identify the top taxi companies by number of trips  
- Determine neighborhoods with the highest average drop-offs  
- Analyze trip patterns from the Loop to O'Hare Airport  
- Evaluate whether weather conditions significantly affect trip duration  
- Provide data-driven insights for operational and planning decisions  

## Dataset
The dataset was generated through SQL queries applied to a relational database. The extracted data includes:

- Number of trips per taxi company (Nov 15–16, 2017)  
- Average trips per neighborhood (November 2017)  
- Trips from Loop to O'Hare with weather condition information  

Raw data files are not included in this repository.

## Project Structure
chicago-taxi-demand-analysis/  
├── notebooks/  
│   └── proyecto_8.ipynb  
├── data/   (local only, ignored by git)  
├── README.md  
├── requirements.txt  
└── .gitignore  

## Tools & Libraries
- Python  
- pandas  
- numpy  
- scipy  
- matplotlib  

## Key Findings

- A small number of taxi companies concentrate a significant portion of total trips.  
- Central neighborhoods such as Loop and River North show the highest average number of drop-offs.  
- Trip duration from Loop to O'Hare differs significantly depending on weather conditions.  
- Statistical testing confirms that trips during adverse weather conditions ("Bad") have significantly longer average durations compared to favorable conditions ("Good").

## Statistical Testing
An independent two-sample t-test was conducted to evaluate whether trip durations differ between weather conditions.  
The p-value obtained was statistically significant (p < 0.05), leading to rejection of the null hypothesis and confirming that weather impacts trip duration.

---

Author: Valeria — Junior Data Analyst