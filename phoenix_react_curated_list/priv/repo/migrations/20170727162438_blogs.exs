defmodule PhoenixReactCuratedList.Repo.Migrations.Blogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :subtitle, :string
      add :image, :string
      add :link, :string
      add :author, :string

      timestamps()
    end
  end
end
