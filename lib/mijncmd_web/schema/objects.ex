defmodule MijncmdWeb.Schema.Objects do
  @moduledoc false

  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias MijncmdWeb.{
    Data
  }

  object :session do
    field :token, :string
    field :user, :user
  end

  # Skills
  object :skill do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :slug, non_null(:string)
    field :description, :string
  end

  object :user_skill do
    field :skill_id, :id
    field :user_id, :id
  end

  # User
  object :user do
    field :id, :id

    field :email, :string
    field :name, :string
    field :avatar, :string

    field :website_url, :string
    field :github_url, :string
    field :dribbble_url, :string
  end

  object :post do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :slug, non_null(:string)
    field :description, non_null(:string)
    field :body, :string

    field :skills, list_of(:skill), resolve: dataloader(Data)
    field :author, non_null(:user), resolve: dataloader(Data)
  end
end
