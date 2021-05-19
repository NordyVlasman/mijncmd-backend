defmodule Mijncmd.GraphQL.Mutations.User do
  use Absinthe.Schema.Notation

  import Mijncmd.GraphQL.Helpers.Authorization

  alias Mijncmd.GraphQL.Resolvers.User, as: UserResolver

  object :user_mutations do
    field :register, :mutated_user do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      arg(:name, non_null(:string))
      arg(:handle, :string)
      arg(:website_url, :string)
      arg(:github_url, :string)
      arg(:dribbble_url, :string)
      arg(:avatar, :upload)

      resolve(&UserResolver.create/3)
    end
  end
end