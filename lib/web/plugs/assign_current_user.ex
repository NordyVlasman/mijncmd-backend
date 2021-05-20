defmodule Mijncmd.Plugs.AssignCurrentUser do
  import Plug.Conn

  alias Mijncmd.UserAuthFetcher

  def init(_), do: nil

  @doc """
  Takes a Plug.Conn and fetch the associated user giving the Authorization HTTP header.
  Fallbacks to the "authorization" query param to handle services without HTTP headers access (like webhooks).
  It assigns nil if any of the steps fails.
  """
  def call(conn, _opts) do
    conn
    |> get_req_header("authorization")
    |> List.first()
    |> fallback_query_param_token(conn)
    |> UserAuthFetcher.fetch()
    |> case do
      nil ->
        assign(conn, :current_user, nil)

      user ->
        Logger.metadata(current_user: user.email || user.id)

        assign(conn, :current_user, user)
    end
  end

  defp fallback_query_param_token(token, _) when not is_nil(token), do: token

  defp fallback_query_param_token(nil, %{params: %{"authorization" => token}}) when is_binary(token) do
    "Bearer " <> token
  end

  defp fallback_query_param_token(_, _) do
    nil
  end
end
