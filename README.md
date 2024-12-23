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

[<img src="./pictures/order_of_from_join_matters_2.png" width="50%"/>](./pictures/order_of_from_join_matters_2.png)

- If there is ever a row from our source table of photos that does not match up with the row from users, then that row right there gets dropped from the overall result set.

## Inner Join

- Whenever you use the keyword, join by itself inside of a query that is by default an inner join. You can write out either join or alternatively inner join to indicate that you want to do an inner join.

[<img src="./pictures/inner_join.png" width="50%"/>](./pictures/inner_join.png)

## Left outer join

[<img src="./pictures/left_outer_join.png" width="50%"/>](./pictures/left_outer_join.png)

[<img src="./pictures/left_outer_join_2.png" width="50%"/>](./pictures/left_outer_join_2.png)

## Right Outer join

[<img src="./pictures/right_outer_join.png" width="50%"/>](./pictures/right_outer_join.png)

[<img src="./pictures/right_outer_join_2.png" width="50%"/>](./pictures/right_outer_join_2.png)

## Full Join

[<img src="./pictures/full_join.png" width="50%"/>](./pictures/full_join.png)

[<img src="./pictures/full_join_2.png" width="50%"/>](./pictures/full_join_2.png)


## order matters

- yes, there is a difference in the order in which we list these tables in the from and join statement whenever we use a left or right outer, join the left and right outer joins. We definitely want to keep in mind the order of these tables so we list them out but with an inner join or a outer join in general, it doesn't make a difference.

[<img src="./pictures/order_of_table_in_from_join.png" width="50%"/>](./pictures/order_of_table_in_from_join.png)

## Group and aggregates

[<img src="./pictures/group_and_aggregates.png" width="50%"/>](./pictures/group_and_aggregates.png)

## Group by

[<img src="./pictures/group_by_1.png" width="50%"/>](./pictures/group_by_1.png)

[<img src="./pictures/group_by_2.png" width="50%"/>](./pictures/group_by_2.png)

## combining group by and aggregates

[<img src="./pictures/combining_group_by_aggregate.png" width="50%"/>](./pictures/combining_group_by_aggregate.png)

## difference between a where and a having

- Having is very similar to where. Its goal is to filter out some amount of information. The difference between where and having, however, is that where is going to operate on filtering out some number of rows, whereas having is going to filter out some number of groups. 
- You are never going to see having without a group by. So you will always have a group by net right before a having.
- You don't have to have a having if you have a group by, but if you want to do any filtering on the groups you will make use of having.

## Subquery

[<img src="./pictures/shape_of_query.png" width="50%"/>](./pictures/shape_of_query.png)

[<img src="./pictures/subquery_001.png" width="50%"/>](./pictures/subquery_001.png)

[<img src="./pictures/subquery_example.png" width="50%"/>](./pictures/subquery_example.png)


## Subquery in from

[<img src="./pictures/subquery_from_02.png" width="50%"/>](./pictures/subquery_from_02.png)

[<img src="./pictures/subquery_from.png" width="50%"/>](./pictures/subquery_from.png)

[<img src="./pictures/subquery_from_2.png" width="50%"/>](./pictures/subquery_from_2.png)

- The result of these subquery has only columns, name and price to weight ratio. So inside of our select statement, if we asked for just price by itself, we would get an error.

[<img src="./pictures/subquery_from_01.png" width="50%"/>](./pictures/subquery_from_01.png)

- we do not have to return a set of rows or columns from a subquery inside of a from clause. We can return just one single value as long as the outer select statements, the where and so on are compatible with it.


## One row and one column which referred to as a value. That's one single value