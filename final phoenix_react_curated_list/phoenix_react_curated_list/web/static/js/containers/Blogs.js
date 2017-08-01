import React from "react";
import BlogCard from '../presentationals/BlogCard';
import axios from "axios";
import { Link } from 'react-router-dom';

class Blogs extends React.Component {
  constructor() {
    super();
    this.state = { blogs: [] };
  }

  componentWillMount() {
    axios.get('http://localhost:4000/api/blogs')
      .then(response => {
        this.setState({ blogs: response.data.blogs });
      })
      .catch(error => {
        console.log(error);
      });
  }

  render() {
    const posts = this.state.blogs.map((blog, index) =>
      <BlogCard
        key = { index }
        title = { blog.title }
        subtitle = { blog.subtitle }
        image = { blog.image }
        link = { blog.link }
        author = { blog.author }
      />
    );
    return (
      <div>
        <div className="is-primary is-large"
          style = {{
            position: "absolute",
            top: "10px",
            right: "10px",
            padding: "10px 15px",
            background: "#00D1B2"
          }}
        >
          <Link
            to="/create"
            style = {{ color: "white" }}
          >
          Create Blog Post
          </Link>
        </div>
        <div className="is-primary is-large"
          style = {{
            position: "absolute",
            top: "80px",
            right: "10px",
            padding: "10px 15px",
            background: "#00D1B2"
          }}
        >
          <Link
            to="/update"
            style = {{ color: "white" }}
          >
          Edit Blog Post
          </Link>
        </div>
      {posts}
      </div>
    )
  }
}

export default Blogs
