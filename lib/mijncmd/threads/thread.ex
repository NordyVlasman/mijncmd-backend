defmodule Mijncmd.Threads.Thread do
  use Ecto.Schema
  import Ecto.Changeset

  alias Mijncmd.{
    Community.Post,
    Skills.Skill
  }

  schema "threads" do
    field(:title, :string)

    belongs_to(:skill, Skill)
    has_many(:posts, Post)

    timestamps()
  end

  @doc false
  def changeset(thread, attrs) do
    thread
    |> cast(attrs, [:title, :skill_id])
    |> validate_required([:title, :skill_id])
  end

  def new_changeset(%{thread: thread_attrs, post: post_attrs}) do
    post_changeset =
      %Post{}
      |> cast(post_attrs, [:body, :user_id])
      |> validate_required([:body, :user_id])

    %__MODULE__{}
    |> changeset(thread_attrs)
    |> put_assoc(:posts, [post_changeset])
  end
end
