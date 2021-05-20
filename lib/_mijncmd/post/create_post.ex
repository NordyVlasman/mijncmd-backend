# defmodule Mijncmd.Posts.CreatePost do
#   @moduledoc false

#   alias Ecto.Multi

#   alias Mijncmd.{
#     Repo,
#     Post,
#     Accounts.User
#   }

#   def perform(%User{} = author, params) do
#     Multi.new()
#     |> insert_post(author, params)
#     |> Repo.transaction()
#   end

#   defp insert_post(multi, %User{} = author, params) do
#     params_with_relations =
#       params
#       |> Map.put(:author_id, author.id)
#     Multi.insert(multi, :post, Post.user_changeset(%Post{}, params_with_relations))
#   end
# end
