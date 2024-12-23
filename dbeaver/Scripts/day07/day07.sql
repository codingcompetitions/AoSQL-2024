-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- simple query
--

\pset format unaligned
\pset fieldsep ','

WITH PRIMARY_SKILLS AS (
    SELECT
        WE.PRIMARY_SKILL
        , (
            SELECT ELF_ID
            FROM WORKSHOP_ELVES W
            WHERE WE.PRIMARY_SKILL = W.PRIMARY_SKILL
            ORDER BY YEARS_EXPERIENCE DESC
            LIMIT 1
        ) AS MAX_EXPERIENCE
        , (
            SELECT ELF_ID
            FROM WORKSHOP_ELVES W
            WHERE WE.PRIMARY_SKILL = W.PRIMARY_SKILL
            ORDER BY YEARS_EXPERIENCE ASC
            LIMIT 1
        ) AS MIN_EXPERIENCE
    FROM WORKSHOP_ELVES WE
    GROUP BY PRIMARY_SKILL
), WORKSHOP_ELVES AS (
    SELECT
        WE.ELF_ID
        , WE.ELF_NAME
        , WE.PRIMARY_SKILL
        , WE.YEARS_EXPERIENCE
        , PS.MAX_EXPERIENCE
        , PS.MIN_EXPERIENCE
    FROM
        WORKSHOP_ELVES WE
        JOIN PRIMARY_SKILLS PS ON WE.PRIMARY_SKILL = PS.PRIMARY_SKILL
)
SELECT DISTINCT
    WE1.ELF_ID
    , WE2.ELF_ID
    , WE1.PRIMARY_SKILL
FROM
    WORKSHOP_ELVES WE1
    JOIN WORKSHOP_ELVES WE2 ON WE1.PRIMARY_SKILL = WE2.PRIMARY_SKILL AND WE1.ELF_ID <> WE2.ELF_ID AND WE1.MAX_EXPERIENCE = WE1.ELF_ID AND WE2.MIN_EXPERIENCE = WE2.ELF_ID
ORDER BY WE1.PRIMARY_SKILL ASC

