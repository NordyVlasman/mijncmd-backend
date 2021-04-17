defmodule Mijncmd.Skills.Skill do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_opts [type: :utc_datetime_usec]

  alias Mijncmd.{
    Threads.Thread
  }

  schema "skills" do
    field :title, :string

    has_many(:threads, Thread)

    timestamps()
  end

  def new_changeset(skill, attrs) do
    skill
    |> cast(attrs, [:title])
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
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end

  def alphabetized(query) do
    from(c in query, order_by: c.title)
  end
end
