import psycopg2
from sqlalchemy import create_engine
import pandas as pd
from src.utils.generate_database import generate_database


engine = create_engine("postgresql://pgvector:pgvector@localhost:5432/pgvector")

df = generate_database(no_of_rows=1000)

df.to_sql("person_data", engine, if_exists="append", index=False)