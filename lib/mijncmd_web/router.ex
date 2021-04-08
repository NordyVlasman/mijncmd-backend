defmodule MijncmdWeb.Router do
  use MijncmdWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MijncmdWeb do
    pipe_through :api
  end
end
