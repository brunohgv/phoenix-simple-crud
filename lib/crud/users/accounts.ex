defmodule Crud.Users.Accounts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :id, :string
    field :name, :string
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(accounts, attrs) do
    accounts
    |> cast(attrs, [:id, :username, :password, :name])
    |> validate_required([:id, :username, :password, :name])
  end
end
