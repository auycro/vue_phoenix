## Front-end with Vite

```sh
yarn create vite
yarn
yarn dev

yarn add vue-router
yarn add firebase
yarn add axios
```

----------

## Backend Todos

```sh
mix phx.gen.json Account User users first_name:string last_name:string email:string token:string
```

```sh

mix deps.get
```

### Add Support CORS

```
{:cors_plug, "~> 3.0"},
```

endpoint.ex

```
  plug CORSPlug
```

### Add firebase-admin

https://github.com/scripbox/firebase-admin-ex

```
      {:ex_firebase, "~> 0.3.1"},
```

config.exs

```
config :ex_firebase,
  project_id: "project-id",
  service_account_path: "service-security.json",
  queue_interval: 1000, # frequency in ms queued messages are sent
  queue_batch_size: 10 # number of messages sent per queue_interval
```

firebase service account download link

https://console.firebase.google.com/u/0/project/_/settings/serviceaccounts/adminsdk
