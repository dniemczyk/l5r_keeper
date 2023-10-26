defmodule L5rKeeper.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(email)a
  @optional_fields ~w(name is_admin)a

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :is_admin, :boolean, default: false

    has_many :characters, L5rKeeper.Character

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
