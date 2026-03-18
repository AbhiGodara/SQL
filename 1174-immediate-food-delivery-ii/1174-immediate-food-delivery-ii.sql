# Write your MySQL query statement below

-- Solution 1(not correct but useful to learn)
-- SELECT
--     ROUND((
--         SELECT
--             COUNT(*)
--         FROM
--             Delivery
--         WHERE
--             order_date=customer_pref_delivery_date
--         GROUP BY
--             customer_id
--         ORDER BY
--             order_date ASC
--         LIMIT 1)*100/COUNT(*), 2) as immediate_percentage
-- FROM
--     Delivery
-- GROUP BY
--     customer_id
-- ORDER BY
--     order_date ASC
-- LIMIT 1;


-- Solution 2
-- SELECT
--     ROUND(AVG(order_date=customer_pref_delivery_date)*100, 2) as immediate_percentage
-- FROM
--     DELIVERY
-- WHERE
--     (customer_id, order_date)
--     IN
--         (
--             SELECT
--                 customer_id, min(order_date)
--             FROM
--                 Delivery
--             GROUP BY
--                 customer_id
--         );


-- Solution 3
SELECT
    ROUND(100*SUM(first_order_immediate)/COUNT(*), 2) AS immediate_percentage
FROM
    (
        SELECT
            customer_id,
            order_date,
            customer_pref_delivery_date,
            ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn,
            CASE
                WHEN order_date=customer_pref_delivery_date THEN 1
                ELSE 0
            END AS first_order_immediate
        FROM
            Delivery
    ) as t
WHERE
    rn=1;