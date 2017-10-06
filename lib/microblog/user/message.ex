defmodule Microblog.User.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.User.Message


  schema "message" do
    field :msg, :string
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:name, :msg, :user_id])
    |> validate_required([:name, :msg])
  end
end
