defmodule Mijncmd.Repo.Migrations.CreatePostSkills do
  use Ecto.Migration

  def change do
    create table(:post_skills) do
      add :post_id, references(:posts, on_delete: :delete_all)
      add :skill_id, references(:skills, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:post_skills, [:post_id, :skill_id], name: :post_id_skill_id)
  end
end
