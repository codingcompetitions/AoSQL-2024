-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
--
--
--


WITH TIMES AS (
    SELECT
        A.PLACE_NAME
        , MAX(SL.TIMESTAMP)
        , MIN(SL.TIMESTAMP)
    FROM
        AREAS A
        JOIN SLEIGH_LOCATIONS SL ON ST_Contains(A.POLYGON::GEOMETRY, SL.COORDINATE::GEOMETRY) = TRUE
        GROUP BY A.PLACE_NAME
)
SELECT
    T.PLACE_NAME
    , T.MAX
    , T.MIN
    , (CASE
        WHEN MIN = MAX THEN '1:00'
        ELSE MAX + '1:00' - MIN
    END) AS TIME_SPEND
FROM
    TIMES T
ORDER BY TIME_SPEND DESC
LIMIT 1
