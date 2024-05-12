defmodule NotificationApi.SubscriptionPlans do
  @moduledoc """
  The SubscriptionPlans context.
  """

  import Ecto.Query, warn: false
  alias NotificationApi.Repo

  alias NotificationApi.SubscriptionPlans.SubscriptionPlan

  @doc """
  Returns the list of subscription_plans.

  ## Examples

      iex> list_subscription_plans()
      [%SubscriptionPlan{}, ...]

  """
  def list_subscription_plans do
    Repo.all(SubscriptionPlan)
  end

  @doc """
  Gets a single subscription_plan.

  Raises `Ecto.NoResultsError` if the Subscription plan does not exist.

  ## Examples

      iex> get_subscription_plan!(123)
      %SubscriptionPlan{}

      iex> get_subscription_plan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subscription_plan!(id), do: Repo.get!(SubscriptionPlan, id)

  @doc """
  Creates a subscription_plan.

  ## Examples

      iex> create_subscription_plan(%{field: value})
      {:ok, %SubscriptionPlan{}}

      iex> create_subscription_plan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_subscription_plan(attrs \\ %{}) do
    %SubscriptionPlan{}
    |> SubscriptionPlan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subscription_plan.

  ## Examples

      iex> update_subscription_plan(subscription_plan, %{field: new_value})
      {:ok, %SubscriptionPlan{}}

      iex> update_subscription_plan(subscription_plan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subscription_plan(%SubscriptionPlan{} = subscription_plan, attrs) do
    subscription_plan
    |> SubscriptionPlan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a subscription_plan.

  ## Examples

      iex> delete_subscription_plan(subscription_plan)
      {:ok, %SubscriptionPlan{}}

      iex> delete_subscription_plan(subscription_plan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subscription_plan(%SubscriptionPlan{} = subscription_plan) do
    Repo.delete(subscription_plan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subscription_plan changes.

  ## Examples

      iex> change_subscription_plan(subscription_plan)
      %Ecto.Changeset{data: %SubscriptionPlan{}}

  """
  def change_subscription_plan(%SubscriptionPlan{} = subscription_plan, attrs \\ %{}) do
    SubscriptionPlan.changeset(subscription_plan, attrs)
  end
end
