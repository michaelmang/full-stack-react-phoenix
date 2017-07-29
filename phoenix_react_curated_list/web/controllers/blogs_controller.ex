defmodule PhoenixReactCuratedList.BlogsController do
  use PhoenixReactCuratedList.Web, :controller

  alias PhoenixReactCuratedList.Blogs

  def index(conn, _params) do
    blogs = Repo.all(Blogs)
    render conn, "index.json", blogs: blogs
  end

  def create(conn, %{"blogs" => blogs_params}) do

  end

  def show(conn, %{"id" => id}) do

  end

end
