defmodule Microblog.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :name, :string
      add :msg, :string

      timestamps()
    end

  end
end
