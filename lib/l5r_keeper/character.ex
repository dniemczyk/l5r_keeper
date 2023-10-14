defmodule L5rKeeper.Character do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name)a
  @optional_fields ~w(description)a

  schema "characters" do
    field :name, :string
    field :description, :string
    field :user_id, :id

    belongs_to :users, L5rKeeper.User

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
