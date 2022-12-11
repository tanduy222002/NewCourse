import CoursePage from "../component/CoursePage"
import { useParams } from "react-router-dom";
import axios from "axios";
import { useState } from "react";
import { useEffect } from "react";
import "./CoursePage.css"
export default function CourseDetail(){
    let [data, setData] = useState([]);
    let { id } = useParams();
    useEffect(() =>{
        axios.post("http://localhost:3001/courseDetail", {'courseID' : id}).then((response)=>{
        console.log(response.data);
        setData(response.data);})
    }, []);

    return (
    <div className="m-div">
    {data?.map((value, key) => {
        console.log(value);
        return(
            <div className="main-div" key={key}>
                <div className="content-div">
                    <div className="describe-div">
                        <h1>{value.courseName}</h1>
                        <h2>{value.script}</h2>
                        <h2>{value.detail}</h2>
                        <h2>Intructor: taught by <u>{}</u> </h2>\
                        <button>Enroll for free</button>
                    </div>
                    <img src={value.imgUrl} ></img>
    
                </div>
            <div className="property-div">
                <div className="sub-div">
                    <h1>Rating</h1>
                    <span>4.5/5</span>
                </div>
                <div className="sub-div">
                     <h1>Language</h1>
                    <span>English</span>
                </div>
                <div className="sub-div">
                    <h1>Average Attempt</h1>
                    <span>{value.averageStudyTime}</span>
                </div>
                <div className="sub-div2">
                    <h1>Enrolled</h1>
                    <span>1500</span>
                </div>
            </div>
            </div>
        )
        }
    )}
    </div>
    )
    
}