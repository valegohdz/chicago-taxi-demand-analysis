# Chicago Taxi Demand Analysis — Weather Impact & Trip Patterns


## Overview

This project analyzes taxi trip data in Chicago to identify demand concentration patterns across companies and neighborhoods, and to evaluate whether weather conditions significantly affect trip duration.

The analysis combines SQL-based data extraction (PostgreSQL) with Python-based exploratory data analysis and statistical hypothesis testing.

The goal is to generate actionable insights for operational planning and demand management.

---

## Business Questions

1. Which taxi companies concentrate the largest share of trips?
2. Which neighborhoods have the highest average number of completed trips?
3. Does weather significantly impact trip duration on Saturdays?
4. Is the observed difference statistically significant?

---

## Data Sources

Data was extracted using SQL queries in a PostgreSQL environment and exported as CSV files for Python analysis.

The datasets include:

- Number of trips per taxi company (Nov 15–16, 2017)
- Average completed trips per neighborhood (November 2017)
- Trips from the Loop to O’Hare with weather condition labels (Good / Bad)

Raw source data is not included in this repository.

---

## Methodology

### 1. Data Extraction (SQL)
- Aggregations using `GROUP BY`
- Filtering by date and route
- Joining weather and trip datasets

### 2. Data Analysis (Python)
- Data cleaning and validation
- Sorting and ranking companies
- Descriptive statistics (mean, median)
- Distribution analysis
- Hypothesis testing (independent samples t-test)

### 3. Statistical Testing
- Null hypothesis (H0): No difference in average trip duration between Good and Bad weather.
- Alternative hypothesis (H1): Average trip duration differs between weather conditions.
- Significance levels: α = 0.05 and α = 0.01

---

## Key Findings

### 1. Market Concentration by Company

During November 15–16, 2017:

- **Flash Cab** led with **19,558 trips**
- **Taxi Affiliation Services** followed with **11,422 trips**
- **Medallion Leasing** recorded **10,367 trips**

The top three companies account for a disproportionately large share of total trips.

The remaining top 4–10 companies have a median of **9,888 trips**, indicating a clear market concentration among a small number of dominant players.

This suggests limited competition at the highest demand levels during the observed period.

---

### 2. Trip Distribution by Neighborhood (November 2017)

Neighborhoods with the highest average completed trips:

- **Loop**: 10,727.46 trips
- **River North**: 9,523.66 trips
- **Streeterville**: 6,664.66 trips

Neighborhoods with significantly lower averages:

- **Sheffield & DePaul**: 1,259.76 trips
- **Gold Coast**: 1,364.23 trips

Central commercial and business districts concentrate the highest taxi demand, likely driven by tourism, business activity, and transit hubs.

---

### 3. Weather Impact on Trip Duration

The analysis shows that:

- Average trip duration under **Bad weather conditions** is significantly higher than under **Good conditions**.
- Independent samples t-test produced a **p-value = 6.74e-12**.

Since the p-value is far below both α = 0.05 and α = 0.01, the null hypothesis is rejected.

There is strong statistical evidence that weather conditions significantly affect trip duration on Saturdays.

This indicates operational implications for pricing, fleet allocation, and travel time estimation during adverse weather.

---

## Business Implications

- High demand concentration suggests potential pricing power among leading companies.
- Central districts require higher fleet availability.
- Adverse weather increases trip duration, impacting:
  - ETA predictions
  - Driver allocation
  - Surge pricing strategies
  - Customer satisfaction

Understanding these patterns supports data-driven operational planning.

---

## Tech Stack

- SQL (PostgreSQL)
- Python
- pandas
- numpy
- matplotlib
- scipy (statistical testing)

---

## Project Structure

```
chicago-taxi-demand-analysis/
│
├── data/
│   ├── moved_project_sql_result_01.csv (company_trips)
│   ├── data/moved_project_sql_result_04.csv (neighborhood_trips)
│   └── data/moved_project_sql_result_07.csv (weather_trips)
│
├── notebooks/
│   └── chicago_project.ipynb
|
├── sql/
│   └── chicago_taxi_queries.sql
|
├── README.md
└── requirements.txt
```

---

## How to Reproduce

1. Clone the repository
2. Install dependencies:

pip install -r requirements.txt


3. Open the notebook:

jupyter notebook chicago_taxi_analysis.ipynb

---

## Conclusion

The Chicago taxi market during the analyzed period shows:

- Strong company-level demand concentration
- Clear geographic demand clustering
- Statistically significant weather impact on trip duration


Author: Valeria — Junior Data Analyst