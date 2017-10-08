defmodule Microblog.User.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.User.Follow


  schema "follows" do
    field :user_id, :id
    field :following_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:user_id, :following_id])
    |> validate_required([])
  end
end
