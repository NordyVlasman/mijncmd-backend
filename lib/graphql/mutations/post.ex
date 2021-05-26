defmodule Mijncmd.GraphQL.Mutations.Post do
  use Absinthe.Schema.Notation

  alias Mijncmd.GraphQL.Resolvers.Post, as: PostResolver
  alias Mijncmd.GraphQL.Resolvers.PostComment, as: CommentResolver

  object :post_mutations do
    field :create_post, :mutated_post do
      arg(:title, non_null(:string))
      arg(:slug, non_null(:string))
      arg(:description, :string)
      arg(:body, non_null(:string))
      arg(:cover, :upload)
      arg(:skills, list_of(:id))

      resolve(&PostResolver.create_post/3)
    end

    field :like_post, :mutated_post do
      arg(:post_id, non_null(:id))

      resolve(&PostResolver.like_post/3)
    end

    field :dislike_post, :mutated_post do
      arg(:post_id, non_null(:id))

      resolve(&PostResolver.dislike_post/3)
    end

    field :comment_post, :mutated_comment do
      arg(:post_id, non_null(:id))
      arg(:content, non_null(:string))
      arg(:parent_id, :id)

      resolve(&CommentResolver.create_post_comment/3)
    end
  end
end
