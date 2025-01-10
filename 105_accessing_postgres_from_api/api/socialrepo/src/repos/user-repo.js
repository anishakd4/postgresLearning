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
        const {rows} = await pool.query(`SELECT * FROM users WHERE id = ${id};`);

        return toCamelCase(rows)[0];
    }

    static async insert(){

    }

    static async update(){

    }

    static async delete(){

    }
}

module.exports = UserRepo;