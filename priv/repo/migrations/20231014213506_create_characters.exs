defmodule L5rKeeper.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:rpg_characters) do
      add :name, :string
      add :description, :text
      add :user_id, references(:acct_users, on_delete: :nothing)

      timestamps()
    end

    create index(:rpg_characters, [:user_id])
  end
end
