defmodule JustdrawcatsWeb.SessionController do
  use JustdrawcatsWeb, :controller

  alias Justdrawcats.Accounts
  alias Justdrawcats.Accounts.User

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => auth_params}) do
    user = Accounts.get_by_email(auth_params["email"])

    case Bcrypt.check_pass(user, auth_params["encrypted_password"]) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Signed in successfully.")
        |> redirect(to: Routes.admin_path(conn, :index))

      {:error, _} ->
        conn
        |> put_flash(:error, "There was a problem with your username/password")
        |> render("new.html", changeset: Accounts.change_user(%User{}))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Signed out successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
