-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- crosstab
--      https://www.postgresql.org/docs/current/tablefunc.html#TABLEFUNC-FUNCTIONS-CROSSTAB-TEXT-2
--
-- Simple query except that there is more than one entry per date and drink.
-- So, one needs to add a "sum(...) ... group by" before the crosstab.
--
-- Even though I could have done the crosstab on my own.
-- I used chatGPT instead of reading the documentation.
--

SELECT DISTINCT DRINK_NAME
FROM DRINKS D
ORDER BY DRINK_NAME

SELECT *
FROM CROSSTAB($$
        SELECT DATE, DRINK_NAME, SUM(QUANTITY)
        FROM DRINKS
        GROUP BY DATE, DRINK_NAME
        ORDER BY 1,2
    $$,$$SELECT DISTINCT DRINK_NAME FROM DRINKS ORDER BY 1$$
    ) AS X (DATE DATE, A1 INT, A2 INT, A3 INT, A4 INT, A5 INT, A6 INT)
WHERE
    A2 = 198
    AND A3 = 38
    AND A5 = 298

