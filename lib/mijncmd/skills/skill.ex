defmodule Mijncmd.Skills.Skill do
  use Ecto.Schema
  import Ecto.Changeset

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

  def new_changeset(category, attrs) do
    category
    |> cast(attrs, [:title])
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
