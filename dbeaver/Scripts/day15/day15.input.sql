-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i dbeaver/Scripts/day15/day15.input.sql
-- (psql) \i dbeaver/Scripts/day15/day15.sql

DROP DATABASE IF EXISTS aosql_day15_input;

CREATE DATABASE aosql_day15_input;

\connect aosql_day15_input postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

CREATE EXTENSION postgis;

\connect aosql_day15_input advent_of_sql

\i ../aosql-data/2024/input/day15-01.sql
