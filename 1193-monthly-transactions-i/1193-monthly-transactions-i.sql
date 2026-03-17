-- # Write your MySQL query statement below
-- SELECT
--     DATE_FORMAT(trans_date, '%Y-%m') as month,
--     country,
--     COUNT(Transactions.id) as trans_count,
--     (
--         SELECT
--             COUNT(*)
--         FROM
--             Transactions as t2
--         WHERE DATE_FORMAT(t2.trans_date, '%Y-%m')=DATE_FORMAT(Transactions.trans_date, '%Y-%m')
--             AND ((t2.country=Transactions.country) OR (t2.country IS NULL AND Transactions.country IS NULL))
--             AND t2.state='approved'
--     ) as approved_count,
--     (
--         SELECT
--             COALESCE(SUM(amount),0)
--         FROM
--             Transactions as t2
--         WHERE DATE_FORMAT(t2.trans_date, '%Y-%m')=DATE_FORMAT(Transactions.trans_date, '%Y-%m')
--             AND ((t2.country=Transactions.country) OR (t2.country IS NULL AND Transactions.country IS NULL))
--     ) as trans_total_amount,
--     (
--         SELECT
--             COALESCE(SUM(amount),0)
--         FROM
--             Transactions as t2
--         WHERE DATE_FORMAT(t2.trans_date, '%Y-%m')=DATE_FORMAT(Transactions.trans_date, '%Y-%m')
--             AND ((t2.country=Transactions.country) OR (t2.country IS NULL AND Transactions.country IS NULL))
--             AND t2.state='approved'
--     ) as approved_total_amount
-- FROM
--     Transactions
-- GROUP BY
--     DATE_FORMAT(trans_date, '%Y-%m'),
--     country;





# Write your MySQL query statement below
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;