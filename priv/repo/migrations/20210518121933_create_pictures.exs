defmodule Mijncmd.Repo.Migrations.CreatePictures do
  use Ecto.Migration

  def change do
    create table(:create_pictures) do
      add :name, :string
      add :image, :string

      timestamps()
    end
  end
end
