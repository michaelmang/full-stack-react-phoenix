defmodule Helloreact.PageController do
  use Helloreact.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
