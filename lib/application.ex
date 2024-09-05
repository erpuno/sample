defmodule Sample.Application do
  require N2O
  use Application

  def route(<<"/ws/app/", p::binary>>),  do: route(p)
  def route(<<"index", _::binary>>), do: Sample.Index
  def route(<<"login", _::binary>>), do: Sample.Login

  def finish(state, ctx), do: {:ok, state, ctx}
  def init(state, context) do
      %{path: path} = N2O.cx(context, :req)
      {:ok, state, N2O.cx(context, path: path, module: route(path))}
  end

  def start(_, _) do
      :kvs.join()
      children = [ { Bandit, scheme: :http, port: 8002, plug: Sample.WS },
                   { Bandit, scheme: :http, port: 8004, plug: Sample.Static } ]
      Supervisor.start_link(children, strategy: :one_for_one, name: Sample.Supervisor)
  end
end
