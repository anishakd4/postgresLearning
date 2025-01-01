- the important thing to keep in mind is that when data is inside of a heap file on your hard drive, Postgres cannot really just examine that file in place. In other words, in order to take a look at the different users, we have to first load these users up into memory.
- step number one for a query like this would be to take a look at all of our different blocks inside of the heap file. We would extract or load up all the different users into memory, and then once they are inside of memory, we could start to do some further querying or filter on this data. So in our particular case, we might walk through every single one of these users one by one until we found some that had a username of Ryan.
- anytime that we are loading up information from our hard drive over to memory that has a relatively large performance cost. So wherever possible, as database engineers, we try to minimize the amount of data that is being moved between our hard drive over to memory.
- Once this data has been loaded into memory, we then have to execute a search record by record. So even once this information is in memory, we then have to walk through each individual one until eventually we find some number of rows that satisfy this criteria of having a username of Ryan.
- anytime that we are loading up a ton of information out of a table and then iterating over those records one by one, we refer to that as a full table scan.
- a full table scan is whenever Postgres has to load up a ton or even possibly all the different rows out of a heap file into memory and then execute some kind of iteration over those rows to find some number of records.
- you do not always run into poor performance when you are doing a full table scan. There are actually some scenarios where a full table scan is kind of desirable over any alternative.

[<img src="./query_run_step_01.png" width="50%"/>](./query_run_step_01.png)

[<img src="./query_run_step_02.png.png" width="50%"/>](./query_run_step_02.png)

# index

- An index is a data structure that very efficiently tells us exactly what block and index a particular record is stored at.
- That's what an index is all about. It is an external record of sorts. Record book of sorts that tells us exactly where some records are stored inside of a heap file.

[<img src="./index_01.png" width="50%"/>](./index_01.png)

[<img src="./index_02.png" width="50%"/>](./index_02.png)

[<img src="./indexing.png" width="50%"/>](./indexing.png)