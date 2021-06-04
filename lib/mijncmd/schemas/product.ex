defmodule Mijncmd.Product do
  use Mijncmd.Schema

  alias Mijncmd.{
    Helpers.Regexp
  }

  schema "products" do
    field(:name, :string)
    field(:slug, :string)
    field(:description, :string)
    field(:product_image, :string)

    has_many(:post_products, PostProduct, on_delete: :delete_all)
    has_many(:posts, through: [:post_products, :post])

    timestamps()
  end

  @required_fields ~w(name slug product_image)a
  @optional_fields ~w(description)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:slug, Regexp.slug(), message: Regexp.slug_message())
    |> unique_constraint(:slug)
  end
end
