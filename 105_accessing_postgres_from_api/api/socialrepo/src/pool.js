const pg = require('pg');


// we are wrapping up this pool inside of another class so that we can very easily tell our pool to connect to some different database at some point in time. So if we ever want to connect to a different pool, we'll be able to call, connect, provide the configuration options or the connection options, and we get a brand new pool connected to that different database. So that's the only difference here. We're just making a little bit easier to tell our pool to reconnect somewhere else very, very easily.

class Pool {
    _pool = null;

    connect(options){
        this._pool = new pg.Pool(options);
        return this._pool.query('SELECT 1 + 1;');
    }

    close(){
        return this._pool.end();
    }

    query(sql){
        return this._pool.query(sql);
    }
}

module.exports = new Pool();