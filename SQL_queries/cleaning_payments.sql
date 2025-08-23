SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'public'  
AND table_name   = 'payments';

SELECT count(*) FROM payments where payment_value < 0;
-- no null values
