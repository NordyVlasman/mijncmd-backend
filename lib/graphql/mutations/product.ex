defmodule Mijncmd.GraphQL.Mutations.Product do
  use Absinthe.Schema.Notation

  alias Mijncmd.GraphQL.Resolvers.Product, as: ProductResolver

  object :product_mutations do
    field :create_product, :mutated_product do
      arg(:name, :string)
      arg(:slug, :string)
      arg(:description, :string)

      resolve(&ProductResolver.create_product/3)
    end
  end
end
