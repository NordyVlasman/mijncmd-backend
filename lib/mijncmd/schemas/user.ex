defmodule Mijncmd.User do
  use Mijncmd.Schema
  use Arc.Ecto.Schema

  alias Mijncmd.{
    User,
    Files.Image,
    UserSkill,
    Repo
  }

  @derive {Inspect, except: [:password]}
  schema "users" do
    field(:email, :string)
    field(:name, :string)
    field(:title, :string)
    field(:handle, :string)
    field(:role, :string)

    field(:avatar, Image.Type)

    field(:password, :string, virtual: true)
    field(:hashed_password, :string)
    field(:confirmed_at, :naive_datetime)

    has_many(:access_tokens, Mijncmd.AccessToken)
    has_many(:posts, Mijncmd.Post)

    has_many(:user_skills, UserSkill, on_delete: :delete_all)
    has_many(:skills, through: [:user_skills, :skill])

    many_to_many(:likes, Mijncmd.Post, join_through: "post_likes", on_replace: :delete, on_delete: :delete_all)

    timestamps()
  end

  @required_fields ~w(name email title password handle role)a
  @optional_fields ~w(avatar)a
  def create_changeset(model, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> cast_attachments(params, [:avatar])
    |> validate_required(@required_fields)
    |> update_change(:email, &String.trim/1)
    |> validate_format(:email, ~r/.+@.+/)
    |> maybe_hash_password()
  end

  # Functions
  def map_user_avatar_url(user) do
    if user.avatar do
      avatar_url = Image.url({user.avatar, user}, :thumb, signed: true)
      Map.merge(user, %{avatar_url: avatar_url})
    else
      user
    end
  end

  defp maybe_hash_password(changeset) do
    password = get_change(changeset, :password)

    if password && changeset.valid? do
      changeset
      |> put_change(:hashed_password, Bcrypt.hash_pwd_salt(password))
      |> delete_change(:password)
    else
      changeset
    end
  end

  def valid_password?(%User{hashed_password: hashed_password}, password)
    when is_binary(hashed_password) and byte_size(password) > 0 do
      Bcrypt.verify_pass(password, hashed_password)
  end

  def preload_skills(%Ecto.Query{} = query), do: Ecto.Query.preload(query, :skills)
  def preload_skills(user), do: Repo.preload(user, :skills)
end
