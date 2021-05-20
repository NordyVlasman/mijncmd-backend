defmodule Mijncmd.WebAppController do
  use Plug.Builder

  plug(:index)

  def index(conn, _) do
    conn
    |> put_resp_header("content-type", "text-html")
    |> send_resp(:ok, "Success")
  end
end
