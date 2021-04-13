defmodule MijncmdWeb.Router do
  use MijncmdWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug MijncmdWeb.Context
  end

  scope "/api" do
    pipe_through :graphql

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MijncmdWeb.Schema
    forward "/", Absinthe.Plug, schema: MijncmdWeb.Schema
  end
end
