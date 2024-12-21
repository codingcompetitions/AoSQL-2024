-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- ARRAY_LENGTH
--      https://www.postgresql.org/docs/17/functions-array.html#ARRAY-FUNCTIONS-TABLE
-- ARRAY_AGG ... FILTER ...
--      https://www.postgresql.org/docs/17/functions-aggregate.html#FUNCTIONS-AGGREGATE-TABLE
--      https://www.postgresql.org/docs/17/sql-expressions.html#SYNTAX-AGGREGATES
--

WITH TOYS AS (
    SELECT TOY_ID, TOY_NAME, UNNEST(PREVIOUS_TAGS) AS PREVIOUS_TAGS, UNNEST(NEW_TAGS) AS NEW_TAGS
    FROM TOY_PRODUCTION TP
)
SELECT *
    , COALESCE((ARRAY_LENGTH(ADDED_TAGS, 1)), 0) AS TOTAL_ADDED_TAGS
    , COALESCE((ARRAY_LENGTH(UNCHANGED_TAGS, 1)), 0) AS TOTAL_UNCHANGED_TAGS
    , COALESCE((ARRAY_LENGTH(REMOVED_TAGS, 1)), 0) AS TOTAL_REMOVED_TAGS
FROM (
    SELECT DISTINCT
        TOY_ID
        , TOY_NAME
        , (
            SELECT ARRAY_AGG(T) FILTER (WHERE T IS NOT NULL)
            FROM (
                SELECT NEW_TAGS AS T FROM TOYS WHERE TOYS.TOY_ID = T.TOY_ID
                EXCEPT
                SELECT PREVIOUS_TAGS AS T FROM TOYS WHERE TOYS.TOY_ID = T.TOY_ID
            ) T
        ) AS ADDED_TAGS
        , (
            SELECT ARRAY_AGG(T) FILTER (WHERE T IS NOT NULL)
            FROM (
                SELECT NEW_TAGS AS T FROM TOYS WHERE TOYS.TOY_ID = T.TOY_ID
                INTERSECT
                SELECT PREVIOUS_TAGS AS T FROM TOYS WHERE TOYS.TOY_ID = T.TOY_ID
            ) T
        ) AS UNCHANGED_TAGS
        , (
            SELECT ARRAY_AGG(T) FILTER (WHERE T IS NOT NULL)
            FROM (
                SELECT PREVIOUS_TAGS AS T FROM TOYS WHERE TOYS.TOY_ID = T.TOY_ID
                EXCEPT
                SELECT NEW_TAGS AS T FROM TOYS WHERE TOYS.TOY_ID = T.TOY_ID
            ) T
        ) AS REMOVED_TAGS
    FROM (
        SELECT * FROM TOYS
    ) T
) T
ORDER BY ARRAY_LENGTH(ADDED_TAGS, 1) DESC
