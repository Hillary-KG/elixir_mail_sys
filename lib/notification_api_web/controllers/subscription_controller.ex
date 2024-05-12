defmodule NotificationApiWeb.SubscriptionController do
  use NotificationApiWeb, :controller

  alias NotificationApi.Subscriptions
  alias NotificationApi.Subscriptions.Subscription

  action_fallback NotificationApiWeb.FallbackController

  def index(conn, _params) do
    subscriptions = Subscriptions.list_subscriptions()
    render(conn, :index, subscriptions: subscriptions)
  end

  def create(conn, %{"subscription" => subscription_params}) do
    with {:ok, %Subscription{} = subscription} <- Subscriptions.create_subscription(subscription_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/subscriptions/#{subscription}")
      |> render(:show, subscription: subscription)
    end
  end

  def show(conn, %{"id" => id}) do
    subscription = Subscriptions.get_subscription!(id)
    render(conn, :show, subscription: subscription)
  end

  def update(conn, %{"id" => id, "subscription" => subscription_params}) do
    subscription = Subscriptions.get_subscription!(id)

    with {:ok, %Subscription{} = subscription} <- Subscriptions.update_subscription(subscription, subscription_params) do
      render(conn, :show, subscription: subscription)
    end
  end

  def delete(conn, %{"id" => id}) do
    subscription = Subscriptions.get_subscription!(id)

    with {:ok, %Subscription{}} <- Subscriptions.delete_subscription(subscription) do
      send_resp(conn, :no_content, "")
    end
  end
end
