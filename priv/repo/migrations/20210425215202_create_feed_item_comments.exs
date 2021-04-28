defmodule Mijncmd.Repo.Migrations.CreateFeedItemComments do
  use Ecto.Migration

  def change do
    create table(:feed_item_comments) do
      add :content, :text, null: false
      add :author_id, references(:users)
      add :item_id, references(:feed_items)
      add :parent_id, references(:feed_item_comments)
      add :edited_at, :naive_datetime
      add :deleted_at, :naive_datetime
      timestamps()
    end

    create index(:feed_item_comments, [:author_id])
    create index(:feed_item_comments, [:item_id])
    create index(:feed_item_comments, [:parent_id])
  end
end
