defmodule Mijncmd do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      Mijncmd.Endpoint,
      Mijncmd.Repo,
      {Phoenix.PubSub, name: Mijncmd.PubSub},
    ]

    {:ok, _} = Logger.add_backend(Sentry.LoggerBackend)

    opts = [strategy: :one_for_one, name: Mijncmd.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Mijncmd.Endpoint.config_change(changed, removed)
    :ok
  end
end
