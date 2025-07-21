# curbies and shoppers of customers who gave a 1 rating and 5 rating on surveys
SELECT
    o.order_id,
    c.first_name AS customer_first,
    c.last_name AS customer_last,
    cs.one_to_five_rating,
    cs.comments,
    cu.curbie_first,
    cu.curbie_last,
    ps.shopper_first,
    ps.shopper_last,
    ops.run_type
FROM customer_survey cs
JOIN customer c ON cs.cust_id = c.cust_id
JOIN `order` o ON o.cust_id = c.cust_id
JOIN curbie cu ON o.curbie_id = cu.curbie_id
JOIN order_personal_shopper ops ON o.order_id = ops.order_id
JOIN personal_shopper ps ON ops.shopper_id = ps.shopper_id
WHERE cs.one_to_five_rating IN (1, 5)
ORDER BY cs.one_to_five_rating ASC, o.order_id;

# products that have been ordered more than 5 times

SELECT p.product_name, SUM(op.quantity) AS total_quantity
FROM order_product op
JOIN product p ON op.product_id = p.product_id
GROUP BY p.product_id
HAVING total_quantity > 5;

# Calculating profit over all data

SELECT
  (SELECT SUM(order_price) FROM order_revenue) AS total_revenue,
  (SELECT SUM(labor_hours * wages) FROM labor) AS total_labor_cost;
  
# number of orders for a given week

SELECT COUNT(*) AS order_count
FROM `order`
WHERE YEAR(order_date) = 2024 AND WEEK(order_date, 1) = 3;

SELECT
  WEEK(l.week, 1) AS week_number,
  SUM(rev.order_price) AS total_revenue,
  SUM(l.labor_hours * l.wages) AS total_labor_cost,
  SUM(rev.order_price) - SUM(l.labor_hours * l.wages) AS profit
FROM labor l
JOIN (
    SELECT o.order_id, o.order_date, orr.order_price
    FROM `order` o
    JOIN order_revenue orr ON o.order_id = orr.order_id
    WHERE YEAR(o.order_date) = 2024 AND WEEK(o.order_date, 1) = 10
) rev ON WEEK(l.week, 1) = WEEK(rev.order_date, 1)
GROUP BY WEEK(l.week, 1);

# average uph per shopper
SELECT shopper_first, shopper_last, uph
FROM personal_shopper ps
JOIN shopper_stats ss ON ps.shopper_id = ss.shopper_id
ORDER BY uph DESC;

# all customers who gave a rating of 5
SELECT c.first_name, c.last_name, cs.one_to_five_rating, cs.comments
FROM customer_survey cs
JOIN customer c ON cs.cust_id = c.cust_id
WHERE cs.one_to_five_rating = 5;

# most expensive products
SELECT product_name, sales_price
FROM product
ORDER BY sales_price DESC
LIMIT 5;




