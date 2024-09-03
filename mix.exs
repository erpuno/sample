defmodule Sample.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :sample,
      version: "6.9.1",
      description: "SAMPLE Elixir Application",
      package: package(),
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
      extra_applications: [:ranch, :rocksdb, :mnesia, :xmerl, :cowboy, :logger, :n2o, :kvs, :syn, :nitro]
    ]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.29.0", only: :dev},
      {:cowboy, "~> 2.8.0"},
      {:rocksdb, git: "https://github.com/emqx/erlang-rocksdb", branch: "master"},
      {:nitro, "~> 8.2.4"},
      {:kvs, "~> 10.8.3"},
      {:n2o, "~> 10.12.4"},
      {:syn, "~> 2.1.1"}
    ]
  end
end
