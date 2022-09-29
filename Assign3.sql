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
| Employees          |
| Mcdonalds          |
| YGTECH             |
| YashG              |
| b1                 |
| bakery_products    |
| courses            |
| dominos            |
| house_values       |
| information_schema |
| kalpesh            |
| library            |
| manga              |
| movies             |
| mysql              |
| performance_schema |
| purnandu           |
| shital             |
| sports             |
| student            |
| student_database   |
| student_info       |
| sys                |
| vehicle_record     |
| vrushali           |
| yash               |17_August.
+--------------------+
28 rows in set (0.01 sec)

mysql> create database anime;
Query OK, 1 row affected (0.03 sec)

mysql> use anime;
Database changed
mysql> create table anime_list (anime_id INT,anime_name VARCHAR(25),rating INT); 
Query OK, 0 rows affected (0.04 sec)

mysql> show tables;
+-----------------+
| Tables_in_anime |
+-----------------+
| anime_list      |
+-----------------+
1 row in set (0.00 sec)

mysql> insert into anime_list values (101,'Class room',8.02),(102,'AOT',9.54),(103,'demon slayer',9.08);
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from anime_list;
+----------+--------------+--------+
| anime_id | anime_name   | rating |
+----------+--------------+--------+
|      101 | Class room   |      8 |
|      102 | AOT          |     10 |
|      103 | demon slayer |      9 |
+----------+--------------+--------+
3 rows in set (0.00 sec)

mysql> create table anime_list_2 (anime_id INT,anime_name,reviews varchar(50));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',reviews varchar(50))' at line 1
mysql> create table anime_list_2 (anime_id INT,anime_name varchar(25),reviews varchar(50));
Query OK, 0 rows affected (0.03 sec)

mysql> insert into anime_list values (101,'Class room','underrated'),(102,'AOT','nice'),(103,'demon slayer','overpowered');
ERROR 1366 (HY000): Incorrect integer value: 'underrated' for column 'rating' at row 1
mysql> insert into anime_list_2 values (101,'Class room','underrated'),(102,'AOT','nice'),(103,'demon slayer','overpowered');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into anime_list_2 value (101,'Class room','underrated'),(102,'AOT','nice'),(103,'demon slayer','overpowered');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from anime_list_2;
+----------+--------------+-------------+
| anime_id | anime_name   | reviews     |
+----------+--------------+-------------+
|      101 | Class room   | underrated  |
|      102 | AOT          | nice        |
|      103 | demon slayer | overpowered |
|      101 | Class room   | underrated  |
|      102 | AOT          | nice        |
|      103 | demon slayer | overpowered |
+----------+--------------+-------------+
6 rows in set (0.00 sec)

mysql> select (anime_id,anime_name) from anime_list inner join anime_list_2 on anime_list.anime_id = anime_list_2.anime_id;
ERROR 1052 (23000): Column 'anime_id' in field list is ambiguous
mysql> select anime_list.anime_id,anime_list.anime_name from anime_list left joi
n anime_list_2 on anime_list.anime_name = anime_list_2.anime_name;
+----------+--------------+
| anime_id | anime_name   |
+----------+--------------+
|      101 | Class room   |
|      101 | Class room   |
|      102 | AOT          |
|      102 | AOT          |
|      103 | demon slayer |
|      103 | demon slayer |
+----------+--------------+
6 rows in set (0.02 sec)

mysql> select anime_list.anime_id,anime_list.anime_name from anime_list right jo
in anime_list_2 on anime_list.anime_name = anime_list_2.anime_name;
+----------+--------------+
| anime_id | anime_name   |
+----------+--------------+
|      101 | Class room   |
|      102 | AOT          |
|      103 | demon slayer |
|      101 | Class room   |
|      102 | AOT          |
|      103 | demon slayer |
+----------+--------------+
6 rows in set (0.00 sec)

mysql> select anime_list.anime_id,anime_list.anime_name from anime_list inner join anime_list_2 on anime_list.anime_name = anime_list_2.anime_name;
+----------+--------------+
| anime_id | anime_name   |
+----------+--------------+
|      101 | Class room   |
|      102 | AOT          |
|      103 | demon slayer |
|      101 | Class room   |
|      102 | AOT          |
|      103 | demon slayer |
+----------+--------------+
6 rows in set (0.00 sec)

mysql> create view top_ranked as select anime_name,rating from anime_list;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from top_ranked;
+--------------+--------+
| anime_name   | rating |
+--------------+--------+
| Class room   |      8 |
| AOT          |     10 |
| demon slayer |      9 |
+--------------+--------+
3 rows in set (0.00 sec)

mysql>  ALTER VIEW top_ranked as SELECT anime_id,anime_name from anime_list WHERE (rating>8) and (rating<10);
Query OK, 0 rows affected (0.03 sec)

mysql> select * from top_ranked;
+----------+--------------+
| anime_id | anime_name   |
+----------+--------------+
|      103 | demon slayer |
+----------+--------------+
1 row in set (0.00 sec)

