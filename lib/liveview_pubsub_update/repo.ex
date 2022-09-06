defmodule LiveviewPubsubUpdate.Repo do
  use Ecto.Repo,
    otp_app: :liveview_pubsub_update,
    adapter: Ecto.Adapters.Postgres
end
