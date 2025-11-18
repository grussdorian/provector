-- Recreate the extension
CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS provector;

-- Verify installation
\dx provector
\dt

SELECT 'Extension installed successfully!' as status;
\quit