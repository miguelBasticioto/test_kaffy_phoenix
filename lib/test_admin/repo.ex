defmodule TestAdmin.Repo do
  use Ecto.Repo,
    otp_app: :test_admin,
    adapter: Ecto.Adapters.Postgres
end
