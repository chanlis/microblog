defmodule Microblog.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :message_id, references(:message, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:likes, [:user_id])
    create index(:likes, [:message_id])
  end
end
