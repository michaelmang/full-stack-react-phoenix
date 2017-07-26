// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

import React from "react"
import ReactDOM from "react-dom"
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'

class HelloReact extends React.Component {
  render() {
    return (
      <Router>
        <div>
          <Route exact path="/" component={Home}/>
          <Route exact path="/login" component={Login}/>
        </div>
      </Router>
    )
  }
}

class Home extends React.Component {
  render() {
    return (
      <div>
        <h1>Hello React!</h1>
        <Link to="/login">Login</Link>
      </div>
    )
  }
}

class Login extends React.Component {
  render() {
    return (
      <div>
        <h1>Hello Boring Login Page!</h1>
        <Link to="/">Home</Link>
      </div>
    )
  }
}

ReactDOM.render(
  <HelloReact/>,
  document.getElementById("hello-react")
)

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
