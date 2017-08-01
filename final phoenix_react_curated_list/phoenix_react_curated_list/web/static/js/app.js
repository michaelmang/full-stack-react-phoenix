import "phoenix_html";
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import Blogs from './containers/Blogs';
import Form from './containers/Form';
import UpdateForm from './containers/UpdateForm';

class App extends React.Component {
  render() {
    return (
      <Router>
        <div>
          <Route exact path="/" component={Blogs}/>
          <Route path="/create" component={Form}/>
          <Route path="/update" component={UpdateForm}/>
        </div>
      </Router>
    )
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById("app")
)
