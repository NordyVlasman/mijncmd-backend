defmodule Mijncmd.PostFeedItem do
  use Mijncmd.Schema

  alias Mijncmd.{Post, FeedItem}

  def insert(post, logger) do
    %FeedItem{
      type: :link,
      object_id: Post.object_id(post),
      headline: post.title,
      story: post.description,
      published_at: post.published_at,
      logger_id: logger.id,
      author_id: post.author_id,
      feed_item_skills: post_skills(post)
    }
    |> FeedItem.insert_changeset()
    |> Repo.insert!()
  end

  def update(post) do
    if item = Post.get_feed_item() do
      item
      |> FeedItem.preload_skills()
      |> change(%{
        headline: post.title,
        story: post.description,
        feed_item_skills: post_skills(post)
      })
      |> Repo.update!()
    end
  end

  defp post_skills(post) do
    post
    |> Post.preload_skills()
    |> Map.get(:post_skills)
    |> Enum.map(fn t -> Map.take(t, [:skill_id, :position]) end)
  end
end
