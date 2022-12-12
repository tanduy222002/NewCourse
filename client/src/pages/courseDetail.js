import { useParams } from "react-router-dom";
import axios from "axios";
import { useState } from "react";
import { useEffect } from "react";
import "../component/CoursePage.css"
export default function CourseDetail(){
    let [data, setData] = useState([]);
    let { id } = useParams();
    let cart;
    useEffect(() =>{
        axios.post("http://localhost:3001/courseDetail", {'courseID' : id}).then((response)=>{
        console.log(response.data);
        setData(response.data);})
    }, []);
    const addToCartBtnOnClick=()=>{
    //     axios.get("http://localhost:3001/courseInCart").then((response)=>{
    //     cart = (response.data);})
    //     console.log(cart);
    //     let result = cart.filter(rs => rs.courseID==parseInt(id))
    //     console.log(result);
    //      if (result.length!=0){
    //      alert("This course has already added to your cart");
    // } else{
             axios.post("http://localhost:3001/courseToCart", {'courseID' : id,'userID': '3'}).then((response)=>{
            console.log(response);})
    }
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
                        <button onClick={addToCartBtnOnClick}>Add to cart</button>
                    </div>
                    <img src={value.imgUrl} ></img>
    
                </div>
            <div className="property-div">
                <div className="sub-div">
                    <h1>Rating</h1>
                    <span>{value.rating}/5</span>
                </div>
                <div className="sub-div">
                     <h1>Language</h1>
                    <span>{value.Language}</span>
                </div>
                <div className="sub-div">
                    <h1>Average Attempt</h1>
                    <span>{value.averageStudyTime}</span>
                </div>
                <div className="sub-div2">
                    <h1>Enrolled</h1>
                    <span>{value.enroll}</span>
                </div>
            </div>
            </div>
        )
        }
    )}
    </div>
    )
    
}