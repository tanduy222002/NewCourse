import React from 'react'
import axios from "axios";
import { useEffect, useState } from 'react';
// import { useNavigate } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';

function Home() {
    const [listOfCourses, setListOfCourses] = useState([]);

  useEffect(() =>{
    axios.get("http://localhost:3001/").then((response)=>{
      console.log(response.data);
      setListOfCourses(response.data);
    })
  }, []);
  return (
    <div>
      {listOfCourses.map((value, key) => {
          {/* var img = document.createElement("img");
          img.src = {value,imgUrl};
          var src = document.getElementById("imgCourse");
          document.body.appendChild(img); */}
         var imgUrl = value.imgUrl;
        return (<div className="course">
          <div className="name">{value.courseName}</div>
          <img className="img-course" src={value.imgUrl} alt="..." ></img>
          <div className="script">{value.script}</div>
          <div className="price">Price: {value.price}</div>
          

        </div>
        );
      })}
    </div>
  )
}

export default Home