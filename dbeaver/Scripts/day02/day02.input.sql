-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i day02/day02.input.sql

DROP DATABASE IF EXISTS aosql_day02_input;

CREATE DATABASE aosql_day02_input;

\connect aosql_day02_input postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

\connect aosql_day02_input advent_of_sql

\i ../aosql-data/2024/input/day02-01.sql
