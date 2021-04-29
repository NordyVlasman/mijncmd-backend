defmodule Mijncmd.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :guid, :string

      add :title, :string, null: false
      add :slug, :string, null: false

      add :cover, :string

      add :description, :text
      add :body, :text

      add :published, :boolean, default: false
      add :published_at, :naive_datetime

      add :author_id, references(:users), on_delete: :nilify_all

      timestamps()
    end

    create index(:posts, [:author_id])
    create unique_index(:posts, [:slug])
  end
end
