defmodule NotificationApi.SubscriptionPlansTest do
  use NotificationApi.DataCase

  alias NotificationApi.SubscriptionPlans

  describe "subscription_plans" do
    alias NotificationApi.SubscriptionPlans.SubscriptionPlan

    import NotificationApi.SubscriptionPlansFixtures

    @invalid_attrs %{duration: nil, name: nil, price: nil, status: nil}

    test "list_subscription_plans/0 returns all subscription_plans" do
      subscription_plan = subscription_plan_fixture()
      assert SubscriptionPlans.list_subscription_plans() == [subscription_plan]
    end

    test "get_subscription_plan!/1 returns the subscription_plan with given id" do
      subscription_plan = subscription_plan_fixture()
      assert SubscriptionPlans.get_subscription_plan!(subscription_plan.id) == subscription_plan
    end

    test "create_subscription_plan/1 with valid data creates a subscription_plan" do
      valid_attrs = %{duration: 42, name: "some name", price: 120.5, status: 42}

      assert {:ok, %SubscriptionPlan{} = subscription_plan} = SubscriptionPlans.create_subscription_plan(valid_attrs)
      assert subscription_plan.duration == 42
      assert subscription_plan.name == "some name"
      assert subscription_plan.price == 120.5
      assert subscription_plan.status == 42
    end

    test "create_subscription_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SubscriptionPlans.create_subscription_plan(@invalid_attrs)
    end

    test "update_subscription_plan/2 with valid data updates the subscription_plan" do
      subscription_plan = subscription_plan_fixture()
      update_attrs = %{duration: 43, name: "some updated name", price: 456.7, status: 43}

      assert {:ok, %SubscriptionPlan{} = subscription_plan} = SubscriptionPlans.update_subscription_plan(subscription_plan, update_attrs)
      assert subscription_plan.duration == 43
      assert subscription_plan.name == "some updated name"
      assert subscription_plan.price == 456.7
      assert subscription_plan.status == 43
    end

    test "update_subscription_plan/2 with invalid data returns error changeset" do
      subscription_plan = subscription_plan_fixture()
      assert {:error, %Ecto.Changeset{}} = SubscriptionPlans.update_subscription_plan(subscription_plan, @invalid_attrs)
      assert subscription_plan == SubscriptionPlans.get_subscription_plan!(subscription_plan.id)
    end

    test "delete_subscription_plan/1 deletes the subscription_plan" do
      subscription_plan = subscription_plan_fixture()
      assert {:ok, %SubscriptionPlan{}} = SubscriptionPlans.delete_subscription_plan(subscription_plan)
      assert_raise Ecto.NoResultsError, fn -> SubscriptionPlans.get_subscription_plan!(subscription_plan.id) end
    end

    test "change_subscription_plan/1 returns a subscription_plan changeset" do
      subscription_plan = subscription_plan_fixture()
      assert %Ecto.Changeset{} = SubscriptionPlans.change_subscription_plan(subscription_plan)
    end
  end
end
