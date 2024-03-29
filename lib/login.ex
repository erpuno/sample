defmodule Sample.Login do
  require NITRO

  require Logger

  def event(:init) do
    login_button = NITRO.button(id: :loginButton, body: "HELO", postback: :login2, source: [:user, :room])
    :nitro.update(:loginButton, login_button)
  end

  def event(:login2) do
    user = :nitro.to_list(:nitro.q(:user))
    room = :nitro.to_binary(:nitro.q(:room))
    :n2o.user(user)
    :n2o.session(:room, room)
    :nitro.redirect(["/app/index.htm?room=", room])
  end

  def event(unexpected) do
    unexpected
    |> inspect()
    |> Logger.warn()
  end
end
