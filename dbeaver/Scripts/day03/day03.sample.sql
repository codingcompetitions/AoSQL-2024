-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

-- (sh) ./db.sh
-- (psql) \i dbeaver/Scripts/day03/day03.sample.sql
-- (psql) \i dbeaver/Scripts/day03/day03.sql

DROP DATABASE IF EXISTS aosql_day03_sample;

CREATE DATABASE aosql_day03_sample;

\connect aosql_day03_sample postgres

GRANT ALL ON SCHEMA public TO advent_of_sql;

\connect aosql_day03_sample advent_of_sql

\i ../aosql-data/2024/sample/day03-01.sql
