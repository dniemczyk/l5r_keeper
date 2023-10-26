defmodule L5rKeeperWeb.UserController do
  use L5rKeeperWeb, :controller

  alias L5rKeeper.Accounts

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, "show.html", [id: id, user: user])
  end
end
