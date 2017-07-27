defmodule PhoenixCuratedList.Router do
  use PhoenixCuratedList.Web, :router

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

  scope "/", PhoenixCuratedList do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    resources "/blogs", BlogsController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixCuratedList do
  #   pipe_through :api
  # end
end
