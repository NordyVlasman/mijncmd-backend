# defmodule Mijncmd.FeedItemSkill do
#  use Mijncmd.Schema

#  alias Mijncmd.{
#    FeedItem,
#    Skill
#  }

#  schema "feed_item_skills" do
#   field :position, :integer
#   field :delete, :boolean, virtual: true

#   belongs_to :feed_item, FeedItem, foreign_key: :item_id
#   belongs_to :skill, Skill

#   timestamps()
#  end

#  def changeset(item_skill, params \\ %{}) do
#   item_skill
#   |> cast(params, ~w(position item_id skill_id delete)a)
#   |> validate_required([:position])
#   |> foreign_key_constraint(:item_id)
#   |> foreign_key_constraint(:skill_id)
#   |> mark_for_deletion()
#  end

#  def build_and_preload({skill, position}) do
#   %__MODULE__{position: position, skill_id: skill.id}
#   |> Repo.preload(:skill)
#  end
# end
