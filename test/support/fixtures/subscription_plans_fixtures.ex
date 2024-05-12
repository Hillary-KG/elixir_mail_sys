defmodule NotificationApi.SubscriptionPlansFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NotificationApi.SubscriptionPlans` context.
  """

  @doc """
  Generate a unique subscription_plan name.
  """
  def unique_subscription_plan_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a subscription_plan.
  """
  def subscription_plan_fixture(attrs \\ %{}) do
    {:ok, subscription_plan} =
      attrs
      |> Enum.into(%{
        duration: 42,
        name: unique_subscription_plan_name(),
        price: 120.5,
        status: 42
      })
      |> NotificationApi.SubscriptionPlans.create_subscription_plan()

    subscription_plan
  end
end
