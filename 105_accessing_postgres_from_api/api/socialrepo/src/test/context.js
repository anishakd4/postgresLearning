const { randomBytes } = require("crypto");
const { default: migrate } = require("node-pg-migrate");
const format = require("pg-format");
const pool = require("../pool");

const DEFAULT_OPTS = {
  host: "localhost",
  port: 5432,
  database: "socialnetwork-test",
  user: "anishkumardubey",
  password: "",
};

class Context {
  static async build() {
    //Randomly generating a role name to connect to PG as. Whenever we create a role inside of Postgres, it must always have a name associated with it that starts with a letter, can't have a role name that starts with a number.
    const roleName = "a" + randomBytes(4).toString("hex");

    //Connect to PG as usual
    await pool.connect(DEFAULT_OPTS);

    //Create a new role
    // await pool.query(`CREATE ROLE ${roleName} WITH LOGIN PASSWORD '${roleName}'`);
    // The %i means that we want to substitute in something that's going to be an identifier. %l means we're going to substitute in something that's going to be a literal value.
    // So this is how we use the format module to still do some kind of escaping when it involves a literal or an identifier.
    await pool.query(
      format("CREATE ROLE %I WITH LOGIN PASSWORD %L;", roleName, roleName)
    );

    //CREATE schema with the same name
    //AUTHORIZATION just makes it very clear that this role that we just created can access this schema that we're making.
    // await pool.query(`CREATE SCHEMA ${roleName} AUTHORIZATION ${roleName} ;`);
    await pool.query(
      format("CREATE SCHEMA %I AUTHORIZATION %I;", roleName, roleName)
    );

    //Disconnect entirely from pg
    await pool.close();

    //Run our migrations in the new schema
    //Normally whenever we run migrations, this migrate function generates a ton of log statements and dumps them out at the terminal. Because we are running tests here we don't really care about in these log statements.
    //By providing this empty function. The Migrate library is going to try to call that function with all the log statements that are generated.
    //By default, we are supposed to only be running one set of migrations at a time. But because we are trying to run multiple different test files in parallel here, we might be in a scenario where we are trying to run multiple different migrations simultaneously. Usually that would result in an error. So we're going to override that behavior by providing no lock:True. Which essentially means don't lock up the database when we are running these migrations.
    //Next up, we'll provide dir. Short for directory. This is going to be the folder inside of our project where all the migration files are stored.
    await migrate({
      schema: roleName,
      direction: "up",
      log: () => {},
      noLock: true,
      dir: "migrations",
      databaseUrl: {
        host: "localhost",
        port: 5432,
        database: "socialnetwork-test",
        user: roleName,
        password: roleName,
      },
    });

    //Connect to pg as the newly created role
    await pool.connect({
      host: "localhost",
      port: 5432,
      database: "socialnetwork-test",
      user: roleName,
      password: roleName,
    });

    return new Context(roleName);
  }

  constructor(roleName) {
    this.roleName = roleName;
  }

  async close() {
    //Disconnect for pg
    await pool.close();

    //Reconect as our root user
    await pool.connect(DEFAULT_OPTS);

    //Delete the role and schema we created
    await pool.query(format("DROP SCHEMA %I CASCADE;", this.roleName));
    await pool.query(format("DROP ROLE %I;", this.roleName));

    //Reconnect as root user
    await pool.close();
    await pool.connect(DEFAULT_OPTS);
    //Disconnect
  }
}

module.exports = Context;
