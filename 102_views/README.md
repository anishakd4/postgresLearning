
- Well, first off, I think that once again, we don't really need to have these two separate tables of tags. We really just need one collection of all the different tags.

- So we could do another union, as we've done before, between caption tags and photo tags. So if we do a union, we would take all the different rows, put them all together inside of one table, and then call the result. Maybe something like tags.

- So once we get to this point of this user tags table or this join table of sorts, we could then do a group by operation. And then we could count the number of rows for each of those different groups.

- Once we get those counts, we can then do some kind of order operation or a sorting operation to make sure that we get the most popular users at the top of the list.

- Maybe it was kind of a mistake when we were doing our initial database design to create these two separate tables because we just have to keep on having to take the union of them again and again and again.

[<img src="./pictures/most_popular_users.png" width="50%"/>](./pictures/most_popular_users.png)

[<img src="./pictures/most_popular_users_01.png" width="50%"/>](./pictures/most_popular_users_01.png)

[<img src="./pictures/most_popular_users_02.png" width="50%"/>](./pictures/most_popular_users_02.png)

[<img src="./pictures/most_popular_users_03.png" width="50%"/>](./pictures/most_popular_users_03.png)

# A possible solution merging table

- At this point, I think that we can come to the conclusion that having the separate tables of caption tags and photo tags is probably a design mistake. We've had to find the union between these two tables several times to execute some pretty basic queries, and we've not really found any benefit to having these two tables be separate. So I think that we probably maybe did make a mistake in our design here.

- The first really big issue is that we cannot copy over the IDs of all the different photo tags and caption tags to this new tags table. And the reason for that is that these photo tags and caption tags, tables, they might have rows that already have duplicate IDs inside them. it is very likely that photo tags and caption tags are going to have some identical IDs. That means that if there are any other records inside of our database that are pointing to that those different values, then all of a sudden we can have some foreign keys breaking.

- The other big issue here is that if we had a lot of other queries already written out inside of our application that made reference to specifically the photo tags or caption tags tables. Now all of a sudden they break because we're talking about deleting those tables.

[<img src="./pictures/merging_table_01.png" width="50%"/>](./pictures/merging_table_01.png)

[<img src="./pictures/merging_table_02.png" width="50%"/>](./pictures/merging_table_02.png)

# Solution 2

- So in solution number two, we're going to create something called a view. You can think of a view as being like a fake table that has a reference to rows or data from other tables inside of our database.