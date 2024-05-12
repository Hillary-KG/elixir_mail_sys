defmodule NotificationApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :msisdn, :string
      add :dob, :date
      add :bio, :text
      add :account_id, references(:accounts, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:msisdn])
    create unique_index(:users, [:email])
    create index(:users, [:account_id, :first_name, :last_name])
  end
end
