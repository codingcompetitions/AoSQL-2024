-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i dbeaver/Scripts/day01/day01.input.sql
-- (psql) \i dbeaver/Scripts/day01/day01.sql

DROP DATABASE IF EXISTS aosql_day01_input;

CREATE DATABASE aosql_day01_input;

\connect aosql_day01_input postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

\connect aosql_day01_input advent_of_sql

\i ../aosql-data/2024/input/day01-01.sql
