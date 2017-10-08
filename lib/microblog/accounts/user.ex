defmodule Microblog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Accounts.User


  schema "users" do
    field :email, :string
    field :is_admin?, :boolean
    field :name, :string
    field :bio, :string
    has_many :user, Microblog.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :is_admin?, :name, :bio])
    |> validate_required([:email])
  end
end
