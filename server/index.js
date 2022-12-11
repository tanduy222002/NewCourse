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
    database: "newcourse",
    multipleStatements: true,
  });

app.get("/", (req, res) =>{
    console.log(req.body);
    if(req.body.courseName == null){
        const sqlSelect = "SELECT * FROM newcourse.course";
        db.query(sqlSelect, (err, result) =>{
            res.send(result);
        });
    }
});

app.post("/", (req, res) =>{
    const courseName = req.body.courseName;
    console.log("courseName: ", courseName);
     
    db.query('SELECT * FROM newcourse.course WHERE courseName like ?', ['%' + courseName + '%'], 
    function (error, results, fields) {
        if (error) throw error;
        console.log(results);
        res.send(results);
    }
);
    
}
);



app.post("/createcategory", (req, res) => {
    
    const CategoryName = req.body.CategoryName;
    console.log("categoryName: ", CategoryName)
    const sqlCreateCat = "CALL ADD_CATEGORY(?, @state); select @state;";
    db.query(sqlCreateCat,[CategoryName], (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send(result);
    }
    );
});

app.post("/createcourse", (req, res) =>{
    const courseName = req.body.courseName;
    const category = req.body.category;
    const imgUrl = req.body.imgUrl;
    const script = req.body.script;
    const detail = req.body.detail;
    const insID = req.body.insID;
    const language = req.body.language;
    const studyTime = req.body.studyTime;
    const price = req.body.price;

    console.log("courseName: ", courseName);
    const addCourse = "CALL addCourse(?,?,?,?,?,?,?,?,?, @stateOfQuery); select @stateOfQuery;";
    db.query(addCourse, [courseName, category, imgUrl, script, detail, language, studyTime, insID, price], (err, result) =>{
        if(err) throw err;
        console.log("result: ", result);
        res.send(result);
    });
}
);


app.listen(3001, () =>{
    console.log("running on port 3001");
});