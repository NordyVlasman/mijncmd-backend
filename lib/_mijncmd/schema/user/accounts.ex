# defmodule Mijncmd.Accounts do
#   @moduledoc """
#   The Accounts context.
#   """

#   import Ecto.Query, warn: false
#   alias Mijncmd.Repo
#   alias Mijncmd.Accounts.{User, UserToken}

#   ## Database getters

#   @doc """
#   Gets a user by email.
#   """
#   def get_user_by_email(email) when is_binary(email) do
#     Repo.get_by(User, email: email)
#   end

#   @doc """
#   Gets a user by email and password
#   """
#   def get_user_by_email_and_password(email, password)
#     when is_binary(email) and is_binary(password) do
#       user = Repo.get_by(User, email: email)
#       if User.valid_password?(user, password), do: user
#   end

#   @doc """
#   Gets a single user.
#   """
#   def get_user!(id), do: Repo.get!(User, id)

#   ## User registration

#   @doc """
#   Registers a user.
#   """
#   def register_user(attrs) do
#     %User{}
#     |> User.registration_changeset(attrs)
#     |> Repo.insert()
#   end

#   @doc """
#   Returns an `%Ecto.Changeset{}` for tracking user changes.
#   """
#   def change_user_registration(%User{} = user, attrs \\ %{}) do
#     User.registration_changeset(user, attrs, hash_password: false)
#   end

#   ## Settings

#   @doc """
#   Returns an `%Ecto.Changeset{}` for changing the user email.
#   """
#   def change_user_email(user, attrs \\ %{}) do
#     User.email_changeset(user, attrs)
#   end

#   @doc """
#   Emulates that the email will change without actually changing it in the database
#   """
#   def apply_user_email(user, password, attrs) do
#     user
#     |> User.email_changeset(attrs)
#     |> User.validate_current_password(password)
#     |> Ecto.Changeset.apply_action(:update)
#   end

#   @doc """
#   Updates the user email using the given token.

#   If the token matches, the user email is updated and the token is deleted.
#   The confirmed_at date is also updated to the current time
#   """
#   def update_user_email(user, token) do
#     context = "change:#{user.email}"

#     with {:ok, query} <- UserToken.verify_change_email_token_query(token, context),
#          %UserToken{sent_to: email} <- Repo.one(query),
#          {:ok, _} <- Repo.transaction(user_email_multi(user, email, context)) do
#       :ok
#     else
#       _ -> :error
#     end
#   end

#   defp user_email_multi(user, email, context) do
#     changeset = user |> User.email_changeset(%{email: email}) |> User.confirm_changeset()

#     Ecto.Multi.new()
#     |> Ecto.Multi.update(:user, changeset)
#     |> Ecto.Multi.delete_all(:tokens, UserToken.user_and_contexts_query(user, [context]))
#   end

#   @doc """
#   Returns an `%Ecto.Changeset{}` for changing the user password.
#   """
#   def change_user_password(user, attrs \\ %{}) do
#     User.password_changeset(user, attrs, hash_password: false)
#   end

#   @doc """
#   Updates the user password.
#   """
#   def update_user_password(user, password, attrs) do
#     changeset =
#       user
#       |> User.password_changeset(attrs)
#       |> User.validate_current_password(password)

#     Ecto.Multi.new()
#     |> Ecto.Multi.update(:user, changeset)
#     |> Ecto.Multi.delete_all(:tokens, UserToken.user_and_contexts_query(user, :all))
#     |> Repo.transaction()
#     |> case do
#       {:ok, %{user: user}} -> {:ok, user}
#       {:error, :user, changeset, _} -> {:error, changeset}
#     end
#   end

#   ## Session
#   @doc """
#   Generates a session token.
#   """
#   def generate_user_session_token(user) do
#     {token, user_token} = UserToken.build_session_token(user)
#     Repo.insert!(user_token)
#     token
#   end

#   @doc """
#   Deletes the signed token with the given context.
#   """
#   def delete_session_token(token) do
#     Repo.delete_all(UserToken.token_and_context_query(token, "session"))
#     :ok
#   end

#   ## Confirmation

#   @doc """
#   Delivers the reset password email to the given user.
#   """
#   def deliver_user_reset_password_instructions(%User{} = user, reset_password_url_fun)
#       when is_function(reset_password_url_fun, 1) do
#     {_, user_token} = UserToken.build_email_token(user, "reset_password")
#     Repo.insert!(user_token)
#     ## Notify the user
#   end

#   @doc """
#   Gets the user by reset password token.
#   """
#   def get_user_by_reset_password_token(token) do
#     with {:ok, query} <- UserToken.verify_email_token_query(token, "reset_password"),
#       %User{} = user <- Repo.one(query) do
#         user
#       else
#         _ -> nil
#       end
#   end

#   @doc """
#   Resets the user password.
#   """
#   def reset_user_password(user, attrs) do
#     Ecto.Multi.new()
#     |> Ecto.Multi.update(:user, User.password_changeset(user, attrs))
#     |> Ecto.Multi.delete_all(:tokens, UserToken.user_and_contexts_query(user, :all))
#     |> Repo.transaction()
#     |> case do
#       {:ok, %{user: user}} -> {:ok, user}
#       {:error, :user, changeset, _} -> {:error, changeset}
#     end
#   end


#   def get_user_overview(%User{} = user) do
#     Repo.preload(user, [
#       user_skills: [:skill]
#     ])
#   end
# end
