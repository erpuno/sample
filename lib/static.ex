defmodule Sample.Static do
  use Plug.Router
  plug Plug.Static, from: {:sample, "priv/static"}, at: "/app"
  match _ do send_resp(conn, 404, "Please refer to https://n2o.dev for more information.") end
end
