defmodule SongRank.Song do
  use Ecto.Schema
  import Ecto.Changeset

  schema "songs" do
    field(:image, :string)
    field(:title, :string)

    # timestamps()
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:title, :image])
    |> validate_required([:title, :image])
  end
end
