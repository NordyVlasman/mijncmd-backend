defmodule Mijncmd.ImageView do
  use Phoenix.View,
    root: "lib/web/templates",
    namespace: Mijncmd

  def render("index.json", %{fileurl: fileurl}) do
    %{
      success: 1,
      file: %{
        url: "https://api.nordyvlasman.nl#{fileurl}"
      }
    }
  end
end
