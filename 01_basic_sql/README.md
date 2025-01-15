## Create table query analyzer

- Keywords are very special words inside of SQL that tell the database that we want to do a very specific thing or designate some particular option.

- keywords are always going to be capitalized and identifiers will always be lowercase.

- Identifiers are how we tell the database what we want to somehow operate on.

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

- Here's the actual order in what in which you want to consider these steps being executed by Postgres.

- The first thing that really happens internally is Postgres takes a look at a data source. It's going to analyze your query and it's going to see that you are trying to pull in all the different rows from the city's table.

- After it gets that entire source of data, it then second applies that filtering criteria. So it says for each row, I only want to consider the rows that have an area greater than 4000.

- That's going to filter out or remove some rows out of our result set. And then for all the remaining entries or the remaining rows, then we are going to select some number of columns.

[<img src="./pictures/select_where_sequence.png" width="50%"/>](./pictures/select_where_sequence.png)

[<img src="./pictures/select_where_query_step_01.png" width="50%"/>](./pictures/select_where_query_step_01.png)

[<img src="./pictures/select_where_query_step_02.png" width="50%"/>](./pictures/select_where_query_step_02.png)

[<img src="./pictures/select_where_query_step_03.png" width="50%"/>](./pictures/select_where_query_step_03.png)

## Where clause

[<img src="./pictures/comparision_math_operators.png" width="50%"/>](./pictures/comparision_math_operators.png)
