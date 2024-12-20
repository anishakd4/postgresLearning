## Create table query analyzer

- keywords are always going to be capitalized and identifiers will always be lowercase.

[<img src="./pictures/create_table_query_analyzer.png" width="50%"/>](./pictures/create_table_query_analyzer.png)

## varchar(50)

- if try to store longer than 50 characters then postgres is going to give error.

## integers

- integers in postgres will be numbers without decimal. They can range from -2 billion to 2 billon. If try to store anything larger or smaller then these then we are going to end up getting an error.

[<img src="./pictures/varchar_integer.png" width="50%"/>](./pictures/varchar_integer.png)

## Math operations

- We can perform these math operations between two columns. We can write sql to transform or process data before we receive it.

[<img src="./pictures/math_operators.png" width="50%"/>](./pictures/math_operators.png)

## String functions

- There are also a set of operators we can use to manipulate strings. And in addition to these operators, there's something else called functions we can use as well.

[<img src="./pictures/string_operators.png" width="50%"/>](./pictures/string_operators.png)

## Select query where clause sequence

[<img src="./pictures/select_where_sequence.png" width="50%"/>](./pictures/select_where_sequence.png)

## Where clause 

[<img src="./pictures/comparision_math_operators.png" width="50%"/>](./pictures/comparision_math_operators.png)

## One to one and many to one relationship

[<img src="./pictures/one_to_many_and_many_to_one.png" width="50%"/>](./pictures/one_to_many_and_many_to_one.png)

## One to one

[<img src="./pictures/one_to_one.png" width="50%"/>](./pictures/one_to_one.png)

## many to many

[<img src="./pictures/many_to_many.png" width="50%"/>](./pictures/many_to_many.png)

## Four relationships

[<img src="./pictures/four_relationships.png" width="50%"/>](./pictures/four_relationships.png)

## Primary keys and foreign keys

- primary key is unique. value in primary key is unique and never going to be changed.
- goal of foreign key is to somehow relate 1 record in a table to another record in another or same table.

[<img src="./pictures/primary_foreign_keys.png" width="50%"/>](./pictures/primary_foreign_keys.png)

[<img src="./pictures/primary_foreign_example.png" width="50%"/>](./pictures/primary_foreign_example.png)

## Primary keys vs foreign keys

[<img src="./pictures/primary_vs_foreign.png" width="50%"/>](./pictures/primary_vs_foreign.png)

## Foreign keys

[<img src="./pictures/foreign_keys1.png" width="50%"/>](./pictures/foreign_keys1.png)

[<img src="./pictures/foreign_keys2.png" width="50%"/>](./pictures/foreign_keys2.png)

## Foreign key cases

[<img src="./pictures/foreign_key_cases.png" width="50%"/>](./pictures/foreign_key_cases.png)

## What if we delete a row in table

- If we delete a row in table with a SERIAL type column then there won't be any other record with the same id. No serial id ever gets reused even if the row ever gets deleted.

[<img src="./pictures/constraints_in_delete.png" width="50%"/>](./pictures/constraints_in_delete.png)

## join

[<img src="./pictures/imaginary_table_after_join.png" width="50%"/>](./pictures/imaginary_table_after_join.png)

- You can kind of imagine that our database is making a temporary copy of that initial table in this case comments. And then we can once again kind of imagine that this imaginary table right here gets renamed to something like comments with users. And then finally, we can also imagine that the database is then going to iterate through all these different rows and it's going to try to match each of these rows together with the row from the users table using the matching statement that we put on the other side of on.

[<img src="./pictures/notes_on_join.png" width="50%"/>](./pictures/notes_on_join.png)


[<img src="./pictures/order_of_from_join_matters.png" width="50%"/>](./pictures/order_of_from_join_matters.png)

- Here simple join statement won't print photo with null user id.

- Whenever you use the keyword, join by itself inside of a query that is by default an inner join. You can write out either join or alternatively inner join to indicate that you want to do an inner join.


[<img src="./pictures/inner_join.png" width="50%"/>](./pictures/inner_join.png)

[<img src="./pictures/left_outer_join.png" width="50%"/>](./pictures/left_outer_join.png)

[<img src="./pictures/right_outer_join.png" width="50%"/>](./pictures/right_outer_join.png)

[<img src="./pictures/full_join.png" width="50%"/>](./pictures/full_join.png)

[<img src="./pictures/order_tables_in_from_and_join.png" width="50%"/>](./pictures/order_tables_in_from_and_join.png)