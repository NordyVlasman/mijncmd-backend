defmodule Mijncmd.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string, null: false
      add :slug, :string, null: false
      add :description, :text

      timestamps()
    end

    create index(:skills, [:name])
    create unique_index(:skills, [:slug])
  end
end
