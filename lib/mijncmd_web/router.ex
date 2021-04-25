defmodule MijncmdWeb.Router do
  use MijncmdWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    # plug :fetch_current_user_by_token
    plug MijncmdWeb.Context
  end

  scope "/api" do
    pipe_through :graphql

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MijncmdWeb.Schema, interface: :playground
    forward "/", Absinthe.Plug, schema: MijncmdWeb.Schema
  end
end
