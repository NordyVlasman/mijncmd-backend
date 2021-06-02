defmodule Mijncmd.Repo.Migrations.CreatePostProducts do
  use Ecto.Migration

  def change do
    create table(:post_products) do
      add :position, :integer
      add :post_id, references(:posts, on_delete: :delete_all)
      add :product_id, references(:products, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:post_products, [:post_id, :product_id], name: :post_id_product_id)
  end
end
