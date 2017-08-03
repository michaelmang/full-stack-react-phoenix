defmodule PhoenixUserAuthentication.UsersView do
  use PhoenixUserAuthentication.Web, :view

  #show multiple users
  def render("index.json", %{users: users}) do
    %{
      users: Enum.map(users, &users_json/1)
    }
  end

  def users_json(user) do
    %{
      username: user.username
    }
  end

end
