defmodule SongRank.Song do
  use Ecto.Schema
  import Ecto.Changeset

  schema "songs" do
    field(:image, :string)
    field(:title, :string)

    # timestamps()
  end

  def random_song() do
    index = :rand.uniform(194)

    SongRank.Repo.get(SongRank.Song, index)
  end

  def random_song(avoid) do
    index = :rand.uniform(194)

    if(index == avoid) do
      index = index + 1

      if(index > 194) do
        index = 1
      end
    end

    SongRank.Repo.get(SongRank.Song, index)
  end

  def get_songs_with_votes() do
    songs = SongRank.Repo.all(SongRank.Song)
    votes = SongRank.Vote.votes_by_song()

    Enum.map(songs, fn song ->
      %{
        :title => song.title,
        :votes => votes[song.id] || 0
      }
    end)
    |> Enum.sort(&SongRank.Song.sort_ranking/2)
  end

  def sort_ranking(song_1, song_2) do
    song_1[:votes] > song_2[:votes]
  end

  def update_rankings() do
    Phoenix.PubSub.broadcast(
      SongRank.PubSub,
      "update",
      {
        :ranking_update,
        get_songs_with_votes()
      }
    )
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:title, :image])
    |> validate_required([:title, :image])
  end
end
