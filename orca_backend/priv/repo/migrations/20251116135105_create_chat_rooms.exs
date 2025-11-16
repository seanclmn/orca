defmodule OrcaBackend.Repo.Migrations.CreateChatRooms do
  use Ecto.Migration

  def change do
    create table(:chat_rooms) do
      add :name, :string
      add :type, :string
      add :avatar_url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
