SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'public'  
AND table_name   = 'customers';

-- checking customers
SELECT count(*) from customers where customer_unique_id is null;
SELECT count(*) from customers where customer_id is null;
SELECT count(*) from customers where customer_zip_code_prefix is null;
SELECT count(*) from customers where customer_state is null;
SELECT count(*) from customers where customer_city is null;
-- no null data in customers
