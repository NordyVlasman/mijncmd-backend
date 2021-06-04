defmodule Mijncmd.PostProduct do
  use Mijncmd.Schema

  alias Mijncmd.{
    Post,
    Product
  }

  schema "post_products" do
    field(:position, :integer)
    field(:delete, :boolean, virtual: true)

    belongs_to(:post, Post)
    belongs_to(:product, Product)

    timestamps()
  end

  @required_fields ~w(product_id post_id)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields)
    |> foreign_key_constraint(:post_id)
    |> foreign_key_constraint(:product_id)
    |> cast_assoc(:product)
  end
end
