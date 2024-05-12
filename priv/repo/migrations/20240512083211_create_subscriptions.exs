defmodule NotificationApi.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :expiry_date, :naive_datetime
      add :plan_id, references(:subscription_plans, on_delete: :nothing, type: :binary_id)
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :status, :string

      timestamps(type: :utc_datetime)
    end

    create index(:subscriptions, [:plan_id])
    create index(:subscriptions, [:user_id])
  end
end
