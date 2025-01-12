const request = require('supertest');
const buildApp = require('../../app');
const UserRepo = require('../../repos/user-repo');
const pool = require('../../pool');

//A before all statement is going to take a function, That function will then be executed and we're going to wait for that function to be executed before we run any other tests inside this file.
beforeAll(() => {
    return pool.connect({
        host: 'localhost',
        port: 5432,
        database: 'socialnetwork-test',
        user: 'anishkumardubey',
        password: '',
    });
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