const app = require('./src/app');

const pool = require('./src/pool');

pool.connect({
    host: 'localhost',
    port: 5432,
    database: 'socialnetwork',
    user: 'anishkumardubey',
    password: '',
}).then(() => {
    app().listen(3005, () => {
        console.log('Server is running on port 3005');
    });
}).catch(err => {console.error(err);});


//It turns out that when you first create a pool, it does not actually make any contact with Postgres whatsoever. It is only when a client is created that we make any contact with Postgres. So in other words, when you first create a pool, no contact with Postgres is made. And that means that all these connection credentials right here are not actually used or evaluated in any way.

// So if we want to make sure that these are the correct credentials and throw an error if they are not, we need to somehow tell the pool to immediately create a client and try to connect to Postgres.

// So one way we could do this very easily is go back over to our pool JS file. Inside of connect right after creating our new pool, we can use that pool to make a very simple, very basic query. When we make that query, it's going to force the pool to connect to our Postgres database, and that therefore is going to test out those connection credentials we just provided.