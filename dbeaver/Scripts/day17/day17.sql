-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- TO_CHAR
--      https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-DATETIME-TABLE
--
-- AT TIME ZONE
--      https://www.postgresql.org/docs/current/functions-datetime.html#FUNCTIONS-DATETIME-ZONECONVERT
--      https://neon.tech/postgresql/postgresql-date-functions/postgresql-at-time-zone
--

WITH WORKSHOP_HOURS AS (
    SELECT
        W.WORKSHOP_NAME
        , W.TIMEZONE 
        , W.BUSINESS_START_TIME AS START_TIME
        , W.BUSINESS_END_TIME AS END_TIME
        , (CURRENT_DATE::TEXT || ' ' || W.BUSINESS_START_TIME)::TIMESTAMP AT TIME ZONE W.TIMEZONE AT TIME ZONE 'UTC' AS UTC_START_TIME 
        , (CURRENT_DATE::TEXT || ' ' || W.BUSINESS_END_TIME):: TIMESTAMP AT TIME ZONE W.TIMEZONE AT TIME ZONE 'UTC' AS UTC_END_TIME
    FROM WORKSHOPS W
)
SELECT
    TO_CHAR(MAX(WH.UTC_START_TIME) OVER(), 'HH24:MI') AS EARLIEST_START_TIME
    , TO_CHAR(MIN(WH.UTC_END_TIME) OVER(), 'HH24:MI') AS LATEST_END_TIME
FROM WORKSHOP_HOURS WH
ORDER BY EARLIEST_START_TIME
LIMIT 1
