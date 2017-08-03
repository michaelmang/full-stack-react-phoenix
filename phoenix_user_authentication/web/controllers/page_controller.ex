defmodule PhoenixUserAuthentication.PageController do
  use PhoenixUserAuthentication.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
