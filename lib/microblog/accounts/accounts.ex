defmodule Microblog.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Microblog.Repo

  alias Microblog.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Microblog.Accounts.User_following

  @doc """
  Returns the list of user_followings.

  ## Examples

      iex> list_user_followings()
      [%User_following{}, ...]

  """
  def list_user_followings do
    Repo.all(User_following)
  end

  @doc """
  Gets a single user_following.

  Raises `Ecto.NoResultsError` if the User following does not exist.

  ## Examples

      iex> get_user_following!(123)
      %User_following{}

      iex> get_user_following!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_following!(id), do: Repo.get!(User_following, id)

  @doc """
  Creates a user_following.

  ## Examples

      iex> create_user_following(%{field: value})
      {:ok, %User_following{}}

      iex> create_user_following(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_following(attrs \\ %{}) do
    %User_following{}
    |> User_following.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_following.

  ## Examples

      iex> update_user_following(user_following, %{field: new_value})
      {:ok, %User_following{}}

      iex> update_user_following(user_following, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_following(%User_following{} = user_following, attrs) do
    user_following
    |> User_following.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User_following.

  ## Examples

      iex> delete_user_following(user_following)
      {:ok, %User_following{}}

      iex> delete_user_following(user_following)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_following(%User_following{} = user_following) do
    Repo.delete(user_following)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_following changes.

  ## Examples

      iex> change_user_following(user_following)
      %Ecto.Changeset{source: %User_following{}}

  """
  def change_user_following(%User_following{} = user_following) do
    User_following.changeset(user_following, %{})
  end
end
