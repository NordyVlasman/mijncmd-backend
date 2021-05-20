defmodule Mijncmd.GraphQL.Types.Post do
  use Absinthe.Schema.Notation

  alias Mijncmd.{
    Post
  }

  object :post do
    field(:id, non_null(:id))
    field(:title, non_null(:string))
  end
end
