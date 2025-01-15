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
