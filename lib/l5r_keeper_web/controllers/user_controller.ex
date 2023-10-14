defmodule L5rKeeperWeb.UserController do
  use L5rKeeperWeb, :controller

  alias L5rKeeper.User

  def show(conn, %{"id" => id}) do
    user = %{email: "test@test.com", name: "Test_User"}
    render(conn, "show.html", [id: id, user: user])
  end
end
