defmodule TangleWeb.PageController do
  use TangleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
