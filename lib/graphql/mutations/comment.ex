defmodule Mijncmd.GraphQL.Mutations.Comment do
  use Absinthe.Schema.Notation

  alias Mijncmd.GraphQL.Resolvers.PostComment, as: CommentResolver

  ## This is a discussion worth. Downvoting a comment can be good.
  ## But it can give some negative aspects, so be careful.
  object :comment_mutations do
    field :upvote_comment, :mutated_comment do
      arg(:comment_id, non_null(:id))

      resolve(&CommentResolver.upvote_comment/3)
    end
  end
end
