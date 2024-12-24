-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- Window Function
--      https://www.postgresql.org/docs/current/sql-expressions.html#SYNTAX-WINDOW-FUNCTIONS
--
-- I knew about "over(partition by expression)2. But the frame_clause section
-- was new to me. "rows offset preceding" is surprisingly powerful.
--
-- I *almost* got the answer on my own. I had to look at the thread solution's
-- day because I was struggling with how to get only the last three seasons' data.
--
-- It turned out that I needed to read more about window functions and all
-- the possibilities they have.
--
-- https://www.reddit.com/r/adventofsql/comments/1hbg92v/2024_day_11_solutions/m1iciyg/
--

WITH TREE_HARVESTS AS (
    SELECT
        *
        , (CASE
            WHEN SEASON = 'Spring' THEN 1
            WHEN SEASON = 'Summer' THEN 2
            WHEN SEASON = 'Fall' THEN 3
            WHEN SEASON = 'Winter' THEN 4
        END) ORDER_ID
    FROM TREE_HARVESTS
)
SELECT
    *
    , ROUND(
        AVG(TREES_HARVESTED)
        OVER (PARTITION BY FIELD_NAME ORDER BY HARVEST_YEAR, ORDER_ID ROWS 2 PRECEDING)
    , 2) AS THREE_SEASON_MOVING_AVERAGE
FROM
    TREE_HARVESTS
ORDER BY THREE_SEASON_MOVING_AVERAGE DESC

