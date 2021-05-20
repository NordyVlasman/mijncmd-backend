defmodule MijncmdWeb.Mutations.Post do
  alias Mijncmd.{
    Posts.CreatePost
  }

  def create_post(args, %{context: %{current_user: user}}) do
    with {:ok, %{post: post}} <- CreatePost.perform(user, args) do
      {:ok, %{success: true, post: post, errors: []}}
    else
      {:error, :post, changeset, _} ->
        {:ok, %{success: false, post: nil, errors: changeset}}
      err ->
        err
    end
  end
end
