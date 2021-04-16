defmodule Mijncmd.Repo.Migrations.CreateThreads do
  use Ecto.Migration

  def change do
    create table(:threads, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:title, :string)

      add(
        :skill_id,
        references(:skills, type: :binary_id, on_delete: :delete_all)
      )

      timestamps()
    end

    create(index(:threads, [:skill_id]))
  end
end
