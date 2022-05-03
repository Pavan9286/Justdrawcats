defmodule JustdrawcatsWeb.Plugs.Auth do
  import Phoenix.Controller
  import Plug.Conn
  alias JustdrawcatsWeb.Router.Helpers, as: Routes

  alias Justdrawcats.Accounts

  def init(default), do: default

  def call(conn, default) do
    requires_auth(conn, default)
  end

  def requires_auth(conn, _args) do
    if user_id = get_session(conn, :current_user_id) do
      current_user = Accounts.get_user!(user_id)

      conn
      |> assign(:current_user, current_user)
    else
      conn
      |> put_flash(:error, "You have to signed in to access that page.")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end
end
