defmodule PhoenixCuratedList.BlogsTest do
  use PhoenixCuratedList.ModelCase

  alias PhoenixCuratedList.Blogs

  @valid_attrs %{author: "some content", image: "some content", link: "some content", subtitle: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Blogs.changeset(%Blogs{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Blogs.changeset(%Blogs{}, @invalid_attrs)
    refute changeset.valid?
  end
end
