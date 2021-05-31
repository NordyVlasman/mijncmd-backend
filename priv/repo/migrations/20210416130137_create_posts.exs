defmodule Mijncmd.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :slug, :string, null: false
      add :body, :text

      add :cover, :string

      add :likes_count, :integer, default: 0
      add :view_count, :integer, default: 0

      add :published, :boolean, default: false
      add :published_at, :naive_datetime

      add :author_id, references(:users), on_delete: :nilify_all
      timestamps()
    end

    create index(:posts, [:author_id])
    create unique_index(:posts, [:slug])
  end
end
