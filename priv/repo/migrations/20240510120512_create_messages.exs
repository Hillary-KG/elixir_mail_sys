defmodule NotificationApi.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :recipients, {:array, :string}
      add :text, :text
      add :status, :string
      add :sender_id, references(:users, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:messages, [:sender_id])
  end
end
