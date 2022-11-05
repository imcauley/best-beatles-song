# SongRank
A webapp to crowdsource the best song from the Beatles. The app allows users to vote in head to head comparisons of songs, and will show real time updates to the results.

Built with Elixir, Phoenix, PostgresQL, Docker

## Usage:
Setup: `mix deps.get && mix ecto.setup`

Start server: `mix phx.server`

Start REPL: `iex -S mix phx.server`

Deploy: `fly deploy`

## TODO:
    [x] Dynamic images
    [x] Load all images
    [x] Vote Layout
    [x] Make top bar layout work
    [x] Ranking layout
    [x] Ranking pubsub
    [x] Ranking scheduled job
    [x] Save loser in vote
    [x] Deploy
    [x] Add footer

    [ ] Page for every song?
    [ ] Heatmap?