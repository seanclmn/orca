defmodule OrcaBackend.Repo.Migrations.CreateMemberships do
  use Ecto.Migration

  def change do
    create table(:memberships) do
      add(:role, :string)
      add(:last_read_at, :utc_datetime)
      add(:joined_at, :utc_datetime)
      add(:left_at, :utc_datetime)
      add(:user_id, references(:users, on_delete: :delete_all), null: false)
      add(:chat_room_id, references(:chat_rooms, on_delete: :delete_all), null: false)

      timestamps(type: :utc_datetime)
    end

    create(index(:memberships, [:user_id]))
    create(index(:memberships, [:chat_room_id]))
    create(unique_index(:memberships, [:user_id, :chat_room_id]))
  end
end
