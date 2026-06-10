import sqlalchemy
from sqlalchemy import create_engine, inspect

engine = create_engine("sqlite:///Data/db/bluestock_mf.db")
print(inspect(engine).get_table_names())