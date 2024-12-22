# Advent of SQL 2024

[★ Advent of SQL 2024](https://adventofsql.com/) is solved using [PostgreSQL](https://www.postgresql.org/).

| Star |                     Day                      |  Level   |            Topics            |
|------|----------------------------------------------|----------|------------------------------|
| ⭐    | Day 01 - Santa's Gift List Parser            | Beginner | json, case, joins            |
| ⭐    | Day 02 - Santa's jumbled letters             | Beginner | union, cte, ascii, array_agg |
|      | Day 03 -                                     |          |                              |
| ⭐    | Day 04 - The Great Toy Tag Migration of 2024 | Beginner | arrays, set operations       |
| ⭐    | Day 05 - Santa's production dashboard        | Beginner | lag, round, window functions |
| ⭐    | Day 06 - Making presents fairer              | Beginner | subquery, aggregates         |
|      |                                              |          |                              |


## Init

```sql
--- how to create a password
-- echo -n pass+user | md5sum
--- echo -n asdfg1234advent_of_sql | md5sum
--- asdfg1234 + advent_of_sql i.e. asdfg1234advent_of_sql
--- asdfg1234 is the password
--- advent_of_sql is the user
--- prefix with md5 i.e. md5$hash$


DROP DATABASE IF EXISTS advent_of_sql;

DROP ROLE IF EXISTS advent_of_sql;

CREATE ROLE advent_of_sql WITH
  LOGIN
  NOSUPERUSER
  NOINHERIT
  CREATEDB
  NOCREATEROLE
  NOREPLICATION
  PASSWORD 'md52414c1e35431797cd193111ed64eb67b'
  VALID UNTIL 'infinity';

CREATE DATABASE advent_of_sql WITH
  OWNER = advent_of_sql
  ENCODING = 'UTF8'  
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;
```

```sh
echo "127.0.0.1:5432:*:advent_of_sql:advent_of_sql" >> ~/.pgpass

# may overwrite you config file
# cp .psqlrc ~/.psqlrc
```

## License

MIT License.

Copyright (c) 2024 Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>

See [LICENSE.md](LICENSE.md) for details.
