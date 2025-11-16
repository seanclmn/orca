defmodule OrcaBackend.Repo do
  use Ecto.Repo,
    otp_app: :orca_backend,
    adapter: Ecto.Adapters.Postgres
end
