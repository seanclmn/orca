defmodule OrcaBackend.Chats.ChatRoom do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_rooms" do
    field :name, :string
    field :type, :string
    field :avatar_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(chat_room, attrs) do
    chat_room
    |> cast(attrs, [:name, :type, :avatar_url])
    |> validate_required([:name, :type, :avatar_url])
  end
end
