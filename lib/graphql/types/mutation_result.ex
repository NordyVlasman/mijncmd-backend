defmodule Mijncmd.GraphQL.Types.MutationResult do
  use Absinthe.Schema.Notation

  object :mutated_user do
    field(:user, :user)
    field(:errors, list_of(:string))
  end
end