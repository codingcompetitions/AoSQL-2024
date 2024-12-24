-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i dbeaver/Scripts/day13/day13.input.sql
-- (psql) \i dbeaver/Scripts/day13/day13.sql

DROP DATABASE IF EXISTS aosql_day13_input;

CREATE DATABASE aosql_day13_input;

\connect aosql_day13_input postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

\connect aosql_day13_input advent_of_sql

\i ../aosql-data/2024/input/day13-01.sql
