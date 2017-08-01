import React from "react";
import axios from "axios";

class UpdateForm extends React.Component {
  constructor() {
    super();
    this.state = {
      title: '',
      subtitle: '',
      image: '',
      link: '',
      author: ''
    };
  }

  handleTitle(event) {
    this.setState({ title: event.target.value })
  }

  handleSubtitle(event) {
    this.setState({ subtitle: event.target.value })
  }

  handleImage(event) {
    this.setState({ image: event.target.value })
  }

  handleLink(event) {
    this.setState({ link: event.target.value })
  }

  handleAuthor(event) {
    this.setState({ author: event.target.value })
  }

  handleSubmit (event) {
    event.preventDefault();
    axios({
      method: 'put',
      headers: {"Content-Type": "application/json"},
      url: 'http://localhost:4000/api/blogs/7',
      data: {
        blogs: {
          title: this.state.title,
          subtitle: this.state.subtitle,
          image: this.state.image,
          link: this.state.link,
          author: this.state.author
        }
      }
    });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit.bind(this)}>
        <div className="field">
          <label className="label">Title</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value = {this.state.title}
              onChange = {this.handleTitle.bind(this)}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Subtitle</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value = {this.state.subtitle}
              onChange = {this.handleSubtitle.bind(this)}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Image</label>
          <div className="control">
            <input
              className="input"
              type="text"
              placeholder="Enter Image URL"
              onChange = {this.handleImage.bind(this)}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Link</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value = {this.state.link}
              onChange = {this.handleLink.bind(this)}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Author</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value = {this.state.author}
              onChange = {this.handleAuthor.bind(this)}
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

export default UpdateForm
