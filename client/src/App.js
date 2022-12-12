import './App.css';
import {BrowserRouter as Router, Route, Routes, Link} from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';
import Home from "./pages/Home";
import CreateCategory from "./pages/CreateCategory";
import CreateCourse from "./pages/CreateCourse";
import CourseDetail from "./pages/CourseDetail";
import CartDeTail from "./pages/CartDetail"

function App() {

  
  return (
 
    <div className="App">
      <Router>

      <nav class="navbar navbar-dark bg-primary">
      <a class="navbar-brand" href="/">NewCourses</a>
        <Link to='/'>Home</Link>
        <Link to='/createcategory'>Create A Category</Link>
        <Link to='/createcourse'>Create A Course</Link>
        <Link to='/cart'>My cart</Link>
        <Link to='/login'> Login</Link>
        <Link to='/registration'> Registrations</Link>
        
      </nav>
      
      
        <Routes>
          <Route path='/' exact element={<Home />} />
          <Route path='/createcourse' exact element={<CreateCourse />} />
          <Route path='/createcategory' exact element={<CreateCategory />} />
          <Route path='/:id'  exact element={<Home />}/>
          <Route path='/course/:id'  exact element={<CourseDetail />}/>
          <Route path='/cart'  exact element={<CartDeTail/>}/>
          
          {/* <Route path='/post/:id' exact element={<Post />} />
          <Route path='/registration' exact element={<Registration />} />
          <Route path='/login' exact element={<Login />} /> */}
        </Routes>
      </Router>
    </div>
  );
}

export default App;

{/* <div className="category">{value.category}</div>
          <div className="script">{value.script}</div>
          <div className="enrolls">{value.enrolls}</div> */}