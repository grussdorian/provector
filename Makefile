EXTENSION  = provector
MODULE_big = provector
OBJS       = provector.o
DATA       = provector--1.0.sql
PGFILEDESC = "C++ extension for vector operations"

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
CXX = clang++
CXXFLAGS = -std=c++17 -fPIC -O2 -Wall -Wextra -Wno-unused-parameter

override CC := $(CXX)
override CFLAGS := $(CXXFLAGS)

PG_CPPFLAGS += -I/opt/homebrew/opt/gettext/include
SHLIB_LINK  += -L/opt/homebrew/opt/gettext/lib -lintl

SHLIB_LINK += -lstdc++
include $(PGXS)