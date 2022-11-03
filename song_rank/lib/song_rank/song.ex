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

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:title, :image])
    |> validate_required([:title, :image])
  end
end
