defmodule MijncmdWeb.Schema.PostTypes do
    use Absinthe.Schema.Notation

    alias MijncmdWeb.Resolvers

    @desc "A post"
    object :post do
      field :title, :string
    end

    object :create_post_mutation do
      @desc """
      create post
      """

      @desc "Create a post"
      field :create_post, :post do
        arg(:title, non_null(:string))
        arg(:slug, non_null(:string))
        arg(:description, non_null(:string))
        arg(:body, non_null(:string))
        resolve(&Resolvers.Posts.create_post/3)
      end
    end
end
