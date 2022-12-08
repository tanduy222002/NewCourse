import './App.css';
import axios from "axios";
import { useEffect, useState } from 'react';

function App() {

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
  );
}

export default App;

{/* <div className="category">{value.category}</div>
          <div className="script">{value.script}</div>
          <div className="enrolls">{value.enrolls}</div> */}