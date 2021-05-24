defmodule Mijncmd.GraphQL.Types.Skill do
  use Absinthe.Schema.Notation

  object :skill do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:slug, non_null(:string))
    field(:description, :string)
  end
end
