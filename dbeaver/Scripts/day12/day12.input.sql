-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i dbeaver/Scripts/day12/day12.input.sql
-- (psql) \i dbeaver/Scripts/day12/day12.sql

DROP DATABASE IF EXISTS aosql_day12_input;

CREATE DATABASE aosql_day12_input;

\connect aosql_day12_input postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

\connect aosql_day12_input advent_of_sql

\i ../aosql-data/2024/input/day12-01.sql
