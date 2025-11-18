\echo Use "CREATE EXTENSION provector" to load this file. \quit

CREATE OR REPLACE FUNCTION provector_demo(inp TEXT) RETURNS TEXT
AS '$libdir/provector', 'provector_demo'
LANGUAGE C STRICT VOLATILE;