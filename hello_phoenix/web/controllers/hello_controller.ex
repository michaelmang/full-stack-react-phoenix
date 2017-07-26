defmodule HelloPhoenix.HelloController do
  use HelloPhoenix.Web, :controller

  def message(conn, %{"data" => data}) do
    render conn, "hello.html", data: data
  end
end
