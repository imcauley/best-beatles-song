defmodule SongRank.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add(:title, :string, null: false)
      add(:image, :string, null: true)
    end
  end
end
