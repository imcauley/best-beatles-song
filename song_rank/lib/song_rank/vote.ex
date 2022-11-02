defmodule SongRank.Vote do
  use Ecto.Schema

  schema "votes" do
    field(:song_id, :integer)
    field(:inserted_at, :utc_datetime)
  end

  def vote_for_song(song_id) do
    now = DateTime.truncate(DateTime.utc_now(), :second)
    v = %SongRank.Vote{song_id: song_id, inserted_at: now}
    SongRank.Repo.insert(v)
  end
end
