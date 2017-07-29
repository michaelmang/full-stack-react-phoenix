import React from "react";
import BlogCard from '../presentationals/BlogCard';
import axios from "axios";

class Blogs extends React.Component {
  constructor() {
    super();
    this.state = { blogs: [] };
  }

  componentWillMount() {
    axios.get('http://localhost:4000/blogs')
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
      {posts}
      </div>
    )
  }
}

export default Blogs
