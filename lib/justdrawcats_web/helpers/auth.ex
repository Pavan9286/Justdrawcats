defmodule JustdrawcatsWeb.Helper.Auth do
  alias Justdrawcats.Accounts.User
  alias Justdrawcats.Repo

  def current_user(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: Repo.get(User, user_id)
  end
end
