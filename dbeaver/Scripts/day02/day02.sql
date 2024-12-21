-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- CHR()
--      https://www.postgresql.org/docs/17/functions-string.html#FUNCTIONS-STRING-OTHER
--

WITH VALID AS (
    SELECT VALUE
    FROM (
        SELECT GENERATE_SERIES(65, 90) AS VALUE --uppercase
        UNION
        SELECT GENERATE_SERIES(97, 122) AS VALUE --lowercase
        UNION
        SELECT UNNEST(ARRAY[32,33,34,39,40,41,44,45,46,58,59,63]) AS VALUE --symbols
    ) T
    --ORDER BY VALUE
)
SELECT ARRAY_TO_STRING(ARRAY_AGG(CHR(VALUE) ORDER BY TNAME, ID), '') AS MESSAGE
FROM (
    (
        SELECT 'T1' AS TNAME, ID, LA.VALUE
        FROM LETTERS_A LA JOIN VALID V ON LA.VALUE = V.VALUE
        --ORDER BY ID ASC
    )
    UNION
    (
        SELECT 'T2' AS TNAME, ID, LB.VALUE
        FROM LETTERS_B LB JOIN VALID V ON LB.VALUE = V.VALUE
        --ORDER BY ID ASC
    )
) T
