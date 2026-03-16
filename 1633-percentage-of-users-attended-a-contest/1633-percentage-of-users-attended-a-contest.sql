# Write your MySQL query statement below
SELECT
    contest_id,
    ROUND((COUNT(contest_id)/(SELECT COUNT(user_id) FROM Users))*100, 2) as percentage
FROM
    Register
GROUP BY
    contest_id
ORDER BY
    percentage DESC,
    contest_id ASC;


-- SELECT
--     contest_id,
--     ROUND((COUNT(r.contest_id)/COUNT(u.user_id))*100, 2) as percentage
-- FROM
--     Users as u
-- LEFT JOIN
--     Register as r
-- ON
--     u.user_id=r.user_id
-- GROUP BY
--     contest_id
-- ORDER BY
--     percentage DESC,
--     contest_id ASC;