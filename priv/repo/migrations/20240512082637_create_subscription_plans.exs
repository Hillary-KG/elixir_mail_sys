defmodule NotificationApi.Repo.Migrations.CreateSubscriptionPlans do
  use Ecto.Migration

  def change do
    create table(:subscription_plans, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :price, :float
      add :duration, :integer
      add :status, :integer

      timestamps(type: :utc_datetime)
    end

    create unique_index(:subscription_plans, [:name])
  end
end
