CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE person_data (
    person_id INTEGER PRIMARY KEY,
    country TEXT,
    salary INTEGER,
    age INTEGER,
    sex TEXT,
    cluster INTEGER,
    prob REAL,
    tup_prov TEXT,
    block_prov TEXT
);

CREATE TABLE block_prov_summary (
    prov_expr_cj TEXT[],
    prov_resid TEXT[],
    chi_op BOOLEAN
);

