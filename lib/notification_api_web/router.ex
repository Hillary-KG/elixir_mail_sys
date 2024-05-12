defmodule NotificationApiWeb.Router do
  use NotificationApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NotificationApiWeb do
    pipe_through :api
    get "/", DefautController, :index
  end
end
