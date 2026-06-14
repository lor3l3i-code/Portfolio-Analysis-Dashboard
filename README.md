# Portfolio-Analysis-Dashboard
Our goal was to create a web app that is simple for users, but supported by solid analytics. Users enter their tickers and weights, and the app helps explain portfolio return and risk in a clearer way.This app evaluates risk metrics, diversification level, and exposure patterns. Machine learning helps turn technical results into simple insights.


**This repositories contains a streamlit code files：** 

app.py

**A list of Python libraries:** 

requirement.txt

**Feaure engineering file:** 

feature_engineering.py

**Machine learning training file:**

train_wrds.py

**Parameters of the trained model：**

feature_cols.joblib  

kmeans_model.joblib  

kmeans_saler.joblib 

rf_model.joblib 

ridge_model.joblib








## Analytics Question

How can we evaluate portfolio risk and diversification based on ticker weights and asset-level return and volatility assumptions?

This project started as a portfolio analysis dashboard and was expanded into a dbt-based analytics project. The dbt models transform portfolio holdings and asset information into final analytical tables that summarize portfolio risk, return, and concentration.

## dbt Project Structure

- `seeds/portfolio_holdings.csv`: Raw portfolio holdings data with portfolio IDs, tickers, and weights.
- `seeds/assets.csv`: Asset-level reference data including sector, asset type, estimated return, and volatility.
- `models/staging/stg_portfolio_holdings.sql`: Cleans portfolio holdings data.
- `models/staging/stg_assets.sql`: Cleans asset reference data.
- `models/marts/dim_assets.sql`: Dimension table describing each asset.
- `models/marts/fct_portfolio_risk.sql`: Fact table summarizing portfolio-level risk and diversification metrics.
- `tests/assert_portfolio_weights_valid.sql`: Business logic test checking that portfolio weights sum to approximately 100%.

## Key Model

The main model is `fct_portfolio_risk`. It directly answers the analytics question by calculating:

- ticker count
- total portfolio weight
- maximum single ticker weight
- weighted expected return
- weighted volatility proxy
- concentration level

## Tests

This project includes the following dbt tests:

- `not_null` test on `fct_portfolio_risk.portfolio_id`
- `unique` test on `fct_portfolio_risk.portfolio_id`
- Business logic test: portfolio weights must sum to approximately 100%

## Insights:

- Portfolio P2 has the highest concentration risk because 50% of the portfolio is allocated to NVDA and 30% is allocated to TSLA. The final fact table classifies this portfolio as `High concentration`.
- Portfolio P1 is more diversified because its largest single ticker weight is only 30%, and it includes both stocks and ETFs. The model classifies this portfolio as `Diversified`.

## Next steps:

- Add real historical price data so the project can calculate actual volatility and realized return instead of using simplified return and volatility assumptions.
- Connect the dbt output more directly to the dashboard so users can compare alternative portfolio allocations and see how risk changes.
