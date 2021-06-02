defmodule Mijncmd.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :slug, :string, null: false
      add :description, :text

      add :product_image, :string

      timestamps()
    end

    create index(:products, [:name])
    create unique_index(:products, [:slug])
  end
end
