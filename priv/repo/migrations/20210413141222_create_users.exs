defmodule Mijncmd.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:users) do
      add :name, :string, null: false
      add :email, :citext, null: false
      add :handle, :string, null: false

      add :avatar, :string

      add :website_url, :string, null: true
      add :github_url, :string, null: true
      add :dribbble_url, :string, null: true

      add :hashed_password, :string, null: false

      add :confirmed_at, :naive_datetime

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
