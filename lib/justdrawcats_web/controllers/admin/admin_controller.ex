defmodule JustdrawcatsWeb.Admin.AdminController do
  use JustdrawcatsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
