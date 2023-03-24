defmodule Sample.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :sample,
      version: "6.6.7",
      description: "SAMPLE Elixir Application",
      package: package(),
      elixir: "~> 1.7",
      deps: deps()
    ]
  end

  def package do
    [
      files: ~w(doc lib mix.exs LICENSE),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :sample,
      links: %{"GitHub" => "https://github.com/erpuno/sample"}
    ]
  end


  def application() do
    [
      mod: {Sample.Application, []},
      applications: [:ranch, :cowboy, :rocksdb, :logger, :n2o, :kvs, :syn, :nitro]
    ]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.20.2", only: :dev},
      {:cowboy, "~> 2.8.0"},
      {:rocksdb, "~> 1.6.0"},
      {:nitro, "~> 8.2.4"},
      {:kvs, "~> 10.3.0"},
      {:n2o, "~> 10.3.2"},
      {:syn, "~> 2.1.1"}
    ]
  end
end
