const pool = require('../pool');
const toCamelCase = require('./utils/to-camel-case');

// Whenever we run a query using this pool object, it is always an asynchronous operation. It takes some amount of time for the pool object to reach out to Postgres, execute that query and get a result back.
class UserRepo {
    static async find(){
        //Now, the result object right here is not going to be the actual array of rows or essentially array of objects representing all those different rows. Instead, the result object has a lot of additional information about the query that was issued, some other statistics about it, some other settings and so on.
        const result = await pool.query('SELECT * FROM users;');
        return toCamelCase(result.rows); //So the actual data that we really care about on that result object is on the rows property. So result dot rows, that's the data we care about. That's going to be the array of objects we get back where each object represents one distinct user.
    }

    static async findById(id){
        // const {rows} = await pool.query(`SELECT * FROM users WHERE id = ${id};`);

        // return toCamelCase(rows)[0];

        const {rows} = await pool.query(`SELECT * FROM users WHERE id = $1;`, [id]);

        return toCamelCase(rows)[0];
    }

    //Whenever we do an insert statement, we don't actually get any information about the user that was created back.
    //If we do want to get information about that user, then after the value statement down here or at the very far right hand side, we have to put in a returning star like so. That means that after we insert this user, then go ahead and take all the different columns for that user and return them.
    static async insert(username, bio){
        const {rows} = await pool.query(`INSERT INTO users (username, bio) VALUES ($1, $2) RETURNING *;`, [username, bio]);

        return toCamelCase(rows)[0];
    }


    //And then finally, very similar to when we do an insert, when we do an update, we don't actually get any information back about the rows that were actually updated.

    //So if we want to get some information back about the user that was updated at the very end, we have to put in a returning * again.
    static async update(id, username, bio){
        const {rows} = await pool.query('UPDATE users SET username = $1 , bio = $2 WHERE id = $3 RETURNING *;', [username, bio, id]);
        return toCamelCase(rows)[0];
    }

    //So when we do the delete, we don't actually get any information about the users who were deleted back.
    // So if we want to, we need to add on that returning * once again at the very end.
    static async delete(id){
        const {rows} = await pool.query('DELETE FROM users WHERE id = $1 RETURNING *;', [id]);
        
        return toCamelCase(rows)[0];
    }
    
    static async count(){
        const {rows } = await pool.query('SELECT COUNT(*) FROM users;');
        return parseInt(rows[0].count);
    }
}

module.exports = UserRepo;