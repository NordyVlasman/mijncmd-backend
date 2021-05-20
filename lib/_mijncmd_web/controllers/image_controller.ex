# defmodule MijncmdWeb.ImageController do
#   use MijncmdWeb, :controller

#   alias Mijncmd.{
#     Uploaders.Image,
#     Repo,
#     Imagers
#   }

#   def create(conn, %{"image" => image}) do
#     changeset = Imagers.creation_changeset(%Imagers{}, %{name: image.filename, image: image})
#     case Repo.insert(changeset) do
#       {:ok, image} ->
#         fileurl = Image.url({image.image, image}, :original, signed: true)

#         conn
#         |> put_status(:created)
#         |> render("index.json", %{fileurl: fileurl})
#       {:error, _} ->
#         conn
#         |> put_status(:created)
#     end
#   end
# end
