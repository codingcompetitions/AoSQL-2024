-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- jsonb_array_elements
--      https://www.postgresql.org/docs/9.5/functions-json.html#FUNCTIONS-JSON-PROCESSING-TABLE
--
--

WITH RECEIPTS AS (
    SELECT
        jsonb_array_elements(CLEANING_RECEIPTS) AS DATA
    FROM
        SANTA_RECORDS
)
SELECT R.DATA->>'drop_off' AS DROP_OFF
FROM RECEIPTS R
WHERE
    R.DATA->>'garment' = 'suit'
    AND R.DATA->>'color' = 'green'
ORDER BY R.DATA->>'drop_off' DESC
LIMIT 1
