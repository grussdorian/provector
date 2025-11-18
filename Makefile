EXTENSION  = provector
MODULE_big = provector
OBJS       = provector.o
DATA       = provector--1.0.sql
PGFILEDESC = "C extension for vector operations"

# Use real pg_config
PG_CONFIG = pg_config

# Add gettext include + lib for libintl.h
PG_CPPFLAGS += -I/opt/homebrew/opt/gettext/include
SHLIB_LINK  += -L/opt/homebrew/opt/gettext/lib -lintl

# Optional: your custom flags
PG_CFLAGS += -O2 -Wall -Wextra -Wno-unused-parameter

# PGXS system handles linking, shared library building, etc.
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
