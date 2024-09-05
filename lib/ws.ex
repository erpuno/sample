defmodule Sample.WS do

  use Plug.Router
  plug :match
  plug :dispatch

  get "/" do send_resp(conn, 200, "NONE") end
  get "/ws/app/index.htm" do conn |> WebSockAdapter.upgrade(Sample.WS, [], timeout: 60_000) |> halt() end
  get "/ws/app/login.htm" do conn |> WebSockAdapter.upgrade(Sample.WS, [], timeout: 60_000) |> halt() end

  def init(args) do {:ok, []} end

  def handle_in({"N2O," <> key = message, options}, state) do
      {_,m,r,s} = :n2o_proto.stream(message,[],state)
      :io.format 'N2O: ~p~n', [key]
      {:reply, :ok, m, s}
  end

  def handle_in({"PING", options}, state) do
      :io.format 'PING~n'
      {:reply, :ok, {:text, "PONG"}, state}
  end

  def handle_in({message, options}, state) do
      :io.format 'Binary: ~p~n', [message]
      {x,m,r,s} = :n2o_proto.stream(message,[],state)
      :io.format 'Processed: ~p~n', [{x,m,r,s}]
      response({x,m,r,s})
  end

  def response({:reply,{:binary,rep},_,s}), do: {:reply,:ok,{:binary,rep},s}
  def response({:reply,{:text,rep},_,s}), do: {:reply,:ok,{:text,rep},s}
  def response({:reply,{:bert,rep},_,s}), do: {:reply,:ok,{:binary,:n2o_bert.encode(rep)},s}
  def response({:reply,{:json,rep},_,s}), do: {:reply,:ok,{:binary,:n2o_json.encode(rep)},s}
  def response({:reply,{encoder,rep},_,s}), do: {:reply,:ok,{:binary,encoder.encode(rep)},s}

  match _ do send_resp(conn, 404, "Please refer to https://n2o.dev for more information.") end

end
