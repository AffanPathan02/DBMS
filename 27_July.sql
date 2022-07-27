ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 15
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Diksha             |
| Dominos            |
| Mcdonalds          |
| bakery_products    |
| dominos            |
| house_values       |
| information_schema |
| manga              |
| movies             |
| mysql              |
| performance_schema |
| sports             |
| student            |
| student_database   |
| student_info       |
| sys                |
| vrushali           |
| yash               |
+--------------------+
18 rows in set (0.00 sec)

mysql> create table anime;
ERROR 1046 (3D000): No database selected
mysql> create database anime;
Query OK, 1 row affected (0.02 sec)

mysql> use anime;
Database changed
mysql> create table anime_list(id int,anime_name varchar(25),release_date int(10));
Query OK, 0 rows affected, 1 warning (0.03 sec)

mysql> show tables;
+-----------------+
| Tables_in_anime |
+-----------------+
| anime_list      |
+-----------------+
1 row in set (0.00 sec)

mysql> insert into anime_list values (1,'Horimiya',2019);
Query OK, 1 row affected (0.03 sec)

mysql> insert into anime_list values (2,'Attack on Titan',2013),(3,'FBMA',2016),(4,'Another',2022),(5,'Spy X Family',2022);
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from anime_list;
+------+-----------------+--------------+
| id   | anime_name      | release_date |
+------+-----------------+--------------+
|    1 | Horimiya        |         2019 |
|    2 | Attack on Titan |         2013 |
|    3 | FBMA            |         2016 |
|    4 | Another         |         2022 |
|    5 | Spy X Family    |         2022 |
+------+-----------------+--------------+
5 rows in set (0.00 sec)

mysql> alter table anime_list add rating float;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from anime_list;
+------+-----------------+--------------+--------+
| id   | anime_name      | release_date | rating |
+------+-----------------+--------------+--------+
|    1 | Horimiya        |         2019 |   NULL |
|    2 | Attack on Titan |         2013 |   NULL |
|    3 | FBMA            |         2016 |   NULL |
|    4 | Another         |         2022 |   NULL |
|    5 | Spy X Family    |         2022 |   NULL |
+------+-----------------+--------------+--------+
5 rows in set (0.00 sec)

mysql> alter table anime_list modify column release_date varchar(25);
Query OK, 5 rows affected (0.05 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from anime_list;
+------+-----------------+--------------+--------+
| id   | anime_name      | release_date | rating |
+------+-----------------+--------------+--------+
|    1 | Horimiya        | 2019         |   NULL |
|    2 | Attack on Titan | 2013         |   NULL |
|    3 | FBMA            | 2016         |   NULL |
|    4 | Another         | 2022         |   NULL |
|    5 | Spy X Family    | 2022         |   NULL |
+------+-----------------+--------------+--------+
5 rows in set (0.00 sec)

mysql> update anime_list set rating=9.0 where id=1;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from anime_list;
+------+-----------------+--------------+--------+
| id   | anime_name      | release_date | rating |
+------+-----------------+--------------+--------+
|    1 | Horimiya        | 2019         |      9 |
|    2 | Attack on Titan | 2013         |   NULL |
|    3 | FBMA            | 2016         |   NULL |
|    4 | Another         | 2022         |   NULL |
|    5 | Spy X Family    | 2022         |   NULL |
+------+-----------------+--------------+--------+
5 rows in set (0.00 sec)

mysql> update anime_list set rating=8.7 where id=2;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from anime_list;
+------+-----------------+--------------+--------+
| id   | anime_name      | release_date | rating |
+------+-----------------+--------------+--------+
|    1 | Horimiya        | 2019         |      9 |
|    2 | Attack on Titan | 2013         |    8.7 |
|    3 | FBMA            | 2016         |   NULL |
|    4 | Another         | 2022         |   NULL |
|    5 | Spy X Family    | 2022         |   NULL |
+------+-----------------+--------------+--------+
5 rows in set (0.00 sec)

mysql> alter table anime_list rename column rating to imdb;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from anime_list;
+------+-----------------+--------------+------+
| id   | anime_name      | release_date | imdb |
+------+-----------------+--------------+------+
|    1 | Horimiya        | 2019         |    9 |
|    2 | Attack on Titan | 2013         |  8.7 |
|    3 | FBMA            | 2016         | NULL |
|    4 | Another         | 2022         | NULL |
|    5 | Spy X Family    | 2022         | NULL |
+------+-----------------+--------------+------+
5 rows in set (0.00 sec)

mysql> alter table anime_list drop column imdb;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from anime_list;
+------+-----------------+--------------+
| id   | anime_name      | release_date |
+------+-----------------+--------------+
|    1 | Horimiya        | 2019         |
|    2 | Attack on Titan | 2013         |
|    3 | FBMA            | 2016         |
|    4 | Another         | 2022         |
|    5 | Spy X Family    | 2022         |
+------+-----------------+--------------+
5 rows in set (0.00 sec)

mysql> delete anime_list where id=4;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where id=4' at line 1
mysql> delete from anime_list where id=4;
Query OK, 1 row affected (0.03 sec)

mysql> select * from anime_list;
+------+-----------------+--------------+
| id   | anime_name      | release_date |
+------+-----------------+--------------+
|    1 | Horimiya        | 2019         |
|    2 | Attack on Titan | 2013         |
|    3 | FBMA            | 2016         |
|    5 | Spy X Family    | 2022         |
+------+-----------------+--------------+
4 rows in set (0.00 sec)

mysql> alter table anime_list rename id to list;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'to list' at line 1
mysql> delete from anime_list;
Query OK, 4 rows affected (0.02 sec)

mysql> select * from anime_list;
Empty set (0.00 sec)

mysql> ^C
mysql> 

