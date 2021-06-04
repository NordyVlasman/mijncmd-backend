defmodule Mijncmd.GraphQL.Types.Product do
  use Absinthe.Schema.Notation

  object :product do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:slug, non_null(:string))
    field(:description, :string)
  end
end
