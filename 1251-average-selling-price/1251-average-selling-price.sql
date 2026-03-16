# Write your MySQL query statement below
SELECT
    p.product_id,
    COALESCE(ROUND(sum(p.price*u.units)/sum(u.units),2),0) as average_price
FROM
    prices as p
LEFT JOIN
    UnitsSold as u
ON
    p.product_id=u.product_id
    AND u.purchase_date>=p.start_date
    AND u.purchase_date<=p.end_date
GROUP BY
    p.product_id;