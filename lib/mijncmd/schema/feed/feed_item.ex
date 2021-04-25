defmodule Mijncmd.FeedItem do
  use Mijncmd.Schema, default_sort: :published_at

  require Logger

  alias Mijncmd.{
    Post
  }

  defenum(Status, declined: -1, draft: 0, queued: 1, submitted: 2, published: 3)
  defenum(Type, link: 0)

  schema "feed_items" do
    field :status, Status, default: :draft
    field :type, Type

    field :url, :string
    field :headline, :string
    field :story, :string
    field :object_id, :string
    field :object, :map, virtual: true
  end
end
