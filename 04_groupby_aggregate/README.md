## Group and aggregates

[<img src="./pictures/group_and_aggregates.png" width="50%"/>](./pictures/group_and_aggregates.png)

## Group by

[<img src="./pictures/group_by_init_01.png" width="50%"/>](./pictures/group_by_init_01.png)

[<img src="./pictures/group_by_1.png" width="50%"/>](./pictures/group_by_1.png)

[<img src="./pictures/group_by_2.png" width="50%"/>](./pictures/group_by_2.png)

- We can kind of imagine that we are getting a very temporary imaginary table created inside the database.

- When we say group by user ID, that's going to create a new grouped column inside of this imaginary database.

- We can only select some very certain columns. We can only select in particular, the grouped column. We are not allowed to directly select any of the underlying columns inside of our original table.

- if we want to in any way work with these underlying columns, we can only select them by using an aggregate function,

## combining group by and aggregates

[<img src="./pictures/combining_group_by_aggregate.png" width="50%"/>](./pictures/combining_group_by_aggregate.png)
