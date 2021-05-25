defmodule Mijncmd.Router do
  use Phoenix.Router

  pipeline :graphql do
    plug(Mijncmd.Plugs.AssignCurrentUser)
    plug(Mijncmd.Plugs.GraphQLContext)
  end

  pipeline :browser do
    plug :accepts, ~w(json html)
    plug :put_secure_browser_headers, %{"x-frame-options" => ""}
  end

  scope "/graphiql" do
    pipe_through(:graphql)

    forward("/", Absinthe.Plug.GraphiQL, schema: Mijncmd.GraphQL.Schema)
  end

  scope "/graphql" do
    pipe_through(:graphql)

    forward("/", Absinthe.Plug, schema: Mijncmd.GraphQL.Schema)
  end

  scope "/" do
    pipe_through(:browser)

    post("/upload/image", Mijncmd.ImageController, :create)
  end
end
