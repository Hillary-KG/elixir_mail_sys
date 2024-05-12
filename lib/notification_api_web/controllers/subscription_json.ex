defmodule NotificationApiWeb.SubscriptionJSON do
  alias NotificationApi.Subscriptions.Subscription

  @doc """
  Renders a list of subscriptions.
  """
  def index(%{subscriptions: subscriptions}) do
    %{data: for(subscription <- subscriptions, do: data(subscription))}
  end

  @doc """
  Renders a single subscription.
  """
  def show(%{subscription: subscription}) do
    %{data: data(subscription)}
  end

  defp data(%Subscription{} = subscription) do
    %{
      id: subscription.id,
      expiry_date: subscription.expiry_date
    }
  end
end
