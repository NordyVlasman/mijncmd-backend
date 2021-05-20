defmodule MijncmdWeb.ImageView do
  use MijncmdWeb, :view

  def render("index.json", %{fileurl: fileurl}) do
    %{
      success: 1,
      file: %{
        url: "http://localhost:4000#{fileurl}"
      }
    }
  end
end
