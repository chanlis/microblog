defmodule Microblog.Feedback.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Feedback.Like


  schema "likes" do
    belongs_to :user, Microblog.Accounts.User
    belongs_to :message, Microblog.User.Message

    timestamps()
  end

  @doc false
  def changeset(%Like{} = like, attrs) do
    like
    |> cast(attrs, [:user_id, :message_id])
    |> validate_required([:user_id, :message_id])
  end
end
