import React, { useState } from "react";
import {Formik, Form, Field, ErrorMessage} from 'formik'
import  * as Yup from 'yup';
import axios from "axios";
import { useNavigate } from "react-router-dom";

function CreateCategory() {
    const [categoryName, setCategoryName] = useState("");
    let navigate = useNavigate();  
    const initialValues = {
      CategoryName: "",
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
        // const data1 = {categoryName: categoryName};

        axios.post("http://localhost:3001/createcategory", data).then((response) => {
          const result = response.data[1][0];
            console.log(response.data[1][0]);
          alert(JSON.stringify(result));
        });
        
    }
    // to valid the form in the future copy the line below to the formik line, after onSubmit
    // validationSchema={validationSchema}
  
    return (
      
      <div className="CreateCategoryPage" >
          <Formik initialValues={initialValues} onSubmit={onSubmit}>
              <Form className="formContainer">

                
                  <label>category Name: </label>
                  <ErrorMessage name="CategoryName" component="span"/> 
                  <Field 
                  autoComplete="off"
                  id="inputCreateCategory" 
                  name="CategoryName"
                //   onChange={(e) => setCategoryName(e.target.value)}
                  placeHolder="(Ex. John123...)"
                      
                    />
                  
                  
                  <button type="submit">Create Category</button>
              </Form>
          </Formik>
  
      </div>
    )
  }
  
  export default CreateCategory

