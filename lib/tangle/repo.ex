defmodule Tangle.Repo do
  use Ecto.Repo,
    otp_app: :tangle,
    adapter: Ecto.Adapters.Postgres
end
