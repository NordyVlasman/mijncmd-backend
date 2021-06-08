defmodule Mijncmd.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:users) do
      add :name, :string, null: false
      add :email, :citext, null: false
      add :title, :string, null: false
      add :handle, :string, null: false

      add :avatar, :string

      add :hashed_password, :string, null: false

      add :confirmed_at, :naive_datetime
      add :role, :string
      timestamps()
    end

    create unique_index(:users, [:email])

    create table(:auth_access_tokens) do
      add(:token, :string)
      add(:user_id, references(:users))

      add(:revoked_at, :utc_datetime)

      timestamps()
    end

    create(index(:auth_access_tokens, [:token]))
  end
end
