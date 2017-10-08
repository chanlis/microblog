defmodule Microblog.Repo.Migrations.RmUserFollowing do
  use Ecto.Migration

  def change do
    drop table("user_followings")
  end
end
