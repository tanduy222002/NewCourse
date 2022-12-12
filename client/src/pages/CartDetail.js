import "../component/CartDetail.css"
import { useParams } from "react-router-dom";
import axios from "axios";
import { useState } from "react";
import { useEffect } from "react";
export default function CartDeTail(){
    let [data, setData] = useState([]);
    useEffect(() =>{
        axios.get("http://localhost:3001/cart?id=3", ).then((response)=>{
        console.log(response.data);
        setData(response.data);})
    }, []);



    return(
     
                <div className="main-div">
            <div className="header">
                <h1>Course Cart</h1>
                <h2>{data.length} items</h2>
            </div>
            <div className="detail-div">
            <table className="detail-table">
            <thead>
                <tr>
                    <th >Product</th>
                    <th>Description</th>
                    <th >Price</th>
                </tr>
            </thead>
           
            {data?.map((value, key) => {
           
             return(
                <tbody>
                <td key={key}>
                    <div className="detail-product">
                    <h3>{value.courseName}</h3>
                    <img src={value.imgUrl}/>
                    </div>
                </td>
                <td>{value.script}</td>
                <td>{value.price}</td>
                </tbody>)})}
               
           
        </table>
            </div>
        </div>
             
        
    )




  }