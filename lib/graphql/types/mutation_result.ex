defmodule Mijncmd.GraphQL.Types.MutationResult do
  use Absinthe.Schema.Notation

  object :mutated_user do
    field(:user, :user)
    field(:errors, list_of(:string))
  end

  object :mutated_post do
    field(:post, :post)
    field(:errors, list_of(:string))
  end

  object :mutated_user_with_access_token do
    field(:user, :user)
    field(:access_token, :string)
    field(:errors, list_of(:string))
  end
end
