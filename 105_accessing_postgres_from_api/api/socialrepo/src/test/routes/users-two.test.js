const request = require("supertest");
const buildApp = require("../../app");
const UserRepo = require("../../repos/user-repo");
const Context = require("../context");

let context;

//A before all statement is going to take a function, That function will then be executed and we're going to wait for that function to be executed before we run any other tests inside this file.
beforeAll(async () => {
  context = await Context.build();
});

//One thing that we might want to do is to make sure that after every individual test inside that file, we might want to delete all the data inside of our database. They'll make sure that if we create any records inside this test file and then run this test right here and then run some other test right after it will be operating out of a totally clean, fresh slate.
beforeEach(async () => {
  await context.reset();
});

afterAll(() => {
  return context.close();
});

it("create a user", async function () {
  const startingCount = await UserRepo.count();
  //expect(startingCount).toEqual(0);

  await request(buildApp())
    .post("/users")
    .send({ username: "test user", bio: "test bio" })
    .expect(200);

  const finishingCount = await UserRepo.count();
  // expect(finishingCount).toEqual(1);
  expect(finishingCount - startingCount).toEqual(1);
});
