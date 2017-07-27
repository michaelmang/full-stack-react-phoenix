defmodule PhoenixCuratedList.BlogsController do
  use PhoenixCuratedList.Web, :controller

  alias PhoenixCuratedList.Blogs

  def index(conn, _params) do
    blogs = Repo.all(Blogs)
    render(conn, "index.html", blogs: blogs)
  end

  def new(conn, _params) do
    changeset = Blogs.changeset(%Blogs{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blogs" => blogs_params}) do
    changeset = Blogs.changeset(%Blogs{}, blogs_params)

    case Repo.insert(changeset) do
      {:ok, _blogs} ->
        conn
        |> put_flash(:info, "Blogs created successfully.")
        |> redirect(to: blogs_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    blogs = Repo.get!(Blogs, id)
    render(conn, "show.html", blogs: blogs)
  end

  def edit(conn, %{"id" => id}) do
    blogs = Repo.get!(Blogs, id)
    changeset = Blogs.changeset(blogs)
    render(conn, "edit.html", blogs: blogs, changeset: changeset)
  end

  def update(conn, %{"id" => id, "blogs" => blogs_params}) do
    blogs = Repo.get!(Blogs, id)
    changeset = Blogs.changeset(blogs, blogs_params)

    case Repo.update(changeset) do
      {:ok, blogs} ->
        conn
        |> put_flash(:info, "Blogs updated successfully.")
        |> redirect(to: blogs_path(conn, :show, blogs))
      {:error, changeset} ->
        render(conn, "edit.html", blogs: blogs, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    blogs = Repo.get!(Blogs, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(blogs)

    conn
    |> put_flash(:info, "Blogs deleted successfully.")
    |> redirect(to: blogs_path(conn, :index))
  end
end
