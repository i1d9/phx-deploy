# How to deploy a Phoenix Application 

### Set up the database
Make sure postgres is installed
```bash
export DATABASE_URL=ecto://username:password@hostname/database
```
```bash
export PHX_HOST=domain_name_or_ip_address
```
After running mix phx.gen.secret enter the generated value
```bash
export SECRET_KEY_BASE=VALUE_HERE
```


### Prod.exs modifications
The SSL cert is  generated using certbot. For LiveView(Sockets) to work the check origin list must be filled.
```elixir
config :hello, HelloWeb.Endpoint,
 cache_static_manifest: "priv/static/cache_manifest.json",
 check_origin: [
  "http://domain_name",
  "https://domain_name",
  "http://domain_name:4000",
  "https://domain_name:4000",
  "http://ip_address:4000",
  "https://ip_address:4000"],
  https: [
    port: 443,
    cipher_suite: :strong,
    keyfile: System.get_env("PRIVKEY"),
    certfile: System.get_env("CERTFILE")
  ]
```

### Set the path of the SSL certs
```bash
export CERTFILE=/etc/letsencrypt/live/domain_name/fullchain.pem
export PRIVKEY=/etc/letsencrypt/live/domain_name/privkey.pem
```
### Run the server
```bash
PORT=80 MIX_ENV=prod mix phx.server
```