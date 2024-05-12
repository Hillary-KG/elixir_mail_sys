defmodule NotificationApiWeb.DefautController do
  use NotificationApiWeb, :controller
  def index(conn, __params) do
    text(conn, "We are live baby! -- ENV #{Mix.env()}")
  end
end
