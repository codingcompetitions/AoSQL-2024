-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i dbeaver/Scripts/day11/day11.sample.sql
-- (psql) \i dbeaver/Scripts/day11/day11.sql

DROP DATABASE IF EXISTS aosql_day11_sample;

CREATE DATABASE aosql_day11_sample;

\connect aosql_day11_sample postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

\connect aosql_day11_sample advent_of_sql

\i ../aosql-data/2024/sample/day11-01.sql
