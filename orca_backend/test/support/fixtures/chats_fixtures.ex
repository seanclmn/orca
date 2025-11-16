defmodule OrcaBackend.ChatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OrcaBackend.Chats` context.
  """

  @doc """
  Generate a chat_room.
  """
  def chat_room_fixture(attrs \\ %{}) do
    {:ok, chat_room} =
      attrs
      |> Enum.into(%{
        avatar_url: "some avatar_url",
        name: "some name",
        type: "some type"
      })
      |> OrcaBackend.Chats.create_chat_room()

    chat_room
  end
end
