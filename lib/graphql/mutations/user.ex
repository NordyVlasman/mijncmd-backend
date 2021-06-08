defmodule Mijncmd.GraphQL.Mutations.User do
  use Absinthe.Schema.Notation

  alias Mijncmd.GraphQL.Resolvers.User, as: UserResolver

  object :user_mutations do
    field :register, :mutated_user do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      arg(:name, non_null(:string))
      arg(:title, non_null(:string))
      arg(:role, non_null(:role))
      arg(:handle, :string)
      arg(:avatar, :upload)

      resolve(&UserResolver.create/3)
    end

    field :login, :mutated_user_with_access_token do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&UserResolver.login/2)
    end

    field :add_skill, :mutated_user do
      arg(:skills, list_of(:id))

      resolve(&UserResolver.add_skill/3)
    end
  end
end
