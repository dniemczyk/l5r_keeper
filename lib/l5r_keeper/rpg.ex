defmodule L5rKeeper.RPG do
  @moduledoc """
  The RPG (Role Playing Game) context.
  """

  alias L5rKeeper.Repo
  alias L5rKeeper.RPG.Character

  def get_character(id) do
    Repo.get(Character, id)
  end

  def get_character!(id) do
    Repo.get!(Character, id)
  end
end
