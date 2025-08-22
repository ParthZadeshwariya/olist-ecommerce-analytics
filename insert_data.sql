COPY customers
FROM 'csv_data\olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY orders
FROM 'csv_data\olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY payments
FROM 'csv_data\olist_order_payments_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY products
FROM 'csv_data\olist_products_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY sellers
FROM 'csv_data\olist_sellers_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY geolocation
FROM 'csv_data\olist_geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY product_category_translation
FROM 'csv_data\product_category_name_translation.csv'
DELIMITER ','
CSV HEADER;

-- checking data load
--SELECT * FROM customers LIMIT 10;
-- SELECT * FROM orders LIMIT 10;
-- SELECT * FROM products LIMIT 10;
-- SELECT * from payments LIMIT 10;
-- SELECT * from sellers LIMIT 10;
-- SELECT * from geolocation LIMIT 10;
-- SELECT * FROM product_category_translation LIMIT 10;