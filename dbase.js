const Pool = require("pg").Pool;

const pool = new Pool({
    user: "postgres",
    password: "postgres",
    host: "localhost",
    database: "car_dealerships",
    port: 5432
});

module.exports = pool;