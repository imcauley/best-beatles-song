defmodule SongRank.RankFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SongRank.Rank` context.
  """

  @doc """
  Generate a song.
  """
  def song_fixture(attrs \\ %{}) do
    {:ok, song} =
      attrs
      |> Enum.into(%{
        image: "some image",
        name: "some name"
      })
      |> SongRank.Rank.create_song()

    song
  end
end
