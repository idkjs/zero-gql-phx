defmodule ZeroPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :zero_phoenix,
    adapter: Ecto.Adapters.Postgres
end
