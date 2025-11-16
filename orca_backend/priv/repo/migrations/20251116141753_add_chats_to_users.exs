defmodule OrcaBackend.Repo.Migrations.AddChatsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      # Optional: Display name for chats (if you don't already have one)
      add(:display_name, :string)

      # Optional: Avatar URL (if you don't already have one)
      add(:avatar_url, :string)

      # Optional: Online status tracking
      add(:last_seen_at, :utc_datetime)
      add(:is_online, :boolean, default: false)

      # Optional: Notification preferences
      add(:notification_settings, :map, default: %{})
    end

    # Add indexes for fields you'll query frequently
    create_if_not_exists(index(:users, [:is_online]))
    create_if_not_exists(index(:users, [:last_seen_at]))
  end
end
