defmodule NotificationApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NotificationApi.Accounts` context.
  """

  @doc """
  Generate a unique account username.
  """
  def unique_account_username, do: "some username#{System.unique_integer([:positive])}"

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        password: "some password",
        permissions: ["option1", "option2"],
        username: unique_account_username()
      })
      |> NotificationApi.Accounts.create_account()

    account
  end
end
