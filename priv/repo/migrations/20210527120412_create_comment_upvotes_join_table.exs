defmodule Mijncmd.Repo.Migrations.CreatePostUpvotesJoinTable do
  use Ecto.Migration

  def change do
    create table(:comment_upvotes, primary_key: false) do
      add :comment_id, references(:posts)
      add :user_id, references(:users)
    end
  end
end
