defmodule Crud.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crud.Users` context.
  """

  @doc """
  Generate a accounts.
  """
  def accounts_fixture(attrs \\ %{}) do
    {:ok, accounts} =
      attrs
      |> Enum.into(%{
        id: "some id",
        name: "some name",
        password: "some password",
        username: "some username"
      })
      |> Crud.Users.create_accounts()

    accounts
  end
end
