defmodule NotificationApi.Subscriptions.Subscription do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "subscriptions" do
    field :expiry_date, :naive_datetime
    belongs_to :user, NotificationApi.Users.User
    belongs_to :subscription_plan, NotificationApi.SubscriptionPlans.SubscriptionPlan
    field :status, :string, default: "active"


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(subscription, attrs) do
    subscription
    |> cast(attrs, [:user_id, :plan_id, :expiry_date])
    |> validate_required([:user_id, :plan_id, :expiry_date])
  end
end
