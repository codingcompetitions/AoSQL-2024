-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i dbeaver/Scripts/day09/day09.sample.sql
-- (psql) \i dbeaver/Scripts/day09/day09.sql

DROP DATABASE IF EXISTS aosql_day09_sample;

CREATE DATABASE aosql_day09_sample;

\connect aosql_day09_sample postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

\connect aosql_day09_sample advent_of_sql

\i ../aosql-data/2024/sample/day09-01.sql
