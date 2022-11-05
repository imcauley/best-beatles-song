defmodule SongRank.Repo do
  use Ecto.Repo,
    otp_app: :song_rank,
    adapter: Ecto.Adapters.Postgres
end
