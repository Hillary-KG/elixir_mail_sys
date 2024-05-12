defmodule NotificationApi.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NotificationApi.Users` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique user msisdn.
  """
  def unique_user_msisdn, do: "some msisdn#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        dob: ~D[2024-05-09],
        email: unique_user_email(),
        first_name: "some first_name",
        last_name: "some last_name",
        msisdn: unique_user_msisdn()
      })
      |> NotificationApi.Users.create_user()

    user
  end
end
