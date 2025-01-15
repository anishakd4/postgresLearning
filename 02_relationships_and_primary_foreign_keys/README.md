## Database for photo sharing application

[<img src="./pictures/database_for_photo_sharing.png" width="50%"/>](./pictures/database_for_photo_sharing.png)

## One to one and many to one relationship

[<img src="./pictures/one_to_many_and_many_to_one.png" width="50%"/>](./pictures/one_to_many_and_many_to_one.png)

## One to one

[<img src="./pictures/one_to_one.png" width="50%"/>](./pictures/one_to_one.png)

## many to many

[<img src="./pictures/many_to_many.png" width="50%"/>](./pictures/many_to_many.png)

## Four relationships

[<img src="./pictures/four_relationships.png" width="50%"/>](./pictures/four_relationships.png)

## Primary keys and foreign keys

- primary key is unique. value in primary key is unique and never going to be changed.
- goal of foreign key is to somehow relate 1 record in a table to another record in another or same table.

[<img src="./pictures/primary_foreign_keys.png" width="50%"/>](./pictures/primary_foreign_keys.png)

[<img src="./pictures/primary_foreign_example.png" width="50%"/>](./pictures/primary_foreign_example.png)

## Primary keys vs foreign keys

[<img src="./pictures/primary_vs_foreign.png" width="50%"/>](./pictures/primary_vs_foreign.png)

## Foreign keys

[<img src="./pictures/foreign_keys1.png" width="50%"/>](./pictures/foreign_keys1.png)

[<img src="./pictures/foreign_keys2.png" width="50%"/>](./pictures/foreign_keys2.png)

## Foreign key cases

[<img src="./pictures/foreign_key_cases.png" width="50%"/>](./pictures/foreign_key_cases.png)

## What if we delete a row in table

- If we delete a row in table with a SERIAL type column then there won't be any other record with the same id. No serial id ever gets reused even if the row ever gets deleted.

- By default, the option that gets used if we don't specify anything at all is on delete restrict.

- On delete Cascade is frequently a really good option if we want to try to delete a user and all the data associated with them.

[<img src="./pictures/constraints_in_delete.png" width="50%"/>](./pictures/constraints_in_delete.png)
