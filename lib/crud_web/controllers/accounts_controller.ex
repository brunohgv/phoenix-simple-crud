defmodule CrudWeb.AccountsController do
  use CrudWeb, :controller

  alias Crud.Users
  alias Crud.Users.Accounts

  def index(conn, _params) do
    accounts = Users.list_accounts()
    render(conn, "index.html", accounts: accounts)
  end

  def new(conn, _params) do
    changeset = Users.change_accounts(%Accounts{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"accounts" => accounts_params}) do
    case Users.create_accounts(accounts_params) do
      {:ok, accounts} ->
        conn
        |> put_flash(:info, "Accounts created successfully.")
        |> redirect(to: Routes.accounts_path(conn, :show, accounts))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    accounts = Users.get_accounts!(id)
    render(conn, "show.html", accounts: accounts)
  end

  def edit(conn, %{"id" => id}) do
    accounts = Users.get_accounts!(id)
    changeset = Users.change_accounts(accounts)
    render(conn, "edit.html", accounts: accounts, changeset: changeset)
  end

  def update(conn, %{"id" => id, "accounts" => accounts_params}) do
    accounts = Users.get_accounts!(id)

    case Users.update_accounts(accounts, accounts_params) do
      {:ok, accounts} ->
        conn
        |> put_flash(:info, "Accounts updated successfully.")
        |> redirect(to: Routes.accounts_path(conn, :show, accounts))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", accounts: accounts, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    accounts = Users.get_accounts!(id)
    {:ok, _accounts} = Users.delete_accounts(accounts)

    conn
    |> put_flash(:info, "Accounts deleted successfully.")
    |> redirect(to: Routes.accounts_path(conn, :index))
  end
end
