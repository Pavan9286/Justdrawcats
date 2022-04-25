defmodule Justdrawcats.Repo do
  use Ecto.Repo,
    otp_app: :justdrawcats,
    adapter: Ecto.Adapters.Postgres
end
