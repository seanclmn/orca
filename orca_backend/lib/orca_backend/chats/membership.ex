defmodule OrcaBackend.Chats.Membership do
  use Ecto.Schema
  import Ecto.Changeset

  schema "memberships" do
    field :role, :string
    field :last_read_at, :utc_datetime
    field :joined_at, :utc_datetime
    field :left_at, :utc_datetime
    field :user_id, :id
    field :chat_room_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(membership, attrs) do
    membership
    |> cast(attrs, [:role, :last_read_at, :joined_at, :left_at])
    |> validate_required([:role, :last_read_at, :joined_at, :left_at])
  end
end
