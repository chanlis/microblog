defmodule Microblog.Repo.Migrations.AddMessageUser do
  use Ecto.Migration

  def change do
    alter table("message") do
      add :user_id, references(:users), null: false
    end
  end
end
