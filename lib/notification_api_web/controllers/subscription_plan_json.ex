defmodule NotificationApiWeb.SubscriptionPlanJSON do
  alias NotificationApi.SubscriptionPlans.SubscriptionPlan

  @doc """
  Renders a list of subscription_plans.
  """
  def index(%{subscription_plans: subscription_plans}) do
    %{data: for(subscription_plan <- subscription_plans, do: data(subscription_plan))}
  end

  @doc """
  Renders a single subscription_plan.
  """
  def show(%{subscription_plan: subscription_plan}) do
    %{data: data(subscription_plan)}
  end

  defp data(%SubscriptionPlan{} = subscription_plan) do
    %{
      id: subscription_plan.id,
      name: subscription_plan.name,
      price: subscription_plan.price,
      duration: subscription_plan.duration,
      status: subscription_plan.status
    }
  end
end
