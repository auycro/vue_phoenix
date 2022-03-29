## DB

```sh
docker run --rm --name md -p 5433:5432 -i -t -v /workspace/db:/var/lib/postgresql/data -e POSTGRES_DB=vue_phx -e POSTGRES_PASSWORD=postgres  -e POSTGRES_USER=postgres postgres:latest
```

## Memo

### Setting Up

```
mix 
```

```sh
cd vue_phx
mix ecto.create
mix ecto.migrate
mix phx.server
```

### Generate Table

```sh
mix phx.gen.json Inventory Product products price:float stock:integer name:string tax:float
mix ecto.migrate
```

```sh
mix phx.gen.json Inventory Brand brands name:string details:map
mix ecto.migrate
```

### Show Route

Add the resource to your :api scope in lib/vue_phx_web/router.ex:

    resources "/brands", BrandController, except: [:new, :edit]

```sh
mix phx.routes
```

### Add migration

```sh
mix ecto.gen.migration add_product_details
```

Edit migration in priv/migrations/

```sh
mix ecto.migrate
```

---------

### Install Vue

```sh
npm install -g @vue/cli
```

### Start Project

```sh
vue create client
cd client
yarn serve
```

### Add Vuex

```sh
yarn add vuex@next --save
```

### Edit Build Path

```ts
// client/vue.config.js
const path = require("path");

module.exports = {
  outputDir: path.resolve(__dirname, "../vue_phx/priv/SPA"),
  //assetsDir: "../vue_phx/priv/static/SPA"
}
```

### Add Endpoint to serve SPA

```ts
// /workspace/vue_phx/lib/vue_phx_web/endpoint.ex
 plug Plug.Static,
    at: "/",
    from: :vue_phx,
    gzip: false,
    only: ~w(assets fonts images favicon.ico robots.txt)
```