defmodule Mijncmd.Post do
  use Mijncmd.Schema, default_sort: :published_at

  alias Mijncmd.{
    Files,
    Accounts.User,
    Regexp,
    PostSkill,
    FeedItem
  }

  schema "posts" do
    field :title, :string
    # field :subtitle, :string

    field :slug, :string
    field :guid, :string

    # field :image, Files.Image.Type

    field :body, :string
    field :description, :string

    field :published, :boolean, default: false
    field :published_at, :utc_datetime

    belongs_to :author, User

    has_many :post_skills, PostSkill, on_delete: :delete_all
    has_many :skills, through: [:post_skills, :skill]

    field :feed_item, :map, virtual: true

    timestamps()
  end

  def file_changeset(post, attrs \\ %{}),
    do: cast_attachments(post, attrs, [:image], allow_urls: true)

  def insert_changeset(post, attrs \\ %{}) do
    post
    |> cast(
      attrs,
      ~w(title subtitle slug description author_id published published_at body)a
    )
    |> validate_required([:title, :author_id])
    |> validate_format(:slug, Regexp.slug(), message: Regexp.slug_message())
    |> unique_constraint(:slug)
    |> foreign_key_constraint(:author_id)
    |> validate_published_has_published_at()
    |> cast_assoc(:post_skills)
  end

  def update_changeset(post, attrs \\ %{}) do
    post
    |> insert_changeset(attrs)
    |> file_changeset(attrs)
  end

  def user_changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [
      :author_id,
      :title,
      :slug,
      :description,
      :body
    ])
    |> validate_required([:body])
  end

  def published(query \\ __MODULE__),
    do: from(q in query, where: q.published, where: q.published_at <= ^Timex.now())

  def preload_all(post) do
    post
    |> preload_author()
    |> preload_skills()
  end

  @spec preload_author(nil | [%{optional(atom) => any}] | map) ::
          nil | [%{optional(atom) => any}] | %{optional(atom) => any}
  def preload_author(query = %Ecto.Query{}), do: Ecto.Query.preload(query, :author)
  def preload_author(post), do: Repo.preload(post, :author)

  def preload_skills(query = %Ecto.Query{}), do: Ecto.Query.preload(query, :skills)
  def preload_skills(post), do: Repo.preload(post, :skills)

  def get_feed_item(post) do
    post
    |> FeedItem.with_post()
    |> Repo.one()
  end

  def load_feed_item(post) do
    item = post |> get_feed_item() |> FeedItem.load_object(post)
    Map.put(post, :feed_item, item)
  end

  def object_id(post), do: "posts:#{post.slug}"

  defp validate_published_has_published_at(changeset) do
    published = get_field(changeset, :published)
    published_at = get_field(changeset, :published_at)

    if published && is_nil(published_at) do
      add_error(changeset, :published_at, "can't be blank when published")
    else
      changeset
    end
  end
end
