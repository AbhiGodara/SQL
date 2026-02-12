-- 1st method
SELECT
    CITY
FROM
    STATION
-- WHERE
--     (CITY LIKE 'a%'
--     OR CITY LIKE 'e%'
--     OR CITY LIKE 'i%'
--     OR CITY LIKE 'o%'
--     OR CITY LIKE 'u%')
--     OR
--     (CITY LIKE '%a'
--     OR CITY LIKE '%e'
--     OR CITY LIKE '%i'
--     OR CITY LIKE '%o'
--     OR CITY LIKE '%u')
    
EXCEPT

SELECT
    CITY
FROM
    STATION
WHERE
    (CITY LIKE 'a%'
    OR CITY LIKE 'e%'
    OR CITY LIKE 'i%'
    OR CITY LIKE 'o%'
    OR CITY LIKE 'u%')
    AND
    (CITY LIKE '%a'
    OR CITY LIKE '%e'
    OR CITY LIKE '%i'
    OR CITY LIKE '%o'
    OR CITY LIKE '%u');
    
    
-- 2nd method
SELECT
    distinct CITY
FROM
    STATION
WHERE NOT 
    ((CITY LIKE 'a%'
    OR CITY LIKE 'e%'
    OR CITY LIKE 'i%'
    OR CITY LIKE 'o%'
    OR CITY LIKE 'u%')
    AND
    (CITY LIKE '%a'
    OR CITY LIKE '%e'
    OR CITY LIKE '%i'
    OR CITY LIKE '%o'
    OR CITY LIKE '%u'));

    
-- 3rd method
SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    CITY NOT REGEXP '^[aeiou].*[aeiou]$';
