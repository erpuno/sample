use Mix.Config

config :n2o,
  port: 8002,
  app: :sample,
  pickler: :n2o_secret,
  mq: :n2o_syn,
  upload: "./priv/static",
  nitro_prolongate: true,
  ttl: 60,
  protocols: [:nitro_n2o, :n2o_ftp],
  routes: Sample.Routes

config :kvs,
  dba: :kvs_rocks,
  dba_st: :kvs_st,
  schema: [:kvs, :kvs_stream]
