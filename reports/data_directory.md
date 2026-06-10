Bluestock Mutual Fund Analytics – Data Dictionary

Dataset 1: fund_master.csv

Source: AMFI / Mutual Fund Master Data

Column	Data Type	Business Definition
amfi_code	INTEGER	Unique AMFI scheme identifier
fund_house	TEXT	Asset Management Company (AMC) name
scheme_name	TEXT	Mutual fund scheme name
category	TEXT	Fund category (Equity, Debt, Hybrid, etc.)
sub_category	TEXT	Detailed scheme classification
plan	TEXT	Direct or Regular plan
launch_date	DATE	Date scheme was launched
benchmark	TEXT	Benchmark index used for comparison
expense_ratio_pct	REAL	Annual expense ratio (%)
exit_load_pct	REAL	Exit load charged on redemption (%)
min_sip_amount	REAL	Minimum SIP investment amount
min_lumpsum_amount	REAL	Minimum lump sum investment amount
fund_manager	TEXT	Fund manager name
risk_category	TEXT	Risk classification
sebi_category_code	TEXT	SEBI category code
Dataset 2: nav_history.csv

Source: MFAPI / AMFI NAV History

Column	Data Type	Business Definition
amfi_code	INTEGER	Scheme identifier
date	DATE	NAV date
nav	REAL	Net Asset Value per unit
Dataset 3: aum_by_fund_house.csv

Source: AMFI Industry Reports

Column	Data Type	Business Definition
date	DATE	Reporting date
fund_house	TEXT	AMC name
aum_lakh_crore	REAL	Assets under management (₹ lakh crore)
num_schemes	INTEGER	Number of schemes managed
aum_crore	REAL	Assets under management (₹ crore)
Dataset 4: monthly_sip_inflows.csv

Source: AMFI Monthly SIP Statistics

Column	Data Type	Business Definition
month	DATE	Reporting month
sip_inflow_crore	REAL	Monthly SIP inflow (₹ crore)
active_sip_accounts_crore	REAL	Active SIP accounts (crore)
new_sip_accounts_lakh	REAL	New SIP registrations (lakh)
sip_aum_lakh_crore	REAL	SIP AUM (₹ lakh crore)
yoy_growth_pct	REAL	Year-over-Year SIP growth (%)
Dataset 5: category_inflows.csv

Source: AMFI Category Flow Reports

Column	Data Type	Business Definition
month	DATE	Reporting month
category	TEXT	Mutual fund category
net_inflow_crore	REAL	Net inflow/outflow (₹ crore)
Dataset 6: industry_folio_count.csv

Source: AMFI Industry Statistics

Column	Data Type	Business Definition
month	DATE	Reporting month
total_folios_crore	REAL	Total folios in industry
equity_folios_crore	REAL	Equity fund folios
debt_folios_crore	REAL	Debt fund folios
hybrid_folios_crore	REAL	Hybrid fund folios
others_folios_crore	REAL	Other category folios
Dataset 7: scheme_performance.csv

Source: Fund Performance Reports

Column	Data Type	Business Definition
amfi_code	INTEGER	Scheme identifier
scheme_name	TEXT	Scheme name
fund_house	TEXT	AMC name
category	TEXT	Fund category
plan	TEXT	Direct/Regular
return_1yr_pct	REAL	1-year annual return (%)
return_3yr_pct	REAL	3-year annualized return (%)
return_5yr_pct	REAL	5-year annualized return (%)
benchmark_3yr_pct	REAL	Benchmark 3-year return (%)
alpha	REAL	Risk-adjusted excess return
beta	REAL	Market sensitivity measure
sharpe_ratio	REAL	Risk-adjusted performance ratio
sortino_ratio	REAL	Downside-risk adjusted ratio
max_drawdown_pct	REAL	Maximum portfolio decline (%)
aum_crore	REAL	Scheme AUM (₹ crore)
expense_ratio_pct	REAL	Expense ratio (%)
morningstar_rating	INTEGER	Rating from 1 to 5
risk_grade	TEXT	Risk assessment grade
Dataset 8: investor_transactions.csv

Source: Simulated Investor Transaction Data

Column	Data Type	Business Definition
investor_id	TEXT	Unique investor identifier
transaction_date	DATE	Transaction date
amfi_code	INTEGER	Scheme identifier
transaction_type	TEXT	SIP, Lumpsum, Redemption
amount_inr	REAL	Transaction amount (₹)
state	TEXT	Investor state
city	TEXT	Investor city
city_tier	TEXT	Tier 1, Tier 2, Tier 3
age_group	TEXT	Investor age category
gender	TEXT	Investor gender
annual_income_lakh	REAL	Annual income (₹ lakh)
payment_mode	TEXT	UPI, Net Banking, Card, etc.
kyc_status	TEXT	VERIFIED, PENDING, REJECTED
Dataset 9: portfolio_holdings.csv

Source: Scheme Portfolio Disclosures

Column	Data Type	Business Definition
amfi_code	INTEGER	Scheme identifier
stock_symbol	TEXT	Stock ticker
stock_name	TEXT	Company name
sector	TEXT	Industry sector
weight_pct	REAL	Portfolio allocation (%)
market_value_cr	REAL	Market value (₹ crore)
current_price_inr	REAL	Current stock price
portfolio_date	DATE	Portfolio disclosure date
Dataset 10: benchmark_indices.csv

Source: NSE / BSE Benchmark Data

Column	Data Type	Business Definition
date	DATE	Trading date
index_name	TEXT	Benchmark index name
close_value	REAL	Index closing value
Key Relationships
Parent Table	Child Table	Join Key
fund_master	nav_history	amfi_code
fund_master	scheme_performance	amfi_code
fund_master	portfolio_holdings	amfi_code
fund_master	investor_transactions	amfi_code
benchmark_indices	fund_master	benchmark