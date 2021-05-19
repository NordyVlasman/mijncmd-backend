defmodule Mijncmd.Accounts.User do
  use Mijncmd.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  alias Mijncmd.{
    UserSkill,
    Post,
    Accounts.User,
    Repo,
    Files,
    Regexp,
    Uploaders.Image
  }

  @derive {Inspect, except: [:password]}
  schema "users" do
    field :email, :string
    field :name, :string
    field :handle, :string

    field :website_url, :string
    field :github_url, :string
    field :dribbble_url, :string

    field :password, :string, virtual: true
    field :hashed_password, :string
    field :confirmed_at, :naive_datetime

    field :avatar, Image.Type

    has_many :user_skills, UserSkill, on_delete: :delete_all
    has_many :posts, Post, foreign_key: :author_id, on_delete: :delete_all

    timestamps()
  end

  @required_fields ~w(email password name handle)a
  @optional_fields ~w(website_url github_url dribbble_url avatar)a

  def registration_changeset(user, attrs, opts \\ []) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> cast_attachments(attrs, [:avatar])
    |> validate_email()
    |> validate_password(opts)
  end

  def insert_changeset(user, attrs \\ %{}) do
    allowed =
      ~w(email name website_url github_url dribbble_url avatar handle)a
    changeset_with_allowed_attrs(user, attrs, allowed)
  end
  def file_changeset(user, attrs \\ %{}),
    do: cast_attachments(user, attrs, [:avatar], allow_urls: true)

  def update_changeset(user, attrs \\ %{}) do
    user
    |> insert_changeset(attrs)
    |> file_changeset(attrs)
  end

  def map_user_avatar_url(user) do
    if user.avatar do
      avatar_url = Image.url({user.avatar, user}, :thumb, signed: true)
      Map.merge(user, %{avatar_url: avatar_url})
    else
      user
    end
  end

  defp validate_email(changeset) do
    changeset
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_length(:email, max: 160)
    |> unsafe_validate_unique(:email, Mijncmd.Repo)
    |> unique_constraint(:email)
  end

  defp validate_password(changeset, opts) do
    changeset
    |> validate_required([:password])
    |> validate_length(:password, min: 6, max: 80)
    |> maybe_hash_password(opts)
  end

  defp maybe_hash_password(changeset, opts) do
    hash_password? = Keyword.get(opts, :hash_password, true)
    password = get_change(changeset, :password)

    if hash_password? && password && changeset.valid? do
      changeset
      |> put_change(:hashed_password, Bcrypt.hash_pwd_salt(password))
      |> delete_change(:password)
    else
      changeset
    end
  end

  def find(id) do
    Repo.get(User, id)
  end

  def with_handles(query \\ __MODULE__, handles),
    do: from(q in query, where: q.handle in ^handles)

  @doc """
  A user changeset for changing the email.

  It requires the email to change otherwise an error is added.
  """
  def email_changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_email()
    |> case do
      %{changes: %{email: _}} = changeset -> changeset
      %{} = changeset -> add_error(changeset, :email, "did not change")
    end
  end

  @doc """
  A user changeset for changing the password.
  """
  def password_changeset(user, attrs, opts \\ []) do
    user
    |> cast(attrs, [:password])
    |> validate_confirmation(:password, message: "does not match password")
    |> validate_password(opts)
  end

  @doc """
  Confirms the account by setting `confirmet_at`.
  """
  def confirm_changeset(user) do
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
    change(user, confirmed_at: now)
  end

  @doc """
  Verifies the password.

  If the is no user or the user doesn't have a password, we call
  `Bcrypt.no_user_verify/0` to avoid timing attacks.
  """
  def valid_password?(%Mijncmd.Accounts.User{hashed_password: hashed_password}, password)
    when is_binary(hashed_password) and byte_size(password) > 0 do
      Bcrypt.verify_pass(password, hashed_password)
    end

    def valid_password?(_, _) do
      Bcrypt.no_user_verify()
      false
    end

    @doc """
    Validates the current password otherwise adds an error to the changeset
    """
    def validate_current_password(changeset, password) do
      if valid_password?(changeset.data, password) do
        changeset
      else
        add_error(changeset, :current_password, "is not valid")
      end
    end

    defp changeset_with_allowed_attrs(user, attrs, allowed) do
      user
      |> cast(attrs, allowed)
      |> validate_required([:name, :email])
      |> validate_format(:email, Regexp.email())
    end
end
