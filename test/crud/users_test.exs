defmodule Crud.UsersTest do
  use Crud.DataCase

  alias Crud.Users

  describe "accounts" do
    alias Crud.Users.Accounts

    import Crud.UsersFixtures

    @invalid_attrs %{id: nil, name: nil, password: nil, username: nil}

    test "list_accounts/0 returns all accounts" do
      accounts = accounts_fixture()
      assert Users.list_accounts() == [accounts]
    end

    test "get_accounts!/1 returns the accounts with given id" do
      accounts = accounts_fixture()
      assert Users.get_accounts!(accounts.id) == accounts
    end

    test "create_accounts/1 with valid data creates a accounts" do
      valid_attrs = %{id: "some id", name: "some name", password: "some password", username: "some username"}

      assert {:ok, %Accounts{} = accounts} = Users.create_accounts(valid_attrs)
      assert accounts.id == "some id"
      assert accounts.name == "some name"
      assert accounts.password == "some password"
      assert accounts.username == "some username"
    end

    test "create_accounts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_accounts(@invalid_attrs)
    end

    test "update_accounts/2 with valid data updates the accounts" do
      accounts = accounts_fixture()
      update_attrs = %{id: "some updated id", name: "some updated name", password: "some updated password", username: "some updated username"}

      assert {:ok, %Accounts{} = accounts} = Users.update_accounts(accounts, update_attrs)
      assert accounts.id == "some updated id"
      assert accounts.name == "some updated name"
      assert accounts.password == "some updated password"
      assert accounts.username == "some updated username"
    end

    test "update_accounts/2 with invalid data returns error changeset" do
      accounts = accounts_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_accounts(accounts, @invalid_attrs)
      assert accounts == Users.get_accounts!(accounts.id)
    end

    test "delete_accounts/1 deletes the accounts" do
      accounts = accounts_fixture()
      assert {:ok, %Accounts{}} = Users.delete_accounts(accounts)
      assert_raise Ecto.NoResultsError, fn -> Users.get_accounts!(accounts.id) end
    end

    test "change_accounts/1 returns a accounts changeset" do
      accounts = accounts_fixture()
      assert %Ecto.Changeset{} = Users.change_accounts(accounts)
    end
  end
end
