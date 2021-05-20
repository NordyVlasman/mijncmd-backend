defmodule Mijncmd.GraphQL.Resolvers.Post do
  require Ecto.Query

  alias Mijncmd.{
    PostCreate
  }

  def create_post(_, params, info) do
    user = info.context[:conn].assigns[:current_user]
    case PostCreate.create(user, params) do
      {:ok, post} ->
        {:ok, %{post: post, errors: nil}}
      {:error, _reason} ->
        {:ok, %{post: nil, errors: ["Failed"]}}
    end
  end
end
