defmodule Mijncmd.GraphQL.Types.User do
  use Absinthe.Schema.Notation

  import Mijncmd.GraphQL.Helpers.Fields

  alias Mijncmd.{
    User
  }

  object :user do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:title, :string)
    field(:email, :string)
    field(:handle, :string)

    field(:role, :role)

    field :avatar_url, :string do
      resolve(fn user, _, _ ->
        user = User.map_user_avatar_url(user)
        {:ok, user.avatar_url}
      end)
    end

    field :skills, list_of(:skill) do
      resolve(fn user, _, _ ->
        user = user
        |> User.preload_skills()
        {:ok, user.skills}
      end)
    end
  end
end
