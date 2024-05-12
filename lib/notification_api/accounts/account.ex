defmodule NotificationApi.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field :password, :string
    field :permissions, {:array, :string}, default: ["user"]
    field :username, :string
    has_one :user, NotificationApi.Users.User
    field :status, :string, default: "active"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:username, :password, :permissions])
    |> validate_required([:username, :password, :permissions])
    |> unique_constraint(:username)
    |> validate_length(:username, max: 50, min: 6, message: "must be between 6 and 50 characters long")
  end
end
