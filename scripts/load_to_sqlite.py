import pandas as pd
from sqlalchemy import create_engine, text
from pathlib import Path

# --------------------------------------------------
# Create SQLite Connection
# --------------------------------------------------

db_path = "Data\\db\\bluestock_mf.db"

Path("Data/db").mkdir(parents=True, exist_ok=True)

engine = create_engine(f"sqlite:///{db_path}")

# --------------------------------------------------
# Processed CSV Files
# --------------------------------------------------

datasets = {


    "portfolio_holdings": "Data\\processed\\09_portfolio_holdings_clean.csv",
    "benchmark_indices": "Data\\processed\\10_benchmark_indices_clean.csv"
}

# --------------------------------------------------
# Load CSVs and Verify Counts
# --------------------------------------------------

results = []

for table_name, file_path in datasets.items():

    print(f"\nLoading {table_name}...")

    df = pd.read_csv(file_path)

    csv_rows = len(df)

    # Load into SQLite
    df.to_sql(
        table_name,
        con=engine,
        if_exists="replace",
        index=False
    )

    # Verify row count
    with engine.connect() as conn:
        db_rows = conn.execute(
            text(f"SELECT COUNT(*) FROM {table_name}")
        ).scalar()

    status = "PASS" if csv_rows == db_rows else "FAIL"

    results.append(
        [table_name, csv_rows, db_rows, status]
    )

    print(f"CSV Rows : {csv_rows}")
    print(f"DB Rows  : {db_rows}")
    print(f"Status   : {status}")

# --------------------------------------------------
# Summary Report
# --------------------------------------------------

report = pd.DataFrame(
    results,
    columns=[
        "table_name",
        "csv_rows",
        "db_rows",
        "status"
    ]
)

print("\n" + "=" * 60)
print("LOAD VERIFICATION REPORT")
print("=" * 60)
print(report)

report.to_csv(
    "Data\\processed\\load_verification_report.csv",
    index=False
)

print("\nDatabase saved at:")
print(db_path)