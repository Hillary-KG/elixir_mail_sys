defmodule NotificationApi.SubscriptionPlans.SubscriptionPlan do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "subscription_plans" do
    field :duration, :integer
    field :name, :string
    field :price, :float
    field :status, :integer, default: 1 #-active, 0-inactive
    has_many :subscriptions, NotificationApi.SubscriptionPlans.SubscriptionPlan

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(subscription_plan, attrs) do
    subscription_plan
    |> cast(attrs, [:name, :price, :duration, :status])
    |> validate_required([:name, :price, :duration, :status])
    |> unique_constraint(:name)
  end
end
