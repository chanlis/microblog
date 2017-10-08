defmodule Microblog.Repo.Migrations.CreateFollows do
  use Ecto.Migration

  def change do
    create table(:follows) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :following_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:follows, [:user_id])
    create index(:follows, [:following_id])
  end
end
