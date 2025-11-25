defmodule OrcaBackend.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:content, :text)
      add(:read_at, :utc_datetime)
      add(:sender_id, references(:users, type: :binary_id, on_delete: :nothing))
      add(:chat_room_id, references(:chat_rooms, type: :binary_id, on_delete: :nothing))

      timestamps(type: :utc_datetime)
    end

    create(index(:messages, [:sender_id]))
    create(index(:messages, [:chat_room_id]))
  end
end
