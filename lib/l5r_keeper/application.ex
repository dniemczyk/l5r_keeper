defmodule L5rKeeper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      L5rKeeperWeb.Telemetry,
      # Start the Ecto repository
      L5rKeeper.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: L5rKeeper.PubSub},
      # Start Finch
      {Finch, name: L5rKeeper.Finch},
      # Start the Endpoint (http/https)
      L5rKeeperWeb.Endpoint
      # Start a worker by calling: L5rKeeper.Worker.start_link(arg)
      # {L5rKeeper.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: L5rKeeper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    L5rKeeperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
