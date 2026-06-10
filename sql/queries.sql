#Top 5 Funds by AUM
SELECT
    scheme_name,
    fund_house,
    aum_crore
FROM scheme_performance
ORDER BY aum_crore DESC
LIMIT 5;

#Average NAV Per Month

SELECT
    substr(date, 1, 7) AS month,
    ROUND(AVG(nav), 2) AS avg_nav
FROM nav_history
GROUP BY substr(date, 1, 7)
ORDER BY month;

-- SIP Growth Trend by Year

SELECT
    strftime('%Y', month) AS year,
    ROUND(AVG(yoy_growth_pct), 2) AS avg_yoy_growth_pct
FROM monthly_sip_inflows
GROUP BY strftime('%Y', month)
ORDER BY year;

-- Transaction Amount by State

SELECT
    state,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount_inr), 2) AS total_amount
FROM investor_transactions
GROUP BY state
ORDER BY total_amount DESC;


-- Funds with Expense Ratio Less Than 1%
SELECT
    scheme_name,
    fund_house,
    expense_ratio_pct
FROM scheme_performance
WHERE expense_ratio_pct < 1
ORDER BY expense_ratio_pct;

-- Top 10 Funds by 5-Year Return
SELECT
    scheme_name,
    fund_house,
    return_5yr_pct
FROM scheme_performance
ORDER BY return_5yr_pct DESC
LIMIT 10;

--Top Fund Houses by Number of Schemes
SELECT
    fund_house,
    COUNT(*) AS total_schemes
FROM fund_master
GROUP BY fund_house
ORDER BY total_schemes DESC;

--Most Popular Transaction Type
SELECT
    transaction_type,
    COUNT(*) AS transaction_count
FROM investor_transactions
GROUP BY transaction_type
ORDER BY transaction_count DESC;


--Top 10 Sectors by Portfolio Weight
SELECT
    sector,
    ROUND(SUM(weight_pct), 2) AS total_weight
FROM portfolio_holdings
GROUP BY sector
ORDER BY total_weight DESC
LIMIT 10;