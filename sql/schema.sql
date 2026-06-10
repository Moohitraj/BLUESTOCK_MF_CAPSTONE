-- =====================================================
-- DIMENSION TABLES
-- =====================================================

CREATE TABLE IF NOT EXISTS dim_fund (
    fund_key INTEGER PRIMARY KEY AUTOINCREMENT,
    amfi_code INTEGER UNIQUE NOT NULL,

    fund_house TEXT,
    scheme_name TEXT,

    category TEXT,
    sub_category TEXT,
    plan TEXT,

    launch_date DATE,
    benchmark TEXT,

    expense_ratio_pct REAL,
    exit_load_pct REAL,

    min_sip_amount REAL,
    min_lumpsum_amount REAL,

    fund_manager TEXT,
    risk_category TEXT,

    sebi_category_code TEXT
);

CREATE TABLE IF NOT EXISTS dim_date (
    date_key INTEGER PRIMARY KEY,

    full_date DATE UNIQUE NOT NULL,

    day INTEGER,
    month INTEGER,
    month_name TEXT,

    quarter INTEGER,
    year INTEGER,

    week_of_year INTEGER,

    is_weekend INTEGER
);

-- =====================================================
-- FACT TABLES
-- =====================================================

CREATE TABLE IF NOT EXISTS fact_nav (
    nav_key INTEGER PRIMARY KEY AUTOINCREMENT,

    fund_key INTEGER NOT NULL,
    date_key INTEGER NOT NULL,

    nav REAL NOT NULL,

    FOREIGN KEY (fund_key)
        REFERENCES dim_fund(fund_key),

    FOREIGN KEY (date_key)
        REFERENCES dim_date(date_key)
);

CREATE TABLE IF NOT EXISTS fact_transactions (
    transaction_key INTEGER PRIMARY KEY AUTOINCREMENT,

    fund_key INTEGER NOT NULL,
    date_key INTEGER NOT NULL,

    investor_id TEXT,

    transaction_type TEXT,

    amount_inr REAL,

    state TEXT,
    city TEXT,
    city_tier TEXT,

    age_group TEXT,
    gender TEXT,

    annual_income_lakh REAL,

    payment_mode TEXT,

    kyc_status TEXT,

    FOREIGN KEY (fund_key)
        REFERENCES dim_fund(fund_key),

    FOREIGN KEY (date_key)
        REFERENCES dim_date(date_key)
);

CREATE TABLE IF NOT EXISTS fact_performance (
    performance_key INTEGER PRIMARY KEY AUTOINCREMENT,

    fund_key INTEGER NOT NULL,

    return_1yr_pct REAL,
    return_3yr_pct REAL,
    return_5yr_pct REAL,

    benchmark_3yr_pct REAL,

    alpha REAL,
    beta REAL,

    sharpe_ratio REAL,
    sortino_ratio REAL,

    max_drawdown_pct REAL,

    aum_crore REAL,

    expense_ratio_pct REAL,

    morningstar_rating INTEGER,

    risk_grade TEXT,

    FOREIGN KEY (fund_key)
        REFERENCES dim_fund(fund_key)
);

CREATE TABLE IF NOT EXISTS fact_aum (
    aum_key INTEGER PRIMARY KEY AUTOINCREMENT,

    date_key INTEGER NOT NULL,

    fund_house TEXT,

    aum_lakh_crore REAL,

    num_schemes INTEGER,

    aum_crore REAL,

    FOREIGN KEY (date_key)
        REFERENCES dim_date(date_key)
);