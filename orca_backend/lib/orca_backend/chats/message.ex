defmodule OrcaBackend.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    field :read_at, :utc_datetime
    field :sender_id, :id
    field :chat_room_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :read_at])
    |> validate_required([:content, :read_at])
  end
end
