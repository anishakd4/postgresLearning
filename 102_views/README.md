
- Well, first off, I think that once again, we don't really need to have these two separate tables of tags. We really just need one collection of all the different tags.

- So we could do another union, as we've done before, between caption tags and photo tags. So if we do a union, we would take all the different rows, put them all together inside of one table, and then call the result. Maybe something like tags.

- So once we get to this point of this user tags table or this join table of sorts, we could then do a group by operation. And then we could count the number of rows for each of those different groups.

- Once we get those counts, we can then do some kind of order operation or a sorting operation to make sure that we get the most popular users at the top of the list.

[<img src="./pictures/most_popular_users.png" width="50%"/>](./pictures/most_popular_users.png)