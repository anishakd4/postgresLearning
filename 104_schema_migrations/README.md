- Schema migrations are all about making very careful and well-planned changes to the structure of your database. So we are talking about adding columns to a table, removing columns, changing the name of a column, adding tables, removing tables, and so on.

[<img src="./pictures/migration_issues_01.png" width="50%"/>](./pictures/migration_issues_01.png)

[<img src="./pictures/migration_issues_02.png" width="50%"/>](./pictures/migration_issues_02.png)

[<img src="./pictures/migration_issues_03.png" width="50%"/>](./pictures/migration_issues_03.png)

[<img src="./pictures/migration_issues_04.png" width="50%"/>](./pictures/migration_issues_04.png)

[<img src="./pictures/migration_issues_05.png" width="50%"/>](./pictures/migration_issues_05.png)

[<img src="./pictures/migration_issues_06.png" width="50%"/>](./pictures/migration_issues_06.png)

[<img src="./pictures/migration_issues_07.png" width="50%"/>](./pictures/migration_issues_07.png)

[<img src="./pictures/migration_issues_08.png" width="50%"/>](./pictures/migration_issues_08.png)

- Lesson number one was that whenever we change the structure of our database, we needed to make sure that we changed our clients, that we're connecting to that database at the same time. Big lesson number two was that whenever we were working with other engineers, we really need a way to tie the structure of our database to some specific version of our code.

-  we have been making changes to the structure of our database by opening up Pgadmin, accessing some database, and then writing out some command that changes the structure of our database. So in other words, all changes were made directly inside of Pgadmin.

- Moving forward, wherever possible, we're going to instead author something called a schema migration file.

- Schema Migration files are files that contain some amount of code that describe a very precise and very detailed change that we want to make to our database.

- So, for example, if we wanted to take our comments table and rename the contents column over to body, we are going to write out a schema migration file. That migration file is going to contain some code that says I want to rename contents over to body.

[<img src="./pictures/schema_migration_file.png" width="50%"/>](./pictures/schema_migration_file.png)
