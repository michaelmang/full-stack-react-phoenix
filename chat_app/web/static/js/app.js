import "phoenix_html";
import React from "react";
import ReactDOM from "react-dom";
import Chat from "./containers/Chat";

class App extends React.Component {
  render() {
    return (
      <Chat />
    )
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById("app")
)
