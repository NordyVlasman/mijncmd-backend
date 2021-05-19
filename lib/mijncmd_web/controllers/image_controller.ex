defmodule MijncmdWeb.ImageController do
  use MijncmdWeb, :controller

  alias Mijncmd.{
    Uploaders.Image,
    Repo,
    Imagers
  }

  def create(conn, %{"image" => image}) do
    # image =
    #   Imagers
    #   |> Imagers.creation_changeset(%{name: name, image: image})
    #   |> Repo.insert()
    changeset = Imagers.creation_changeset(%Imagers{}, %{name: image.filename, image: image})
    case Repo.insert(changeset) do
      {:ok, image} ->
        fileurl = Image.url({image.image, image}, :original, signed: true)

        conn
        |> put_status(:created)
        |> render("index.json", %{fileurl: fileurl})
        # |> Plug.Conn.send_resp(200, [%{success: 1, file: image}])
        # |> Plug.Conn.halt()
      {:error, _} ->
        conn
        |> put_status(:created)
    end
    # with {:ok, imageUrl} <- Image.url(image_params, :thumb, signed: true) do
    #   conn
    #   |> put_status(:created)
    #   |> render("show.json", image: imageUrl)
    # end
  end
end
