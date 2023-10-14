defmodule L5rKeeper.Repo do
  use Ecto.Repo,
    otp_app: :l5r_keeper,
    adapter: Ecto.Adapters.Postgres
end
