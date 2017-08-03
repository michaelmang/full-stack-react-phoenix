defmodule PhoenixUserAuthentication.UsersController do
  use PhoenixUserAuthentication.Web, :controller

  alias PhoenixUserAuthentication.Users

  def index(conn, _params) do
    users = Repo.all(Users)
    render conn, "index.json", users: users
  end

  def create(conn, %{"users" => users_params}) do
    changeset = Users.changeset(%Users{}, users_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        new_conn = Guardian.Plug.api_sign_in(conn, user, :access)
        jwt = Guardian.Plug.current_token(new_conn)

        new_conn
        |> put_status(:created)
        |> render(PhoenixUserAuthentication.SessionsView, "show.json", user: user, jwt: jwt)
    end
  end

end
