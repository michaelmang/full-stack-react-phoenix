defmodule PhoenixReactCuratedList.BlogsView do
  use PhoenixReactCuratedList.Web, :view

  def render("index.json", %{blogs: blogs}) do
    %{
      blogs: Enum.map(blogs, &blogs_json/1)
    }
  end

  def blogs_json(blog) do
    %{
      title: blog.title,
      subtitle: blog.subtitle,
      image: blog.image,
      link: blog.link,
      author: blog.author
    }
  end

end
