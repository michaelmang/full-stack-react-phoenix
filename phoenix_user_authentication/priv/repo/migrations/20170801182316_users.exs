defmodule PhoenixUserAuthentication.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :password_hash, :string, null: false
      timestamps()
    end
  end

end
