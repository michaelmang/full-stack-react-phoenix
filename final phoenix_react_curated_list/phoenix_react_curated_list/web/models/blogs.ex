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

  def changeset(struct, params) do
    struct
    |> cast(params, [:title, :subtitle, :image, :link, :author])
    |> validate_required([:title, :subtitle, :image, :link, :author])
  end

end
