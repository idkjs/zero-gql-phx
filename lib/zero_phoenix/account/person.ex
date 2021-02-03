defmodule ZeroPhoenix.Account.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:first_name, :last_name, :username, :email])
    |> validate_required([:first_name, :last_name, :username, :email])
  end
end
