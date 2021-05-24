defmodule Mijncmd.Repo.Migrations.AddPostLikesJoinTable do
  use Ecto.Migration

  def change do
    create table(:post_likes, primary_key: false) do
      add :post_id, references(:posts)
      add :user_id, references(:users)
    end
  end
end
