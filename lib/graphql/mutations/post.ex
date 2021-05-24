defmodule Mijncmd.GraphQL.Mutations.Post do
  use Absinthe.Schema.Notation

  alias Mijncmd.GraphQL.Resolvers.Post, as: PostResolver

  object :post_mutations do
    field :create_post, :mutated_post do
      arg(:title, non_null(:string))
      arg(:slug, non_null(:string))
      arg(:description, :string)
      arg(:body, non_null(:string))
      arg(:cover, :upload)

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
  end
end
