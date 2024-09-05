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

  def start(_, _) do
      opts     = [ strategy: :one_for_one,  name: Sample.Supervisor]
      children = [ { Bandit, scheme: :http, plug: Sample.Static, port: 8004 },
                   { Bandit, scheme: :http, plug: Sample.WS, port: 8002 } ]
      :kvs.join()
      Supervisor.start_link(children, strategy: :one_for_one, name: Sample.Supervisor)
  end

end
