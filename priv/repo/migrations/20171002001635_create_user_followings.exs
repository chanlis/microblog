defmodule Microblog.Repo.Migrations.CreateUserFollowings do
  use Ecto.Migration

  def change do
    create table(:user_followings) do
      add :count, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :follower_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_followings, [:user_id])
    create index(:user_followings, [:follower_id])
  end
end
