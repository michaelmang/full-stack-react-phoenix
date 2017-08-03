defmodule PhoenixUserAuthentication.Users do
  use PhoenixUserAuthentication.Web, :model
  schema "users" do
    field :username, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
    |> validate_length(:password, min: 6, max: 100)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end

end
