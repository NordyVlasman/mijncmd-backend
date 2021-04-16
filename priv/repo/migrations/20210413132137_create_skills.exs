defmodule Mijncmd.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:title, :string)
      timestamps()
    end

  end
end
