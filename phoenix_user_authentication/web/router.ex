defmodule PhoenixUserAuthentication.Router do
  use PhoenixUserAuthentication.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", PhoenixUserAuthentication do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", PhoenixUserAuthentication do
    pipe_through :api

    post "/sessions", SessionsController, :create
    delete "/sessions", SessionsController, :delete

    get "/users", UsersController, :index
    post "/users", UsersController, :create

  end
end
