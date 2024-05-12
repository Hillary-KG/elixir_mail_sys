defmodule NotificationApiWeb.SubscriptionPlanController do
  use NotificationApiWeb, :controller

  alias NotificationApi.SubscriptionPlans
  alias NotificationApi.SubscriptionPlans.SubscriptionPlan

  action_fallback NotificationApiWeb.FallbackController

  def index(conn, _params) do
    subscription_plans = SubscriptionPlans.list_subscription_plans()
    render(conn, :index, subscription_plans: subscription_plans)
  end

  def create(conn, %{"subscription_plan" => subscription_plan_params}) do
    with {:ok, %SubscriptionPlan{} = subscription_plan} <- SubscriptionPlans.create_subscription_plan(subscription_plan_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/subscription_plans/#{subscription_plan}")
      |> render(:show, subscription_plan: subscription_plan)
    end
  end

  def show(conn, %{"id" => id}) do
    subscription_plan = SubscriptionPlans.get_subscription_plan!(id)
    render(conn, :show, subscription_plan: subscription_plan)
  end

  def update(conn, %{"id" => id, "subscription_plan" => subscription_plan_params}) do
    subscription_plan = SubscriptionPlans.get_subscription_plan!(id)

    with {:ok, %SubscriptionPlan{} = subscription_plan} <- SubscriptionPlans.update_subscription_plan(subscription_plan, subscription_plan_params) do
      render(conn, :show, subscription_plan: subscription_plan)
    end
  end

  def delete(conn, %{"id" => id}) do
    subscription_plan = SubscriptionPlans.get_subscription_plan!(id)

    with {:ok, %SubscriptionPlan{}} <- SubscriptionPlans.delete_subscription_plan(subscription_plan) do
      send_resp(conn, :no_content, "")
    end
  end
end
