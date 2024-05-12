defmodule NotificationApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :bio, :string
    field :dob, :date
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :msisdn, :string
    belongs_to :account, NotificationApi.Accounts.Account
    has_many :messages, NotificationApi.Messages.Message
    has_one :subscription, NotificationApi.Subscriptions.Subscription
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:account_id, :first_name, :last_name, :email, :msisdn, :dob, :bio])
    |> validate_required([:account_id, :first_name, :last_name, :email, :msisdn])
    |> unique_constraint(:msisdn)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must be a valid email address")
  end
end
