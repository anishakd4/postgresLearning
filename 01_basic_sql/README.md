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
