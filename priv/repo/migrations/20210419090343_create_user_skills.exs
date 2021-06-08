defmodule Mijncmd.Repo.Migrations.CreateUserSkills do
  use Ecto.Migration

  def change do
    create table(:user_skills) do
      add :position, :integer
      add :user_id, references(:users, on_delete: :delete_all)
      add :skill_id, references(:skills, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:user_skills, [:user_id, :skill_id], name: :user_id_skill_id)
  end
end
