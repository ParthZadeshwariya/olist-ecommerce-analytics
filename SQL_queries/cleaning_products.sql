SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'public'  
AND table_name   = 'products';

SELECT count(*) from products WHERE product_id is null;

update products
set product_category_name = 'others'
where product_category_name is null;