defmodule Mijncmd.ImageView do
  use Phoenix.View,
    root: "lib/web/templates",
    namespace: Mijncmd

  def render("index.json", %{fileurl: fileurl}) do
    %{
      success: 1,
      file: %{
        url: "http://localhost:4000#{fileurl}"
      }
    }
  end
end
