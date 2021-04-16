defmodule Mijncmd.Community.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Mijncmd.{
    Threads.Thread,
    Community.Post,
    Accounts.User
  }

  schema "posts" do
    field(:title, :string)
    field(:body, :string)

    belongs_to(:thread, Thread)
    belongs_to(:user, User)

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :thread_id, :user_id])
    |> validate_required([:title, :body, :thread_id, :user_id])
  end
end
