defmodule IslandsEngine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  #   “Players need to be able to position islands on their own boards.Players need to be able to guess coordinates on their opponent’s boards.The game needs to determine if a guess results in a hit or a miss.The game needs to determine if a guess results in a forested island.The game needs to determine if a guess results in a win.”
  # Excerpt From
  # Functional Web Development with Elixir, OTP, and Phoenix
  # Lance Halvorsen
  # This material may be protected by copyright.
  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: IslandsEngine.Worker.start_link(arg)
      # {IslandsEngine.Worker, arg}
      {Registry, keys: :unique, name: Registry.Game}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IslandsEngine.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
