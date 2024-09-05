defmodule Sample.Login do
  require NITRO

  require Logger

  def event(:init) do
     :io.format 'LOGIN INIT'
    login_button = NITRO.button(id: :loginButton, body: "HELO", postback: :login, source: [:user, :room])
    :nitro.update(:loginButton, login_button)
  end

  def event(:login) do
     :io.format 'LOGIN PRESSED'
    user = :nitro.to_list(:nitro.q(:user))
    room = :nitro.to_binary(:nitro.q(:room))
    :n2o.user(user)
    :n2o.session(:room, room)
    :nitro.redirect(["/app/index.htm?room=", room])
  end

  def event(unexpected) do
    unexpected
    |> inspect()
    |> Logger.warning()
  end
end
