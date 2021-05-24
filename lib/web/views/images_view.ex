defmodule Mijncmd.ImageView do
  use Phoenix.View,
    root: "lib/web/templates",
    namespace: Mijncmd

  import Phoenix.Controller,
    only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

  import Phoenix.View

  def render("index.json", %{fileurl: fileurl}) do
    %{
      success: 1,
      file: %{
        url: "http://localhost:4000#{fileurl}"
      }
    }
  end
end
