defmodule Mijncmd.GraphQL.Resolvers.Product do
  require Ecto.Query

  alias Mijncmd.{
    Product,
    ProductCreate,
    Repo
  }

  def get_products(_, params, info) do
    products =
      Product
      |> Repo.all()

    {:ok, products}
  end

  def create_product(_, params, info) do
    user = info.context[:conn].assigns[:current_user]
    case ProductCreate.create(user, params) do
      {:ok, product} ->
        {:ok, %{product: product, errors: nil}}
      {:error, _reason} ->
        {:ok, %{product: nil, errors: ["Failed"]}}
    end
  end
end
