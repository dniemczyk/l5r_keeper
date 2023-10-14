defmodule L5rKeeper.Character do
  use Ecto.Schema
  import Ecto.Changeset

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
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
