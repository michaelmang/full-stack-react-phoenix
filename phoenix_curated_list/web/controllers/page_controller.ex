defmodule PhoenixCuratedList.PageController do
  use PhoenixCuratedList.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
