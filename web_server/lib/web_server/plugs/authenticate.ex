defmodule WebServer.Plug.Authenticate do
  import Plug.Conn
  require Logger

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
        {:ok, _data} <- ExFirebase.Auth.verify_token(token) do
      conn
    else
      _error -> Logger.info  "Logging this error!"
      conn
      |> put_status(:unauthorized)
      |> Phoenix.Controller.put_view(WebServerWeb.ErrorView)
      |> Phoenix.Controller.render(:"401")
      |> halt()
    end
  end
end
