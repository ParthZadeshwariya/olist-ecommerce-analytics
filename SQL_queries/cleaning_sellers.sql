SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'public'  
AND table_name   = 'sellers';

SELECT count(*) from sellers where seller_id is null;
SELECT count(*) from sellers where seller_city is null;
SELECT count(*) from sellers where seller_state is null;
SELECT count(*) from sellers where seller_zip_code_prefix is null;

-- no null values