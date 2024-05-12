defmodule NotificationApi.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "messages" do
    field :recipients, {:array, :string}
    field :status, :string, default: "queued"
    field :text, :string
    belongs_to :user, NotificationApi.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:sender_id, :recipients, :text, :status])
    |> validate_required([:sender_id, :recipients, :text, :status])
  end
end
