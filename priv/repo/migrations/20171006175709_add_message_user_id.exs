defmodule Microblog.Repo.Migrations.AddMessageUserId do
  use Ecto.Migration

  def change do
    alter table("message") do
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
