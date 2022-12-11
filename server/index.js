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
    password: "123456",
    database: "newcourse",
    multipleStatements: true,
  });


  // query course detail
  
app.post("/courseDetail",(req,res)=>{
    console.log("call");
    let cID=parseInt(req.body.courseID);
    const sqlCreateCat = "CALL getCourseInfo(?);";
    db.query(sqlCreateCat,cID, (err, result) => {
        if(err) throw err;
        console.log(result[0]);
        res.send(result[0]);
    }
    );
})


  // query all courses
app.get("/", (req, res) =>{
    console.log(req.body);
    if(req.body.courseName == null){
        const sqlSelect = "SELECT * FROM newcourse.course";
        db.query(sqlSelect, (err, result) =>{
            res.send(result);
        });
    }
});

// query all categories
app.get("/category", (req, res) =>{
    const sqlSelect = "SELECT * FROM newcourse.categories";
    db.query(sqlSelect,
    function (error, results, fields) {
        if (error) throw error;
        console.log(results);
        res.send(results);
    }
);
});
// query course by name
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

// query course by category
app.post("/:id", (req, res) =>{
    const {categoryid} = req.body.categoryID;
    console.log("categoryID: ", categoryID);
    
    const sql = "SELECT * FROM newcourse.course WHERE categoryID = ?";
    db.query(sql, [categoryID], (err, result) =>{
        if(err) throw err;
        console
        .log(result);
        res.send(result);
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