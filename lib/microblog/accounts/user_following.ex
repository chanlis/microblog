defmodule Microblog.Accounts.User_following do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Accounts.User_following


  schema "user_followings" do
    field :count, :integer
    field :user_id, :id
    field :follower_id, :id

    timestamps()
  end

  @doc false
  def changeset(%User_following{} = user_following, attrs) do
    user_following
    |> cast(attrs, [:count])
    |> validate_required([:count])
  end
end
