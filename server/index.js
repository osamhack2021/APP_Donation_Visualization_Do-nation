import mysql from "mysql";
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "1234",
  database: "my_db",
});

connection.connect();

console.log("connected");

// connection.query("CREATE DATABASE IF NOT EXISTS my_db;");

connection.end();
