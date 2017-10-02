defmodule Microblog.Repo.Migrations.RemoveMessageUser do
  use Ecto.Migration

  def change do
    alter table("message") do
      remove :user_id
    end
  end
end
