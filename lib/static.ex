defmodule Sample.Static do
  use Plug.Router
  plug Plug.Static, at: "/app",
       from: { :application.get_env(:n2o, :app,    :sample),
               :application.get_env(:n2o, :upload, "priv/static") }

  match _ do send_resp(conn, 404, "Please refer to https://n2o.dev for more information.") end
end
