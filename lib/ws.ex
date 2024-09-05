defmodule Sample.WS do
  use Plug.Router
  match _ do send_resp(conn, 404,
    "Please refer to https://n2o.dev for information about endpoints addresses.") end
end
