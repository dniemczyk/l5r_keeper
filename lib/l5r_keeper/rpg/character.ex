defmodule L5rKeeper.RPG.Character do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name)a
  @optional_fields ~w(description)a

  schema "rpg_characters" do
    field :name, :string
    field :description, :string

    belongs_to :user, L5rKeeper.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
