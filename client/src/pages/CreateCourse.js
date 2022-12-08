import React from 'react'
import {Formik, Form, Field, ErrorMessage} from 'formik'
import  * as Yup from 'yup';
import axios from "axios";
import { useNavigate } from "react-router-dom";

function CreateCourse() {
    let navigate = useNavigate();  
    const initialValues = {
      category: "",
      script: "",
      author: "",
    };
  
    const validationSchema = Yup.object().shape(
      {
        category: Yup.string().required("You must input a category"), // category is required not optional
        script: Yup.string().required("Required"),
        username: Yup.string().min(3).max(15).required("Required"),
      }
    )
  
  
    const onSubmit = (data) =>{
      
        axios.post("http://localhost:3001/posts", data).then((response) => {
          navigate("/"); // navigate to the home page
        });
    
    }
  
    
  
    return (
      <div className="CreateCoursePage" >
          <Formik initialValues={initialValues} onSubmit={onSubmit} validationSchema={validationSchema}>
              <Form className="formContainer">
                <label>Category: </label>
                {/* // ErrorMessage for category */}
                <ErrorMessage name="category" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="category" 
                  placeHolder="Ex:category..."
                      
                  />
                  <label>Script: </label>
                  <ErrorMessage name="script" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="script" 
                  placeHolder="(Ex. Post...)"
                      
                  />
                  <label>Username: </label>
                  <ErrorMessage name="username" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="username" 
                  placeHolder="(Ex. John123...)"
                      
                  />
                  <button type="submit">Create Course</button>
              </Form>
          </Formik>
  
      </div>
    )
  }
  
  export default CreateCourse