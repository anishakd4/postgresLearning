[<img src="./pictures/node_to_postgres.png" width="50%"/>](./pictures/node_to_postgres.png)

[<img src="./pictures/node_api.png" width="50%"/>](./pictures/node_api.png)

- Now, internally, the module can be used to create something called a client. We usually do not make use of a client directly, and the reason for that is very simple. When you create a client, it can only execute one query at a time. That is definitely a very big issue.

- So rather than using a client directly, we generally make use of something instead called a pool. A pool internally maintains a list of different clients. Then any time that you need to run a query, you essentially ask the pool to run a query for you. The pool will take your query, hand it off to one of the clients that is free internally, and that client will then execute the query over to Postgres.

[<img src="./pictures/sql_pg_01.png" width="50%"/>](./pictures/sql_pg_01.png)

[<img src="./pictures/sql_pg_02.png" width="50%"/>](./pictures/sql_pg_02.png)

[<img src="./pictures/sql_pg_03.png" width="50%"/>](./pictures/sql_pg_03.png)