# defmodule Mijncmd.FeedItem do
#   use Mijncmd.Schema, default_sort: :published_at

#   require Logger

#   alias Mijncmd.{
#     Post,
#     Accounts.User,
#     FeedItemComment,
#     FeedItemSkill,
#     Regexp
#   }

#   defenum(Status, declined: -1, draft: 0, queued: 1, submitted: 2, published: 3)
#   defenum(Type, link: 0)

#   schema "feed_items" do
#     field :status, Status, default: :draft
#     field :type, Type

#     field :url, :string
#     field :headline, :string
#     field :story, :string
#     field :object_id, :string
#     field :object, :map, virtual: true

#     field :feed_only, :boolean, default: false
#     field :pinned, :boolean, default: false

#     field :published_at, :utc_datetime
#     field :refreshed_at, :utc_datetime

#     field :impression_count, :integer, default: 0
#     field :click_count, :integer, default: 0

#     field :decline_message, :string, default: ""

#     belongs_to :author, User
#     belongs_to :logger, User
#     belongs_to :submitter, User

#     has_many :feed_item_skills, FeedItemSkill,
#       foreign_key: :item_id,
#       on_delete: :delete_all,
#       on_replace: :delete

#     has_many :skills, through: [:feed_item_skills, :skill]
#     has_many :comments, FeedItemComment, foreign_key: :item_id, on_delete: :delete_all

#     timestamps()
#   end

#   def insert_changeset(item, attrs \\ %{}) do
#     item
#     |> cast(
#       attrs,
#       ~w(status type url headline story pinned published_at author_id logger_id submitter_id object_id source_id)a
#     )
#     |> validate_required([:type, :url, :headline, :logger_id])
#     |> validate_format(:url, Regexp.http(), message: Regexp.http_message())
#     |> foreign_key_constraint(:author_id)
#     |> foreign_key_constraint(:logger_id)
#     |> foreign_key_constraint(:source_id)
#     |> cast_assoc(:feed_item_topics)
#   end

#   def feed_only(query \\ __MODULE__), do: from(q in query, where: q.feed_only)
#   def non_feed_only(query \\ __MODULE__), do: from(q in query, where: not q.feed_only)

#   def declined(query \\ __MODULE__), do: from(q in query, where: q.status == ^:declined)
#   def drafted(query \\ __MODULE__), do: from(q in query, where: q.status == ^:draft)

#   def with_post(query \\ __MODULE__, post),
#     do: from(q in query, where: q.object_id == ^"posts:#{post.slug}")

#   def load_object(item) do
#     object =
#       case item.type do
#         :link -> get_post_object(item.object_id)
#       end

#     load_object(item, object)
#   end

#   def load_object(nil, _object), do: nil
#   def load_object(item, object), do: Map.put(item, :object, object)

#   defp get_post_object(object_id) when is_nil(object_id), do: nil

#   defp get_post_object(object_id) do
#     [_, slug] = String.split(object_id, ":")

#     Post.published()
#     |> Post.preload_all()
#     |> Repo.get_by!(slug: slug)
#   end

#   def preload_skills(query = %Ecto.Query{}) do
#     query
#     |> Ecto.Query.preload(feed_item_skills: ^FeedItemSkill.by_position())
#     |> Ecto.Query.preload(:skills)
#   end

#   def preload_skills(item) do
#     item
#     |> Repo.preload(feed_item_skills: {FeedItemSkill.by_position(), :skill})
#     |> Repo.preload(:skills)
#   end
# end
