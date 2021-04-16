defmodule Mijncmd.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :body, :text

      add :user_id, references(:users), on_delete: :nilify_all
      add(
        :thread_id,
        references(:threads, type: :binary_id, on_delete: :delete_all)
      )

      timestamps()
    end

    create(index(:posts, [:thread_id]))
    create(index(:posts, [:user_id]))
  end
end
