# Query Processing pipeline

- This query is going to be fed into Postgres and it's going to go through a series of processing steps. It's going to go through the parser, a rewriter, a planner and an executor.

[<img src="./query_processing_pipeline.png" width="50%"/>](./query_processing_pipeline.png)

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