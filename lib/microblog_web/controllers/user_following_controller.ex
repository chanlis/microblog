defmodule MicroblogWeb.User_followingController do
  use MicroblogWeb, :controller

  alias Microblog.Accounts
  alias Microblog.Accounts.User_following

  def index(conn, _params) do
    user_followings = Accounts.list_user_followings()
    render(conn, "index.html", user_followings: user_followings)
  end

  def new(conn, _params) do
    changeset = Accounts.change_user_following(%User_following{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_following" => user_following_params}) do
    case Accounts.create_user_following(user_following_params) do
      {:ok, user_following} ->
        conn
        |> put_flash(:info, "User following created successfully.")
        |> redirect(to: user_following_path(conn, :show, user_following))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_following = Accounts.get_user_following!(id)
    render(conn, "show.html", user_following: user_following)
  end

  def edit(conn, %{"id" => id}) do
    user_following = Accounts.get_user_following!(id)
    changeset = Accounts.change_user_following(user_following)
    render(conn, "edit.html", user_following: user_following, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_following" => user_following_params}) do
    user_following = Accounts.get_user_following!(id)

    case Accounts.update_user_following(user_following, user_following_params) do
      {:ok, user_following} ->
        conn
        |> put_flash(:info, "User following updated successfully.")
        |> redirect(to: user_following_path(conn, :show, user_following))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user_following: user_following, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_following = Accounts.get_user_following!(id)
    {:ok, _user_following} = Accounts.delete_user_following(user_following)

    conn
    |> put_flash(:info, "User following deleted successfully.")
    |> redirect(to: user_following_path(conn, :index))
  end
end
