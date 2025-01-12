const request = require('supertest');
const buildApp = require('../../app');
const UserRepo = require('../../repos/user-repo');

it('create a user', async function() {

    const startingCount = await UserRepo.count();
    expect(startingCount).toEqual(0);

    await request(buildApp()).post('/users').send({username:'test user', bio: 'test bio'}).expect(200);

    const finishingCount = await UserRepo.count();
    expect(finishingCount).toEqual(1);
    
})