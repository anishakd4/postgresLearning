# Common table expressions

-- So the only thing we have really done here in rewriting this query is make it easier for you and I to read and understand what is going on. Making use of this common table expression doesn't actually change how this entire query gets executed.

- The behind the scenes. What we can kind of imagine is happening now is we're going to run that sub query that's going to give us back some number of rows and columns. Those rows and columns can then be accessed through the tags identifier.

[<img src="./pictures/common_table_expression.png" width="50%"/>](./pictures/common_table_expression.png)

- We define them with a with keyword right before the main query.

- Well, it turns out that there's actually two different uses or kind of two different forms of common table expressions.

- There's the simple form which we are using right now, and this is used to make a query query easier to understand, and that is pretty much it. Nothing else is really changing behind the scenes.

- But there is a second form of a common table expression referred to as a recursive form. A recursive common table expression allows you to write queries that are otherwise impossible to to express with just plain SQL by itself.

[<img src="./pictures/common_table_expressions.png" width="50%"/>](./pictures/common_table_expressions.png)

# Recursive CTE(Common table expressions)

[<img src="./pictures/recursive_ctes.png" width="50%"/>](./pictures/recursive_ctes.png)

- As I've mentioned, every recursive CTE is going to have a union inside of it, whether or not you think you need it.

- We then have one select immediately above, we refer to the select statement above the Union. As the initial or non-recursive query.

- Then immediately after the union, we've got another select. We refer to this statement right here as the recursive query.

[<img src="./pictures/recursice_cte.png" width="50%"/>](./pictures/recursice_cte.png)

[<img src="./pictures/recursive_01.png" width="50%"/>](./pictures/recursive_01.png)

- The first thing that occurs when we run this query, Postgres is going to define two tables behind the scenes. So you're not really going to see these immediately or really see them in any kind of output. We refer to these two temporary tables as a results table and the working table.

[<img src="./pictures/recursive_steps.png" width="50%"/>](./pictures/recursive_steps.png)

- Both these tables are going to be given some number of columns. The columns that they get assigned are whatever you have inside of that set of parentheses right there. So we have with recursive, then some name and then a set of parentheses.

- In this case, we have just one word inside those parentheses of Val, which again is short for value. That means that both of our tables are going to have one single column labeled Val.

[<img src="./pictures/recursive_steps_01.png" width="50%"/>](./pictures/recursive_steps_01.png)

- If we had additional words inside of here, such as maybe created_at or count, that means that we would have additional columns inside of both these tables.


[<img src="./pictures/recursive_steps_03.png" width="50%"/>](./pictures/recursive_steps_03.png)

- In step number two, we run the initial or non-recursive statement. So we're going to run that and then we're going to put the results from that statement into both the results table and the working table.

- So we can imagine that we're going to execute select 3 as Val by itself.

[<img src="./pictures/recursive_04.png" width="50%"/>](./pictures/recursive_04.png)

- So in step number three, we're going to now run our recursive statement. And here's the kind of little trick to understanding what's going on here. We're going to replace the table name of Countdown in there with a reference to the working table instead.

- We are selecting all the different rows from the working table where Val is greater than one. So in that case, it gives us this one row right here. Then from that one row, we are saying take the value inside of the Val column and subtract one from it.

-  if the recursive statement returned any rows. And yep, it definitely did. It gave us that right there. Then we're going to take that row and append it to the results table.

- I'm then going to throw away. This is not really in the step right here, but I'm going to throw away everything inside of the working table as it stands right now, and I'm going to replace it with the result of that recursive query that we just calculated.

- Because our recursive statement just returns some rows. We're then going to run a recursive statement again.

- So we're going to go back up here to step number three. So let's imagine what happens there again, that we're going to run the recursive statement.

-  in the last case, when we executed this query right here, we did not get any rows back out of it. No rows whatsoever. So in this case, our recursive statement returned no rows. So we are going to immediately stop recursion.

- Then our results table will be taken. We're going to rename the results table to whatever we named our recursive as. In this case, we called it Countdown.

- And now we're going to make this resulting table right here accessible to the rest of our query or essentially the outer query.

[<img src="./pictures/recursive__step_05.png" width="50%"/>](./pictures/recursive__step_05.png)

[<img src="./pictures/recursive__step_06.png" width="50%"/>](./pictures/recursive__step_06.png)

[<img src="./pictures/recursive__step_07.png" width="50%"/>](./pictures/recursive__step_07.png)

[<img src="./pictures/recursive__step_08.png" width="50%"/>](./pictures/recursive__step_08.png)

# Why use recursive ctes

- So Instagram makes the assumption this is a really big assumption. If I am interested in these people and those people are interested in these people, then I should be interested in Justin Bieber, Jennifer Lopez and Snoop Dog as well.

- So to get the list of suggestions for this page right here, we would have to write out a query to take a look at who some user is following. Find those people and then find who they are following in turn.

[<img src="./pictures/why_use_resursive_ctes.png" width="50%"/>](./pictures/why_use_resursive_ctes.png)

- As you can imagine that this tree kind of grows in depth over and over and over.

- So even if we could figure out some way to write a joint statement to get this kind of first unassociated layer, because I am already following these people, even if we could kind of figure out a joint statement to get these writing out, a joint statement to go down another level and then another in another would get really confusing and really nasty really quickly.

[<img src="./pictures/why_use_resursive_ctes_02.png" width="50%"/>](./pictures/why_use_resursive_ctes_02.png)

# Recursive cte example 

[<img src="./pictures/recurive_cte_example_query.png" width="50%"/>](./pictures/recurive_cte_example_query.png)

- We're going to find all the rows with a follower of one.

[<img src="./pictures/recursive_cte_example_00.png" width="50%"/>](./pictures/recursive_cte_example_00.png)

[<img src="./pictures/recursive_cte_example_01.png" width="50%"/>](./pictures/recursive_cte_example_01.png)

[<img src="./pictures/recursive_cte_example_02.png" width="50%"/>](./pictures/recursive_cte_example_02.png)

[<img src="./pictures/recursive_cte_example_03.png" width="50%"/>](./pictures/recursive_cte_example_03.png)

[<img src="./pictures/recursive_cte_example_04.png" width="50%"/>](./pictures/recursive_cte_example_04.png)

[<img src="./pictures/recursive_cte_example_05.png" width="50%"/>](./pictures/recursive_cte_example_05.png)

[<img src="./pictures/recursive_cte_example_06.png" width="50%"/>](./pictures/recursive_cte_example_06.png)

