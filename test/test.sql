DO $$
DECLARE
    l_txt text;
    n_err int;
    l_msg text;
BEGIN
    n_err = 0;

    SELECT provector_demo('12345')
        INTO l_txt;
    IF l_txt != '12345' THEN
        RAISE NOTICE 'Failed to convert 12345 to 12345';
        n_err = n_err + 1;
    END IF;

    SELECT provector_demo('A Title')
        INTO l_txt;
    IF l_txt != 'A Title' THEN
        RAISE NOTICE 'Failed to convert "A Title" to "A Title"';
        n_err = n_err + 1;
    END IF;

    SELECT provector_demo('a title')
        INTO l_txt;
    IF l_txt != 'A Title' THEN
        RAISE NOTICE 'Failed to convert "a title" to "A Title"';
        n_err = n_err + 1;
    END IF;

    IF n_err = 0 THEN
        RAISE NOTICE 'PASS';
    ELSE
        RAISE NOTICE 'FAIL';
    END IF;
END;
$$ LANGUAGE plpgsql;