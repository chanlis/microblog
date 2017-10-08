defmodule MicroblogWeb.FollowController do
  use MicroblogWeb, :controller

  alias Microblog.User
  alias Microblog.User.Follow

  def index(conn, _params) do
    follow_ids = Enum.map(User.list_user_followings(get_session(conn, :user_id)), fn(follow) -> follow.following_id end)
    messages = User.list_message_followings(follow_ids)
    
    render(conn, "index.html", messages: messages)
  end

  def new(conn, _params) do
    changeset = User.change_follow(%Follow{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_id" => user_id, "following_id" => following_id}) do
    case User.create_follow(%{"user_id" => user_id, "following_id" => following_id}) do
      {:ok, follow} ->
        conn
        |> redirect(to: user_path(conn, :show, following_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    follow = User.get_follow!(id)
    render(conn, "show.html", follow: follow)
  end

  def edit(conn, %{"id" => id}) do
    follow = User.get_follow!(id)
    changeset = User.change_follow(follow)
    render(conn, "edit.html", follow: follow, changeset: changeset)
  end

  def update(conn, %{"id" => id, "follow" => follow_params}) do
    follow = User.get_follow!(id)

    case User.update_follow(follow, follow_params) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "Follow updated successfully.")
        |> redirect(to: follow_path(conn, :show, follow))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", follow: follow, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    follow = User.get_follow!(id)
    user = follow.following_id
    {:ok, _follow} = User.delete_follow(follow)

    conn
    |> redirect(to: user_path(conn, :show, user))
  end
end
