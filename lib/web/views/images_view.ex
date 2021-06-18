defmodule Mijncmd.ImageView do
  use Phoenix.View,
    root: "lib/web/templates",
    namespace: Mijncmd

  def render("index.json", %{fileurl: fileurl}) do
    %{
      success: 1,
      file: %{
        url: "https://mijncmd.herokuapp.com#{fileurl}"
      }
    }
  end
end
