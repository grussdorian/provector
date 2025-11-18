# Provector extension


## Prerequisits

1. Postgres
2. `pgvector` extension
3. `libpq` or `libpq-dev`

Make sure after installation 

*Note:* This uses Postgres's [PGXS](https://www.postgresql.org/docs/current/extend-pgxs.html)

These specific lines are for homebrew installed `postgres` and `libpq` for `gettext` used in the current demo. For other systems check docs for `gettext` for your specific use case


PG_CPPFLAGS += -I/opt/homebrew/opt/gettext/include
SHLIB_LINK  += -L/opt/homebrew/opt/gettext/lib -lintl

## Installation

```bash
make clean
make
make install
```

To test

```bash
psql -U [username] -d [databasename] -f test/test.sql 
```

Manually test

```sql
SELECT provector_demo('a quIck broWn fOx 123');
```
