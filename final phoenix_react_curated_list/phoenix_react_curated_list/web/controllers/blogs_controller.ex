defmodule PhoenixReactCuratedList.BlogsController do
  use PhoenixReactCuratedList.Web, :controller

  alias PhoenixReactCuratedList.Blogs

  def index(conn, _params) do
    blogs = Repo.all(Blogs)
    render conn, "index.json", blogs: blogs
  end

  def create(conn, %{"blogs" => blogs_params}) do
    changeset = Blogs.changeset(%Blogs{}, blogs_params)

    case Repo.insert(changeset) do
      {:ok, _blogs} ->
        blogs = Repo.all(Blogs)
        render conn, "index.json", blogs: blogs
    end
  end

  def show(conn, %{"id" => id}) do
    blog = Repo.get(Blogs, id)
    render conn, "show.json", blog: blog
  end

  def delete(conn, %{"id" => id}) do
    blog = Repo.get(Blogs, id)
    Repo.delete(blog)
    blogs = Repo.all(Blogs)
    render conn, "index.json", blogs: blogs
  end

  def update(conn, %{"id" => id, "blogs" => blogs_params}) do
    blog = Repo.get(Blogs, id)
    changeset = Blogs.changeset(blog, blogs_params)

    case Repo.update(changeset) do
      {:ok, _blog} ->
        blog = Repo.get(Blogs, id)
        render conn, "show.json", blog: blog
    end
  end

end
