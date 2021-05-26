defmodule Mijncmd.WebAppView do
  use Phoenix.View,
    root: "lib/web/templates",
    namespace: Mijncmd

  def render("index.json", %{}) do
    %{
      success: 1,
      version: "0.0.1"
    }
  end
end
