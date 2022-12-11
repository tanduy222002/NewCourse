import React from 'react'
import axios from "axios";
import { useEffect, useState } from 'react';
import { useParams } from "react-router-dom";
// import { useNavigate } from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import { useNavigate } from 'react-router-dom'

// import Button from 'react-bootstrap/Button';
// // import Form from 'react-bootstrap/Form';
// import InputGroup from 'react-bootstrap/InputGroup';


import {Formik, Form, Field, ErrorMessage} from 'formik'

function Home() {
  let { id } = useParams();
    const [listOfCourses, setListOfCourses] = useState([]);
    const [listOfCategory, setListOfCategory] = useState([]);
    // const [categoryName, setCategoryName] = useState("");
    const navigate = useNavigate();
    const initialValues = {
      courseName: "",
      categoryName: "",
    };
  useEffect(() =>{
    axios.get("http://localhost:3001/").then((response)=>{
      console.log(response.data);
      setListOfCourses(response.data);
    })
    
    axios.get("http://localhost:3001/category").then((response)=>{
      console.log(response.data);
      setListOfCategory(response.data);
    })

    axios.get(`http://localhost:3001/${id}`).then((response)=>{
      console.log(response.data);
      setListOfCourses(response.data);
    })

  }, []);
  // const listOfCourses=[{"id":"5","courseName":"ttt","imgUrl":"https://img.freepik.com/free-vector/cartoon-maths-elements-background_52683-9162.jpg?w=740&t=st=1670690251~exp=1670690851~hmac=0c14bbb6cd880c05ed88dc6794b98ec50940339acdc1f863750654ac04893806","script":"this is script"}]
  // // setListOfCourses(list)
  
  const onSubmit = (data) =>{
    console.log(data);
      axios.post("http://localhost:3001/", data).then((response) => {
        console.log(response);
        // alert(JSON.stringify(response.data));
        setListOfCourses(response.data);
      });
  
  }
  
  return (
    <div>
    <div className="SearchCourse" >
          <Formik initialValues={initialValues} onSubmit={onSubmit}>
              <Form className="formContainer">

                
                  <label>Search for course name: </label>
                  <ErrorMessage name="CategoryName" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="SearchCourse" 
                  name="courseName"
                //   onChange={(e) => setCategoryName(e.target.value)}
                  placeHolder="Ex: Math"
                      
                    />
                  
                  
                  <button type="submit">Search</button>
              </Form>
          </Formik>
  
      </div>

      {listOfCategory?.map((value, key) => {
        return (
          
          <div className= "CategoryList">
            <div key={key}  onClick={() => navigate(`/${value.categoryID}`)}>
            <div className="category">
              <div className="name">{value.categoryName}</div>
            </div>
          </div>
          

        </div>
        );
      })}
      

      {listOfCourses?.map((value, key) => {
        return (
          
          <div className= "CourseList">
            <div key={key}  onClick={() => navigate(`/course/${value.courseID}`)}>
              <div className="course">
                <div className="name">{value.courseName}</div>
                <img className="img-course" src={value.imgUrl} alt="..." ></img>
                <div className="script">{value.script}</div>
                <div className="price">Price: {value.price}</div>
              </div>
          </div>
          

        </div>
        );
      })}
    </div>
  )
}

export default Home