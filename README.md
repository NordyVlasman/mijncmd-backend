# Mijncmd

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

docker run -d --name mijncmd \
  -p 127.0.0.1:80:4000 \
  -e DATABASE_HOST="localhost" \
  -e DATABASE_PORT="5432" \
  -e DATABASE_SSL="false" \
  -e DATABASE_NAME="mijncmd_prod" \
  -e DATABASE_USER="postgres" \
  -e DATABASE_USER_PASSWORD="postgres" \
  -e SECRET_KEY_BASE="wWNVNM19yWwqL2q2EAoavuYDgYP0Rh2RWq06clo5+fif/ckpk3TnKRepT62OAkNo" \
  -e URL_HOST="localhost" \
  ghcr.io/nordyvlasman/mijncmd
