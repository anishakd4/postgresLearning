# Query Processing pipeline

- This query is going to be fed into Postgres and it's going to go through a series of processing steps. It's going to go through the parser, a rewriter, a planner and an executor.

[<img src="./pictures/query_processing_pipeline.png" width="50%"/>](./pictures/query_processing_pipeline.png)

# parser

- When you feed a query like this into Postgres, immediately Postgres is going to try to take all the different characters of that string and tear it apart one by one and figure out what the meaning of every character in every word is inside there. The parser is going to make sure that what you wrote out inside this query is actually valid SQL. So you have referred to actual keywords that actually exist. They're all spelled correctly. We've got appropriate punctuation and so on, all that kind of stuff.

- After evaluating this query, it's going to build up something called a query tree. The query tree is essentially a programmatic description of the query that you are trying to run. So again, this is referred to as the query tree and it breaks apart the entire query that you feed in into these more kind of logical steps that can be understood by a computer program.

# Rewritter

- Once the query tree has been written, it's then handed off to the rewriter. 

- The rewriter is going to take a look at the query tree and possibly make little modifications to it. If Postgres thinks that certain parts could be executed a little bit more efficiently. However, what happens much more frequently is it applies the idea of views to the query tree itself.

# planner

- After that, the query tree is going to move on to the planner.

- The goal of the planner is to take a look at the query tree, figure out what information you are trying to fetch, and then come up with a series of different plans or strategies that could be used to actually get that information.

- it might say, you know what, we could probably get that information very efficiently by using the user's username index and then use the references or pointers inside there to go and fetch some appropriate users from the user heap file. The planner might also come up with a plan where it says you know it rather than using the index. We could just go into the user table directly, fetch all the different users and do a one by one search through them.

- After coming up with all these different plans, the planner is going to evaluate which one it thinks is going to actually execute the fastest and then choose that plan to actually run.

# Executer

- After the planner decides on what the most efficient strategy is, it is handed off to the executor, which is going to actually run the query.

# Explain and Explain analyze

- If we write out, just explain in front of a query, then Postgres is going to build up a query plan and then show us some information about it. It doesn't actually run the underlying query.

- However, if we put in Explain Analyze, Postgres is going to build up a query plan. It's going to execute the query plan and then show us some information about the query plan and some statistics around how long it took to actually run it.

- So in other words, explain kind of tells us what Postgres plans to do but doesn't actually do it. Explain analyze, tells us what Postgres intends to do and then actually executes it as well.

- We are only ever going to use explain and explain, analyze while we are trying to do some performance evaluation. We're never going to leave these in any kind of production application where we want to actually fetch some data.

- The reason for that is that if you make use of explain or explain analyze, you do not actually get back the rows that are coming out of your query. Instead, you just get the query plan itself and possibly some information about it.

[<img src="./pictures/explain_explain_analyze.png" width="50%"/>](./pictures/explain_explain_analyze.png)

- Each of the rows that have an arrow on them we refer to as a query node.

- So this is essentially some step where we are trying to access some data that is stored inside the database or we are trying to do some processing.

- In addition, the very top line up here is technically also a query node as well.

- The way we read this is by going to the innermost rows. So in this case it is this index scan on username index. Every single place where we see one of these little arrows, we imagine it is trying to access some data inside of our database or inside of an index. And then it is trying to emit that data or pass that data up next to the or to the nearest parent that has an arrow on it.

- So we imagine that the index scan is accessing some information on our hard disk. It is then passing that information up to the most parent or the nearest parent node, which in this case is the hash step, the purple one right here.

- The hash step is then doing some processing on that data. It is then emitting that data up to the nearest parent node, which in this case is the hash join.

- At the same time, we've also got a step inside of here sequential scan on comments. You'll recall that a sequential scan means we're going to access all the different rows inside of a table. So we're taking everything inside a sequential scan and we're going to also pass up all those rows up to hash join as well.

- this hash join step is combining the output from the hash and the sequential scan nodes. Then finally, the output of the hash join step is our final result.

[<img src="./pictures/explain_analyze.png" width="50%"/>](./pictures/explain_analyze.png)

[<img src="./pictures/explain_analyze_result.png" width="50%"/>](./pictures/explain_analyze_result.png)

- So in addition to telling us the individual steps and how they're kind of sharing information amongst each other, you'll notice that there are some other interesting numbers inside of here.