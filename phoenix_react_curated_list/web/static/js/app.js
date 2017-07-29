import "phoenix_html";
import React from "react";
import ReactDOM from "react-dom";
import Blogs from './containers/Blogs';

class App extends React.Component {
  render() {
    return (
      <Blogs />
    )
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById("app")
)
