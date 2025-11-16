defmodule OrcaBackend.ChatsTest do
  use OrcaBackend.DataCase

  alias OrcaBackend.Chats

  describe "chat_rooms" do
    alias OrcaBackend.Chats.ChatRoom

    import OrcaBackend.ChatsFixtures

    @invalid_attrs %{name: nil, type: nil, avatar_url: nil}

    test "list_chat_rooms/0 returns all chat_rooms" do
      chat_room = chat_room_fixture()
      assert Chats.list_chat_rooms() == [chat_room]
    end

    test "get_chat_room!/1 returns the chat_room with given id" do
      chat_room = chat_room_fixture()
      assert Chats.get_chat_room!(chat_room.id) == chat_room
    end

    test "create_chat_room/1 with valid data creates a chat_room" do
      valid_attrs = %{name: "some name", type: "some type", avatar_url: "some avatar_url"}

      assert {:ok, %ChatRoom{} = chat_room} = Chats.create_chat_room(valid_attrs)
      assert chat_room.name == "some name"
      assert chat_room.type == "some type"
      assert chat_room.avatar_url == "some avatar_url"
    end

    test "create_chat_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chats.create_chat_room(@invalid_attrs)
    end

    test "update_chat_room/2 with valid data updates the chat_room" do
      chat_room = chat_room_fixture()
      update_attrs = %{name: "some updated name", type: "some updated type", avatar_url: "some updated avatar_url"}

      assert {:ok, %ChatRoom{} = chat_room} = Chats.update_chat_room(chat_room, update_attrs)
      assert chat_room.name == "some updated name"
      assert chat_room.type == "some updated type"
      assert chat_room.avatar_url == "some updated avatar_url"
    end

    test "update_chat_room/2 with invalid data returns error changeset" do
      chat_room = chat_room_fixture()
      assert {:error, %Ecto.Changeset{}} = Chats.update_chat_room(chat_room, @invalid_attrs)
      assert chat_room == Chats.get_chat_room!(chat_room.id)
    end

    test "delete_chat_room/1 deletes the chat_room" do
      chat_room = chat_room_fixture()
      assert {:ok, %ChatRoom{}} = Chats.delete_chat_room(chat_room)
      assert_raise Ecto.NoResultsError, fn -> Chats.get_chat_room!(chat_room.id) end
    end

    test "change_chat_room/1 returns a chat_room changeset" do
      chat_room = chat_room_fixture()
      assert %Ecto.Changeset{} = Chats.change_chat_room(chat_room)
    end
  end
end
