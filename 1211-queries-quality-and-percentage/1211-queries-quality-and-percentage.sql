# Write your MySQL query statement below
SELECT
    query_name,
    ROUND(SUM(rating/position)/COUNT(rating), 2) as quality,
    ROUND(((
            SELECT
                COUNT(*)
            FROM
                Queries as q2
            WHERE rating<3
                AND q2.query_name=Queries.query_name
        )*100/COUNT(rating)), 2) as poor_query_percentage
FROM
    Queries
GROUP BY
    query_name;
