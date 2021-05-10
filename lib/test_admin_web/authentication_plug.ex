defmodule TestAdminWeb.AuthenticationPlug do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _default)  do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(401, "")
    |> halt()
  end

end