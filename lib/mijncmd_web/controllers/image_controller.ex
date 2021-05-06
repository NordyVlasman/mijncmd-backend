defmodule MijcmdWeb.ImageController do
  use MijncmdWeb, :controller

  alias Mijncmd.{
    Uploaders.Image
  }

  def create(conn, %{"image" => image} = image_params) do
    with {:ok, imageUrl} <- Image.url(image_params, :thumb, signed: true) do
      conn
      |> put_status(:created)
      |> render("show.json", image: imageUrl)
    end
  end
end
