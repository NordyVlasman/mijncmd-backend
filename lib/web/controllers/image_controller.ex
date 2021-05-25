defmodule Mijncmd.ImageController do
  use Phoenix.Controller

  import Plug.Conn

  alias Mijncmd.{
    Image,
    Repo
  }

  def create(conn, %{"image" => image}) do
    changeset = Image.create_changeset(%Image{},  %{name: image.filename, image: image})
    case Repo.insert(changeset) do
      {:ok, image} ->
        fileurl = Mijncmd.Files.Image.url({image.image, image}, :original, signed: true)

        conn
        |> put_status(:created)
        |> render("index.json", %{fileurl: fileurl})
      {:error, _} ->
        conn
        |> put_status(:created)
    end
  end
end
