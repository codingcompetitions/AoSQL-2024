-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
--
--
--

\pset format unaligned
\pset fieldsep ','

WITH TRAINING_SESSIONS AS (
    SELECT
        *
        , (
            SELECT ROUND(AVG(SPEED_RECORD), 2)
            FROM TRAINING_SESSIONS T
            WHERE T.REINDEER_ID = TS.REINDEER_ID AND T.EXERCISE_NAME = TS.EXERCISE_NAME 
        ) AS AVERAGE_SPEED
    FROM TRAINING_SESSIONS TS 
)
SELECT
    R.REINDEER_NAME
    , MAX(AVERAGE_SPEED) AS HIGHEST_AVERAGE_SPEED
FROM
    TRAINING_SESSIONS TS
    JOIN REINDEERS R ON R.REINDEER_ID = TS.REINDEER_ID
GROUP BY R.REINDEER_NAME
ORDER BY HIGHEST_AVERAGE_SPEED DESC
LIMIT 3
