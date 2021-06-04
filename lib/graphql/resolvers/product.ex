defmodule Mijncmd.GraphQL.Resolvers.Product do
  require Ecto.Query

  alias Mijncmd.{
    Product,
    Repo
  }

  def get_products(_, params, info) do
    products =
      Product
      |> Repo.all()

    {:ok, products}
  end
end
