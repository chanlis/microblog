defmodule Microblog.Repo.Migrations.MessageOwner do
  use Ecto.Migration

  def change do
    # Add user_id reference to messages table
    alter table("messages") do
      add :user_id, references(:users)
    end
  end
end
