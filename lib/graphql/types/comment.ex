defmodule Mijncmd.GraphQL.Types.Comment do
  use Absinthe.Schema.Notation

  object :comment do
    field(:id, :id)
    field(:content, :string)

    field :author, :user do
      resolve(fn comment, _, _ ->
        comment = Mijncmd.PostComment.with_author(comment)
        {:ok, comment.author}
      end)
    end

    field :children, list_of(:comment) do
      resolve(fn comment, _, _ ->
        children = Mijncmd.PostComment.preload_children(comment)
        {:ok, children}
      end)
    end
  end
end
