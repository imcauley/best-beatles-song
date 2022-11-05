defmodule SongRank.RankTest do
  use SongRank.DataCase

  alias SongRank.Rank

  describe "songs" do
    alias SongRank.Rank.Song

    import SongRank.RankFixtures

    @invalid_attrs %{image: nil, name: nil}

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Rank.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Rank.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      valid_attrs = %{image: "some image", name: "some name"}

      assert {:ok, %Song{} = song} = Rank.create_song(valid_attrs)
      assert song.image == "some image"
      assert song.name == "some name"
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rank.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      update_attrs = %{image: "some updated image", name: "some updated name"}

      assert {:ok, %Song{} = song} = Rank.update_song(song, update_attrs)
      assert song.image == "some updated image"
      assert song.name == "some updated name"
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Rank.update_song(song, @invalid_attrs)
      assert song == Rank.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Rank.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Rank.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Rank.change_song(song)
    end
  end
end
