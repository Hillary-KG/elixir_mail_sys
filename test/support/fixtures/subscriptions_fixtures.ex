defmodule NotificationApi.SubscriptionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NotificationApi.Subscriptions` context.
  """

  @doc """
  Generate a subscription.
  """
  def subscription_fixture(attrs \\ %{}) do
    {:ok, subscription} =
      attrs
      |> Enum.into(%{
        expiry_date: ~N[2024-05-11 08:32:00]
      })
      |> NotificationApi.Subscriptions.create_subscription()

    subscription
  end
end
