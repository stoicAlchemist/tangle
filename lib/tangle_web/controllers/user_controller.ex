defmodule TangleWeb.UserController do
  use TangleWeb, :controller

  alias Tangle.Accounts
  alias Tangle.Accounts.User
  alias Tangle.Repo

  import TangleWeb.UserAuth, only: [require_authenticated_user: 2]

  plug :require_authenticated_user

  def index(conn, _params) do
    users = Accounts.get_all_users
    render(conn, "index.html", users: users)
  end
end
