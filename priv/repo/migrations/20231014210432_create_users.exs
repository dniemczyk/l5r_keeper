defmodule L5rKeeper.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:acct_users) do
      add :email, :string, null: false
      add :name, :string
      add :password_hash, :string
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:acct_users, [:email])
  end
end
