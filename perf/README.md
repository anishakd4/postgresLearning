# raw_data_files_in_db

- So all the files you see right here, these represent the raw data inside of our database.
- And when we look at this, it kind of looks like there are too many files for them to represent the individual tables that we have. And it looks like there's too few for it to be like maybe one file for every row and every table.
- 22442 is oid of instagram in my local database

[<img src="./raw_data_files_in_db.png" width="50%"/>](./raw_data_files_in_db.png)

- So each of these different rows. Contains information about one of those different files that we're taking a look at above.
- Each file, in turn, represents one individual object inside of our database.
- So this file 16420 which is is shown against users table in below, in theory, contains all of the data for my entire users table.

[<img src="./pg_class_list.png" width="50%"/>](./pg_class_list.png)