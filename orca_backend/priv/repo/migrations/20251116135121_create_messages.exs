defmodule OrcaBackend.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :text
      add :read_at, :utc_datetime
      add :sender_id, references(:users, on_delete: :nothing)
      add :chat_room_id, references(:chat_rooms, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:messages, [:sender_id])
    create index(:messages, [:chat_room_id])
  end
end
