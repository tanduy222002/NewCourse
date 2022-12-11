import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { Button } from "bootstrap"
import "./CoursePage.css"

export default function CoursePage(props){
    let { id } = useParams();
    return(
        <div className="main-div">
            <div className="content-div">
                <div className="describe-div">
                    <h1>This is math course</h1>
                    <h2>Khoảnh khắc lịch sử trên sân Al Thumama đến ở phút 42, khi Yahia Attiyat Allah tạt bổng từ biên trái. Trong vòng cấm, thủ thành Diego Costa mắc lỗi khi lao ra đấm hụt, còn Youssef En-Nesyri đè mặt trung vệ Man City Ruben Dias đánh đầu tung nóc lưới Bồ Đào Nha.</h2>
                    <h2>Intructor: taught by <u>someone</u> </h2>\
                    <button>Enroll for free</button>
                </div>
                <img src='https://img.freepik.com/free-vector/cartoon-maths-elements-background_52683-9162.jpg?w=740&t=st=1670690251~exp=1670690851~hmac=0c14bbb6cd880c05ed88dc6794b98ec50940339acdc1f863750654ac04893806'></img>

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
                <span>6 hours</span>
            </div>
            <div className="sub-div2">
                <h1>Enrolled</h1>
                <span>1500</span>
            </div>
        </div>
        </div>
    )

}