# Write your MySQL query statement below
-- SELECT
--     s1.product_id,
--     s1.year as first_year,
--     s1.quantity,
--     s1.price
-- FROM
--     Sales as s1
-- JOIN
--     (SELECT product_id, MIN(year) as first_year
--     FROM Sales
--     GROUP BY product_id) as s2
-- ON
--     s1.product_id=s2.product_id
--     AND s1.year=s2.first_year;


WITH new_sales as(
    SELECT
        *,
        rank() OVER(partition by product_id ORDER BY year ASC) as row_num
    FROM
        Sales
)

SELECT
    product_id,
    year as first_year,
    quantity,
    price
FROM
    new_sales
WHERE
    row_num=1