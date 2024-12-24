-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- PERCENT_RANK
--      https://www.postgresql.org/docs/current/functions-window.html#FUNCTIONS-WINDOW-TABLE
--      https://neon.tech/postgresql/postgresql-window-function/postgresql-percent_rank-function
--
-- DISTINCT ON
--      https://www.postgresql.org/docs/current/sql-select.html#:~:text=chosen%20query%20plan.-,DISTINCT%20Clause,-If%20SELECT%20DISTINCT
--      https://neon.tech/postgresql/postgresql-tutorial/postgresql-distinct-on
--
-- What on earth does percent_rank do? I found it reading more about window
-- functions it just works but I don't know how it works.
--

WITH GIFT_DATA AS (
    SELECT DISTINCT
        G.GIFT_NAME
        , COUNT(GR.REQUEST_ID) OVER (PARTITION BY G.GIFT_NAME) AS TOTAL_GIFT_REQUESTS
    FROM
        GIFTS G
        JOIN GIFT_REQUESTS GR ON G.GIFT_ID = GR.GIFT_ID
)
SELECT DISTINCT ON (OVERALL_RANK)
    GD.GIFT_NAME
    , ROUND(PERCENT_RANK() OVER(ORDER BY GD.TOTAL_GIFT_REQUESTS)::NUMERIC, 2) AS OVERALL_RANK
FROM
    GIFT_DATA GD
ORDER BY OVERALL_RANK DESC, GD.GIFT_NAME ASC
LIMIT 2
