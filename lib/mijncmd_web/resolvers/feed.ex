defmodule MijncmdWeb.Resolvers.Feed do
  alias Mijncmd.{
    FeedItem,
    Repo
  }

  def list_feed(_parent, _args, _resolution) do
    feed =
      FeedItem.feed_only()
      |> FeedItem.preload_skills()
      |> Repo.all()
    {:ok, feed}
  end
end
