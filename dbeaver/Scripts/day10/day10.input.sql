-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i dbeaver/Scripts/day10/day10.input.sql
-- (psql) \i dbeaver/Scripts/day10/day10.sql

DROP DATABASE IF EXISTS aosql_day10_input;

CREATE DATABASE aosql_day10_input;

\connect aosql_day10_input postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

CREATE EXTENSION IF NOT EXISTS tablefunc;

\connect aosql_day10_input advent_of_sql

\i ../aosql-data/2024/input/day10-01.sql
