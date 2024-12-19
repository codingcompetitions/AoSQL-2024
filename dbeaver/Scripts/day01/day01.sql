-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- operator ->>
--      https://www.postgresql.org/docs/17/functions-json.html#FUNCTIONS-JSON-PROCESSING
-- function json_array_length
--      https://www.postgresql.org/docs/17/functions-json.html#FUNCTIONS-JSON-PROCESSING-TABLE
--

\pset format unaligned
\pset fieldsep ','

SELECT
    C.NAME
    , WL.WISHES->>'first_choice' AS PRIMARY_WHISH
    , WL.WISHES->>'second_choice' AS BACKUP_WISH
    , WL.WISHES->'colors'->>0 AS FAVORITE_COLOR
    , JSON_ARRAY_LENGTH(WL.WISHES->'colors') AS COLOR_COUNT
    , (CASE
        WHEN TC.DIFFICULTY_TO_MAKE = 1 THEN 'Simple Gift'
        WHEN TC.DIFFICULTY_TO_MAKE = 2 THEN 'Moderate Gift'
        WHEN TC.DIFFICULTY_TO_MAKE >= 3 THEN 'Complex Gift'
    END) AS GIFT_COMPLEXITY
    , (CASE
        WHEN TC.CATEGORY = 'outdoor' THEN 'Outside Workshop'
        WHEN TC.CATEGORY = 'educational' THEN 'Learning Workshop'
        ELSE 'General Workshop'
    END) AS WORKSHOP_ASSIGMENT
FROM
    CHILDREN C
    JOIN WISH_LISTS WL ON C.CHILD_ID = WL.CHILD_ID
    JOIN TOY_CATALOGUE TC ON WL.WISHES->>'first_choice' = TC.TOY_NAME
ORDER BY C.NAME ASC
LIMIT 5;
