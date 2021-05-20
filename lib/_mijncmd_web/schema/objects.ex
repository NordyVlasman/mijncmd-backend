defmodule MijncmdWeb.Schema.Objects do
  @moduledoc false

  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias MijncmdWeb.{
    Data
  }

  object :user_avatar do
    field :file_name, :string
    field :updated_at, :string
  end

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
    field :position, :integer
    field :skill_id, :id
    field :user_id, :id
  end

  object :post_skill do
    field :position, :integer
    field :skill_id, :id
    field :post_id, :id
  end

  object :feed_item_skill do
    field :position, :integer
    field :skill_id, :id
    field :item_id, :id
  end

  # User
  object :user do
    field :id, :id

    field :email, :string
    field :name, :string
    field :handle, :string

    field :avatar_url, :string

    field :website_url, :string
    field :github_url, :string
    field :dribbble_url, :string
  end

  # Posts
  object :post do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :slug, non_null(:string)
    field :description, non_null(:string)
    field :body, :string

    field :cover_url, :string

    field :skills, list_of(:skill), resolve: dataloader(Data)
    field :author, non_null(:user)
  end

  # Feed
  object :feed_item do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :headline, non_null(:string)
    field :story, non_null(:string)

    field :feed_only, non_null(:boolean)
    field :pinned, non_null(:boolean)

    field :author, non_null(:user), resolve: dataloader(Data)
    field :logger, non_null(:user), resolve: dataloader(Data)
    field :submitter, non_null(:user), resolve: dataloader(Data)

    field :skills, list_of(:skill), resolve: dataloader(Data)
    field :comments, list_of(:feed_item_comments), resolve: dataloader(Data)

  end

  object :feed_item_comments do
    field :content, non_null(:string)
    field :author, non_null(:user), resolve: dataloader(Data)
  end
end
