import React from "react";

class ServerMessage extends React.Component {

  render() {
    return (
      <div className="box" style={{ marginBottom: "10px" }}>
        <article className="media">
          <div className="media-content">
            <div className="content">
              <p>
                <strong>{this.props.username}</strong>
                <br/>
                {this.props.message}
              </p>
            </div>
          </div>
        </article>
      </div>
    )
  }
}

export default ServerMessage
