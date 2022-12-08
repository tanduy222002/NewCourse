const express = require("express");
const app = express();
const mysql = require("mysql2");
const bodyParser = require("body-parser");
const cors = require("cors");

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));


const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "608474aZ",
    database: "coursedb",
  });

app.get("/", (req, res) =>{
    const sqlSelect = "SELECT * FROM coursedb.course";
    db.query(sqlSelect, (err, result) =>{
        res.send(result);
    });
});

app.listen(3001, () =>{
    console.log("running on port 3001");
});