defmodule Mijncmd.Repo.Migrations.CreateFeedItemSkills do
  use Ecto.Migration

  def change do
    create table(:feed_item_skills) do
      add :position, :integer
      add :item_id, references(:feed_items)
      add :skill_id, references(:skills)
      timestamps()
    end

    create index(:feed_item_skills, [:item_id])
    create index(:feed_item_skills, [:skill_id])
    create unique_index(:feed_item_skills, [:item_id, :skill_id])
  end
end
