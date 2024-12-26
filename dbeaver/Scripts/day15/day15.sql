-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- PostGIS
--      https://postgis.net/docs/index.html
--
-- ST_Contains
--      https://postgis.net/docs/ST_Contains.html
--

WITH LAST_LOCATION AS (
    SELECT COORDINATE 
    FROM SLEIGH_LOCATIONS SL
    ORDER BY TIMESTAMP DESC
    LIMIT 1
)
SELECT A.PLACE_NAME 
FROM AREAS A, LAST_LOCATION
WHERE ST_Contains(A.POLYGON::GEOMETRY, LAST_LOCATION.COORDINATE::GEOMETRY)
