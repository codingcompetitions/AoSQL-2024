-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- simple query
--

WITH GIFTS AS (
    SELECT *
        , (
            SELECT AVG(G.PRICE)
            FROM GIFTS G
        ) AS AVERAGE_PRICE
    FROM
        GIFTS G
)
SELECT
    C.NAME
    , G.NAME
    , G.PRICE
FROM
    CHILDREN C
    JOIN GIFTS G ON C.CHILD_ID = G.CHILD_ID
WHERE
    G.PRICE > G.AVERAGE_PRICE
ORDER BY PRICE ASC

