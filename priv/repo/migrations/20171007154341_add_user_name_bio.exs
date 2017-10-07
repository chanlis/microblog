defmodule Microblog.Repo.Migrations.AddUserNameBio do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :name, :string
      add :bio, :string
    end
  end
end
