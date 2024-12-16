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

## join

- Whenever you use the keyword, join by itself inside of a query that is by default an inner join. You can write out either join or alternatively inner join to indicate that you want to do an inner join.

[<img src="./pictures/inner_join.png" width="50%"/>](./pictures/inner_join.png)

[<img src="./pictures/left_outer_join.png" width="50%"/>](./pictures/left_outer_join.png)

[<img src="./pictures/right_outer_join.png" width="50%"/>](./pictures/right_outer_join.png)

[<img src="./pictures/full_join.png" width="50%"/>](./pictures/full_join.png)

[<img src="./pictures/order_tables_in_from_and_join.png" width="50%"/>](./pictures/order_tables_in_from_and_join.png)