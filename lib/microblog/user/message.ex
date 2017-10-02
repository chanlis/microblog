defmodule Microblog.User.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.User.Message


  schema "message" do
    field :msg, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:name, :msg])
    |> validate_required([:name, :msg])
  end
end
