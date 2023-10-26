defmodule L5rKeeper.Accounts do
  @moduledoc """
  The Accounts context.
  """

  alias L5rKeeper.Repo
  alias L5rKeeper.Accounts.User

  def get_user(id) do
    Repo.get(User, id)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end
end
