import Ecto.Query, only: [from: 2]

defmodule SongRank.Vote do
  use Ecto.Schema

  schema "votes" do
    field(:song_id, :integer)
    field(:loser_song_id, :integer)
    field(:inserted_at, :utc_datetime)
  end

  def vote_for_song(song_id, loser) do
    now = DateTime.truncate(DateTime.utc_now(), :second)
    v = %SongRank.Vote{song_id: song_id, loser_song_id: nil, inserted_at: now}
    SongRank.Repo.insert(v)
  end

  def votes_by_song() do
    SongRank.Repo.all(SongRank.Vote)

    votes_query =
      from(v in "votes",
        group_by: v.song_id,
        select: {v.song_id, count(v.song_id)}
      )

    votes = SongRank.Repo.all(votes_query)
    Enum.into(votes, %{})
  end
end
