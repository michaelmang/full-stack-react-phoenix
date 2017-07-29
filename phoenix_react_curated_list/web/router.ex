defmodule PhoenixReactCuratedList.Router do
  use PhoenixReactCuratedList.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixReactCuratedList do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/blogs", BlogsController, :index
    post "/blogs", BlogsController, :create
    get "/blogs/:id", BlogsController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixReactCuratedList do
  #   pipe_through :api
  # end
end
