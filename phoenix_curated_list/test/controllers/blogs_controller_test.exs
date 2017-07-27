defmodule PhoenixCuratedList.BlogsControllerTest do
  use PhoenixCuratedList.ConnCase

  alias PhoenixCuratedList.Blogs
  @valid_attrs %{author: "some content", image: "some content", link: "some content", subtitle: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, blogs_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing blogs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, blogs_path(conn, :new)
    assert html_response(conn, 200) =~ "New blogs"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, blogs_path(conn, :create), blogs: @valid_attrs
    assert redirected_to(conn) == blogs_path(conn, :index)
    assert Repo.get_by(Blogs, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, blogs_path(conn, :create), blogs: @invalid_attrs
    assert html_response(conn, 200) =~ "New blogs"
  end

  test "shows chosen resource", %{conn: conn} do
    blogs = Repo.insert! %Blogs{}
    conn = get conn, blogs_path(conn, :show, blogs)
    assert html_response(conn, 200) =~ "Show blogs"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, blogs_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    blogs = Repo.insert! %Blogs{}
    conn = get conn, blogs_path(conn, :edit, blogs)
    assert html_response(conn, 200) =~ "Edit blogs"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    blogs = Repo.insert! %Blogs{}
    conn = put conn, blogs_path(conn, :update, blogs), blogs: @valid_attrs
    assert redirected_to(conn) == blogs_path(conn, :show, blogs)
    assert Repo.get_by(Blogs, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    blogs = Repo.insert! %Blogs{}
    conn = put conn, blogs_path(conn, :update, blogs), blogs: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit blogs"
  end

  test "deletes chosen resource", %{conn: conn} do
    blogs = Repo.insert! %Blogs{}
    conn = delete conn, blogs_path(conn, :delete, blogs)
    assert redirected_to(conn) == blogs_path(conn, :index)
    refute Repo.get(Blogs, blogs.id)
  end
end
