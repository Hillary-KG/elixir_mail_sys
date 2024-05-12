defmodule NotificationApi.SubscriptionsTest do
  use NotificationApi.DataCase

  alias NotificationApi.Subscriptions

  describe "subscriptions" do
    alias NotificationApi.Subscriptions.Subscription

    import NotificationApi.SubscriptionsFixtures

    @invalid_attrs %{expiry_date: nil}

    test "list_subscriptions/0 returns all subscriptions" do
      subscription = subscription_fixture()
      assert Subscriptions.list_subscriptions() == [subscription]
    end

    test "get_subscription!/1 returns the subscription with given id" do
      subscription = subscription_fixture()
      assert Subscriptions.get_subscription!(subscription.id) == subscription
    end

    test "create_subscription/1 with valid data creates a subscription" do
      valid_attrs = %{expiry_date: ~N[2024-05-11 08:32:00]}

      assert {:ok, %Subscription{} = subscription} = Subscriptions.create_subscription(valid_attrs)
      assert subscription.expiry_date == ~N[2024-05-11 08:32:00]
    end

    test "create_subscription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscriptions.create_subscription(@invalid_attrs)
    end

    test "update_subscription/2 with valid data updates the subscription" do
      subscription = subscription_fixture()
      update_attrs = %{expiry_date: ~N[2024-05-12 08:32:00]}

      assert {:ok, %Subscription{} = subscription} = Subscriptions.update_subscription(subscription, update_attrs)
      assert subscription.expiry_date == ~N[2024-05-12 08:32:00]
    end

    test "update_subscription/2 with invalid data returns error changeset" do
      subscription = subscription_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscriptions.update_subscription(subscription, @invalid_attrs)
      assert subscription == Subscriptions.get_subscription!(subscription.id)
    end

    test "delete_subscription/1 deletes the subscription" do
      subscription = subscription_fixture()
      assert {:ok, %Subscription{}} = Subscriptions.delete_subscription(subscription)
      assert_raise Ecto.NoResultsError, fn -> Subscriptions.get_subscription!(subscription.id) end
    end

    test "change_subscription/1 returns a subscription changeset" do
      subscription = subscription_fixture()
      assert %Ecto.Changeset{} = Subscriptions.change_subscription(subscription)
    end
  end
end
