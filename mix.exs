defmodule Sample.Mixfile do
  use Mix.Project
  def project, do: [ app: :sample, version: "6.6.6", elixir: "~> 1.7", deps: deps() ]
  def application, do: [ mod: { Sample.Application, [] }, applications: [:cowboy, :n2o, :logger] ]
  def deps, do: [ {:n2o,   github: "synrc/n2o"},
                  {:nitro, github: "synrc/nitro"},
                  {:cowboy, "~> 2.5"} ]
end