-- Remove rows with missing critical values
DELETE FROM order_items
WHERE order_id IS NULL
   OR product_id IS NULL
   OR seller_id IS NULL;

-- Fix negative prices or freight values
UPDATE order_items
SET price = NULL
WHERE price < 0;

UPDATE order_items
SET freight_value = NULL
WHERE freight_value < 0;

SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'public'  
AND table_name   = 'sellers';