import React from 'react'
import axios from "axios";
import { useEffect, useState } from 'react';
// import { useNavigate } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import { useNavigate } from 'react-router-dom'

import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import InputGroup from 'react-bootstrap/InputGroup';

function Home() {
    const [listOfCourses, setListOfCourses] = useState([]);

  useEffect(() =>{
    axios.get("http://localhost:3001/").then((response)=>{
      console.log(response.data);
      setListOfCourses(response.data);
    })
  }, []);
  // const listOfCourses=[{"id":"5","courseName":"ttt","imgUrl":"https://img.freepik.com/free-vector/cartoon-maths-elements-background_52683-9162.jpg?w=740&t=st=1670690251~exp=1670690851~hmac=0c14bbb6cd880c05ed88dc6794b98ec50940339acdc1f863750654ac04893806","script":"this is script"}]
  // // setListOfCourses(list)
  const navigate = useNavigate()
  return (
    <div>
    <InputGroup className="mb-3">
        <Form.Control
          placeholder="Name of book"
          aria-label="Recipient's username"
          aria-describedby="basic-addon2"
        />
        <Button variant="outline-secondary" id="button-addon2">
          Search
        </Button>
      </InputGroup>


      {listOfCourses?.map((value, key) => {
          {/* var img = document.createElement("img");
          img.src = {value,imgUrl};
          var src = document.getElementById("imgCourse");
          document.body.appendChild(img); */}
         var imgUrl = value.imgUrl;
        return (
          <div key={key}  onClick={() => navigate(`/course/${value.courseID}`)}>
          <div className="course">
          <div className="name">{value.courseName}</div>
          <img className="img-course" src={value.imgUrl} alt="..." ></img>
          <div className="script">{value.script}</div>
          <div className="price">Price: {value.price}</div>
          </div>

        </div>
        );
      })}
    </div>
  )
}

export default Home