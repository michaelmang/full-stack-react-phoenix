import React from "react";

class BlogCard extends React.Component {

  render() {
    return (
      <div className="card">
        <div className="card-image">
          <figure className="image is-4by3">
            <a href={this.props.link}>
              <img src={this.props.image} alt="Image" />
            </a>
          </figure>
        </div>
        <div className="card-content">
          <div className="media">
            <div className="media-content">
              <p className="title is-4">{this.props.title}</p>
              <p className="subtitle is-6">{this.props.subtitle}</p>
              <p className="subtitle is-6">By {this.props.author}</p>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default BlogCard
