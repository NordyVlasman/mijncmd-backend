defmodule Mijncmd.GraphQL.Types.User do
  use Absinthe.Schema.Notation

  import Mijncmd.GraphQL.Helpers.Fields

  alias Mijncmd.{
    User
  }

  object :user do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:email, :string)
    field(:handle, :string)

    field(:website_url, :string)
    field(:github_url, :string)
    field(:dribbble_url, :string)

    field :avatar_url, :string do
      resolve(fn user, _, _ -> {:ok, User.with_avatar(user)} end)
    end
  end
end
