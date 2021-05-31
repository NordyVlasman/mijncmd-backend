defmodule Mijncmd.GraphQL.Mutations.Comment do
  use Absinthe.Schema.Notation

  alias Mijncmd.GraphQL.Resolvers.PostComment, as: CommentResolver

  object :comment_mutations do
    field :upvote_comment, :mutated_comment do
      arg(:comment_id, non_null(:id))

      resolve(&CommentResolver.upvote_comment/3)
    end
  end
end
