defmodule Mijncmd.Repo.Migrations.CreatePostComments do
  use Ecto.Migration

  def change do
    create table(:post_comments) do
      add :content, :text, null: false
      add :author_id, references(:users)
      add :post_id, references(:posts)
      add :parent_id, references(:post_comments)
      add :edited_at, :naive_datetime
      add :deleted_at, :naive_datetime

      add :upvote_count, :integer, default: 0

      timestamps()
    end

    create index(:post_comments, [:author_id])
    create index(:post_comments, [:post_id])
    create index(:post_comments, [:parent_id])
  end
end
