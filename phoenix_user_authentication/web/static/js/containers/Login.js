import React from "react";
import axios from "axios";

class Login extends React.Component {
  constructor() {
    super();
    this.state = {
      username: '',
      password: '',
      token: ''
    };
  }

  handleUsername(event) {
    this.setState({ username: event.target.value })
  }

  handlePassword(event) {
    this.setState({ password: event.target.value })
  }

  handleSubmit (event) {
    event.preventDefault();
    axios({
      method: 'post',
      headers: {
        "Content-Type": "application/json",
      },
      url: 'http://localhost:4000/api/sessions',
      data: {
          username: this.state.username,
          password: this.state.password
      }
    })
      .then((response) => {
        console.log(response);
      });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit.bind(this)}>
        <div className="field">
          <label className="label">Username</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value = {this.state.username}
              onChange = {this.handleUsername.bind(this)}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Password</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value = {this.state.password}
              onChange = {this.handlePassword.bind(this)}
            />
          </div>
        </div>

        <button
          type="submit"
          value="Submit"
          className="button is-primary"
        >
        Submit
        </button>
      </form>
    )
  }
}

export default Login
