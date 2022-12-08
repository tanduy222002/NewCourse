import React from 'react'
import axios from "axios";
import { useEffect, useState } from 'react';

function Home() {
    const [listOfCourses, setListOfCourses] = useState([]);

  useEffect(() =>{
    axios.get("http://localhost:3001/").then((response)=>{
      setListOfCourses(response.data);
    })
  }, []);
  return (
    <div>
      {listOfCourses.map((value, key) => {
        return (<div className="course">
          <div className="category">Category: {value.category}</div>
          <div className="script">{value.script}</div>
          <div className="enrolls">Enrolls: {value.enrolls}</div>
      
        </div>
        );
      })}
    </div>
  )
}

export default Home