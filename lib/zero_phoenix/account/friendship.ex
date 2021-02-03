defmodule ZeroPhoenix.Account.Friendship do
  use Ecto.Schema
  import Ecto.Changeset

  schema "friendships" do
    field :person_id, :id
    field :friend_id, :id

    timestamps()
  end

  @doc false
  def changeset(friendship, attrs) do
    friendship
    |> cast(attrs, [])
    |> validate_required([])
  end
end
