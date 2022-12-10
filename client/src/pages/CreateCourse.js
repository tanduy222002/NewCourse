import React from 'react'
import {Formik, Form, Field, ErrorMessage} from 'formik'
import  * as Yup from 'yup';
import axios from "axios";
import { useNavigate } from "react-router-dom";

function CreateCourse() {
    let navigate = useNavigate();  
    const initialValues = {
      courseName: "",
      category: "",
      imgUrl: "",
      script: "",
      detail: "",
      insID: "",
      language: "",
      studyTime: "",
      price: "",
    };
  // valid the form, but not work
    // const validationSchema = Yup.object().shape(
    //   {
    //     name: Yup.string().required("You must input a name"), // category is required not optional
    //     category: Yup.string().required("You must input a category"),
    //     imgUrl: Yup.string().required("You must input a imgUrl"),
    //     script: Yup.string().required("You must input a script"),
    //     detail: Yup.string().required("You must input a detail"),
    //     insID: Yup.string().required("You must input a insID"),
    //     language: Yup.string().required("You must input a language"),
    //     studyTime: Yup.string().required("You must input a studyTime"),
    //     price: Yup.string().required("You must input a price"),
    //   }
    // )
  
  
    const onSubmit = (data) =>{
      // console.log(data);
        axios.post("http://localhost:3001/createcourse", data).then((response) => {
          console.log(response);
          alert(JSON.stringify(response.data));
        });
    
    }
    // to valid the form in the future copy the line below to the formik line, after onSubmit
    // validationSchema={validationSchema}
  
    return (
      
      <div className="CreateCoursePage" >
          <Formik initialValues={initialValues} onSubmit={onSubmit}>
              <Form className="formContainer">

                
                  <label>Course Name: </label>
                  <ErrorMessage name="courseName" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="courseName" 
                  placeHolder="(Ex. John123...)"
                      
                  />
                    <label>Category: </label>
                  <ErrorMessage name="category" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="category" 
                  placeHolder="Ex:category..."
                      
                  />
                  <label>Link to image: </label>
                  <ErrorMessage name="imgUrl" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="imgUrl" 
                  placeHolder="(Ex. Post...)"
                      
                  />

                  <label>Script: </label>
                  <ErrorMessage name="script" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="script" 
                  placeHolder="Ex:category..."
                      
                  />

                  <label>Detail(255char): </label>
                  <ErrorMessage name="detail" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="detail" 
                  placeHolder="Ex:category..."
                      
                  />

                  <label>InstructorID: </label>
                  <ErrorMessage name="insID" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="insID" 
                  placeHolder="Because the login function has not been implemented yet, it must be entered"
                      
                  />

                  <label>Language: </label>
                  <ErrorMessage name="language" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="language" 
                  placeHolder="Ex:English..."
                      
                  />
                  
                  <label>Study Time: </label>
                  <ErrorMessage name="studyTime" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="studyTime" 
                  placeHolder="Ex: 37:00"
                      
                  />

                  

                  <label>Price: </label>
                  <ErrorMessage name="price" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCourse" 
                  name="price" 
                  placeHolder="Ex:200"
                      
                  />
                  
                  
                  <button type="submit">Create Course</button>
              </Form>
          </Formik>
  
      </div>
    )
  }
  
  export default CreateCourse

