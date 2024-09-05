defmodule Sample.Application do
  use Application
  use N2O

  def room() do
    case N2O.session(:room) do
         '' -> '/root'
         "" -> '/root'
          x -> x
    end
  end

  def env(_app) do
    [
      {:port, 8002}
    ]
  end

  def start(_, _) do
      children = [ { Bandit, scheme: :http, plug: Sample.Static, port: 8004 },
                   { Bandit, scheme: :http, plug: Sample.WS, port: 8003 } ]
      opts = [strategy: :one_for_one, name: Sample.Supervisor]
      :cowboy.start_clear(:http, env(:sample), %{env: %{dispatch: :n2o_cowboy.points()}})
      :kvs.join()
      Supervisor.start_link(children, strategy: :one_for_one, name: Sample.Supervisor)
  end

end
