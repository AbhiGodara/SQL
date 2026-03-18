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
SELECT
    ROUND(AVG(order_date=customer_pref_delivery_date)*100, 2) as immediate_percentage
FROM
    DELIVERY
WHERE
    (customer_id, order_date)
    IN
        (
            SELECT
                customer_id, min(order_date)
            FROM
                Delivery
            GROUP BY
                customer_id
        );