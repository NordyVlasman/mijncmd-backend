defmodule MijncmdWeb.Schema.PostTypes do
    use Absinthe.Schema.Notation

    alias MijncmdWeb.Resolvers

    @desc "A post"
    object :post do
      field :title, :string
    end
end
