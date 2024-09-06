defmodule Sample.Static do
  use Plug.Router
  @app :application.get_env(:n2o, :app,    :sample)
  @dir :application.get_env(:n2o, :upload, "priv/static")
  plug Plug.Static, at: "/app", from: { @app, @dir }
  plug Plug.Static, at: "/",    from: { @app, @dir }
  match _ do send_resp(conn, 404, "Please refer to https://n2o.dev for more information.") end
end
