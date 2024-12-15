## Create table query analyzer

- keywords are always going to be capitalized and identifiers will always be lowercase.

[<img src="./pictures/create_table_query_analyzer.png" width="50%"/>](./pictures/create_table_query_analyzer.png)

## varchar(50)

- if try to store longer than 50 characters then postgres is going to give error.

## integers

- integers in postgres will be numbers without decimal. They can range from -2 billion to 2 billon. If try to store anything larger or smaller then these then we are going to end up getting an error.

[<img src="./pictures/varchar_integer.png" width="50%"/>](./pictures/varchar_integer.png)

varchar_integer

## join

- Whenever you use the keyword, join by itself inside of a query that is by default an inner join. You can write out either join or alternatively inner join to indicate that you want to do an inner join.

![inner_join](./pictures/inner_join.png)

![outer join](./pictures/left_outer_join.png)

![Right outer join](./pictures/right_outer_join.png)

![Full join](./pictures/full_join.png)

![pictures/order_tables_in_from_and_join](./pictures/order_tables_in_from_and_join.png){ width=400px }