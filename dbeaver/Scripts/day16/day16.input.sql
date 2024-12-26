-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i dbeaver/Scripts/day16/day16.input.sql
-- (psql) \i dbeaver/Scripts/day16/day16.sql

DROP DATABASE IF EXISTS aosql_day16_input;

CREATE DATABASE aosql_day16_input;

\connect aosql_day16_input postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

CREATE EXTENSION postgis;

\connect aosql_day16_input advent_of_sql

\i ../aosql-data/2024/input/day16-01.sql
