import './App.css';
import {BrowserRouter as Router, Route, Routes, Link} from 'react-router-dom';

import Home from "./pages/Home";

function App() {

  
  return (
    
    <div className="App">
      <Router>

      {/* <nav class="navbar navbar-dark bg-primary">
      <Link to='/'>Home</Link>
        <Link to='/createpost'>Create A Course</Link>
        <Link to='/login'> Login</Link>
        <Link to='/registration'> Registrations</Link>
      </nav> */}
      <div className="navbar">
      <Link to='/'>Home</Link>
        <Link to='/createpost'>Create A Course</Link>
        <Link to='/login'> Login</Link>
        <Link to='/registration'> Registrations</Link>
      </div>
      
        <Routes>
          <Route path='/' exact element={<Home />} />
          {/* <Route path='/createpost' exact element={<CreatePost />} /> */}
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