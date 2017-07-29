defmodule PhoenixReactCuratedList.Blogs do
  use PhoenixReactCuratedList.Web, :model
  schema "blogs" do
    field :title, :string
    field :subtitle, :string
    field :image, :string
    field :link, :string
    field :author, :string
    timestamps()
  end

end
