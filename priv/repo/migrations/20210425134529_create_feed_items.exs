defmodule Mijncmd.Repo.Migrations.CreateFeedItems do
  use Ecto.Migration

  def change do
    create table(:feed_items) do
      add :status, :integer, null: false, default: 0
      add :type, :integer, null: false, default: 0
      add :headline, :string, null: false
      add :url, :string, null: false
      add :published_at, :naive_datetime
      add :digest, :boolean, default: true
      add :story, :text
      add :image, :string
      add :author_id, references(:users)

      timestamps()
    end

    create index(:feed_items, [:author_id])
    create index(:feed_items, [:status])
    create index(:feed_items, [:type])
  end

end
