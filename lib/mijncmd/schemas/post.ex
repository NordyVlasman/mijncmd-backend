defmodule Mijncmd.Post do
  use Mijncmd.Schema
  use Arc.Ecto.Schema

  alias Mijncmd.{
    User,
    Files.Image,
    PostSkill,
    PostProduct,
    Repo
  }

  schema "posts" do
    field(:title, :string)
    field(:slug, :string)

    field(:cover, Image.Type)
    field(:body, :string)

    has_many(:post_skills, PostSkill, on_delete: :delete_all)
    has_many(:skills, through: [:post_skills, :skill])

    has_many(:post_products, PostProduct, on_delete: :delete_all)
    has_many(:products, through: [:post_products, :product])

    has_many(:likes, {"post_likes", Mijncmd.PostLike})
    has_many(:comments, {"post_comments", Mijncmd.PostComment})

    field(:likes_count, :integer, default: 0)

    belongs_to(:author, User)

    timestamps()
  end

  @required_fields ~w(title slug author_id body)a
  @optional_fields ~w(cover likes_count)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> cast_attachments(params, [:cover])
    |> validate_required(@required_fields)
    |> unique_constraint(:slug)
    |> foreign_key_constraint(:author_id)
    |> cast_assoc(:post_skills)
  end

  def update_changeset(model, params) do
    model
    |> cast(params, @optional_fields ++ @required_fields)
  end

  ## Functions
  def map_post_cover_url(post) do
    if post.cover do
      cover_url = Image.url({post.cover, post}, :original, signed: true)
      Map.merge(post, %{cover_url: cover_url})
    else
      post
    end
  end
  ## Preloading
  def preload_author(%Ecto.Query{} = query), do: Ecto.Query.preload(query, :author)
  def preload_author(post), do: Repo.preload(post, :author)

  def preload_skills(%Ecto.Query{} = query), do: Ecto.Query.preload(query, :skills)
  def preload_skills(post), do: Repo.preload(post, :skills)

  def preload_products(%Ecto.Query{} = query), do: Ecto.Query.preload(query, :products)
  def preload_products(post), do: Repo.preload(post, :products)

  def preload_comments(%Ecto.Query{} = query), do: Ecto.Query.preload(query, :comments)
  def preload_comments(post), do: Repo.preload(post, :comments)
end
