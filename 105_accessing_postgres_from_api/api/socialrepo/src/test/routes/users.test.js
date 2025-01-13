const request = require('supertest');
const buildApp = require('../../app');
const UserRepo = require('../../repos/user-repo');
const pool = require('../../pool');

const {randomBytes} = require('crypto');
const {default: migrate} = require('node-pg-migrate');
const format = require('pg-format');

//A before all statement is going to take a function, That function will then be executed and we're going to wait for that function to be executed before we run any other tests inside this file.
beforeAll( async () => {
    //Randomly generating a role name to connect to PG as. Whenever we create a role inside of Postgres, it must always have a name associated with it that starts with a letter, can't have a role name that starts with a number.
    const roleName = 'a' + randomBytes(4).toString('hex');

    //Connect to PG as usual
    await pool.connect({
        host: 'localhost',
        port: 5432,
        database: 'socialnetwork-test',
        user: 'anishkumardubey',
        password: '',
    });

    //Create a new role
    await pool.query(`CREATE ROLE ${roleName} WITH LOGIN PASSWORD '${roleName}'`);

    //CREATE schema with the same name
    await pool.query(`CREATE SCHEMA ${roleName} AUTHORIZATION ${roleName} ;`);
});

afterAll(() => {
    return pool.close();
})

it('create a user', async function() {

    const startingCount = await UserRepo.count();
    //expect(startingCount).toEqual(0);

    await request(buildApp()).post('/users').send({username:'test user', bio: 'test bio'}).expect(200);

    const finishingCount = await UserRepo.count();
    // expect(finishingCount).toEqual(1);
    expect(finishingCount - startingCount).toEqual(1);

})