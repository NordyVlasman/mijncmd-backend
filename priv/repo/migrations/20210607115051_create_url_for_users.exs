defmodule Mijncmd.Repo.Migrations.CreateUrlForUsers do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :url, :string
      add :for, :string

      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:urls, [:user_id], name: :user_id)
  end
end
