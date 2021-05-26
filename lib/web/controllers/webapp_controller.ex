defmodule Mijncmd.WebAppController do
  use Phoenix.Controller

  import Plug.Conn

  def index(conn, _) do
    conn
    |> put_status(:created)
    |> render("index.json")
  end
end
