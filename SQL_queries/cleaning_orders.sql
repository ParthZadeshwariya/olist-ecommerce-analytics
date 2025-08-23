
-- checking orders
select count(*) from orders where order_id is null;
select count(*) from orders where customer_id is null;
select count(*) from orders where order_status is null;
select count(*) from orders where order_purchase_timestamp is null;
-- above columns have 0 null values

select count(*) from orders where order_approved_at is null;
-- 160 null values
select order_status from orders where order_approved_at is null;
-- If order_status = 'canceled' or 'unavailable':
-- → It makes sense for order_approved_at to be NULL (since payment never went through).
-- If order_status = 'delivered', 'shipped', or 'invoiced':
-- → order_approved_at should not be NULL. That indicates missing data.
-- Leave it NULL if the order is canceled/unavailable. Impute from order_purchase_timestamp if the order was completed.

UPDATE orders
SET order_approved_at = order_purchase_timestamp
WHERE order_approved_at is NULL
    AND order_status in ('delivered','shipped','invoiced');



select count(*) from orders where order_delivered_carrier_date is null;
-- 1783 null values
select DISTINCT(order_status) from orders where order_delivered_carrier_date is null;


/*
If order_status = delivered or shipped: should exist.

If order_status = canceled or unavailable: keep as NULL.

If missing but order_status = delivered: impute with order_approved_at.
*/
select order_delivered_carrier_date from orders where order_status = 'delivered' and order_delivered_carrier_date is null;
-- two null values

UPDATE orders
SET order_delivered_carrier_date = order_approved_at
WHERE order_delivered_carrier_date is NULL
    AND order_status in ('delivered');

select count(*) from orders where order_delivered_customer_date is null;

/*
If order_status = delivered: must exist.

If missing but marked delivered → impute with order_estimated_delivery_date.

If order_status = canceled, unavailable, shipped: keep as NULL.
*/
UPDATE orders
SET order_delivered_carrier_date = order_estimated_delivery_date
WHERE order_delivered_carrier_date is NULL
    AND order_status in ('delivered');

select count(*) from orders where order_estimated_delivery_date is null;
-- 0 null