defmodule MicroblogWeb.MessageController do
  use MicroblogWeb, :controller

  alias Microblog.User
  alias Microblog.User.Message

  def index(conn, _params) do
    message = User.list_messages()
    render(conn, "index.html", message: message)
  end

  def new(conn, _params) do
    changeset = User.change_message(%Message{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"message" => message_params}) do
    case User.create_message(message_params) do
      {:ok, message} ->
        MicroblogWeb.Endpoint.broadcast "updates:all", "new_msg",
           %{"message_name" => message.name,
             "message_date" => message.inserted_at,
             "message_user" => get_user(message.user_id).name,
             "user_show_path" => user_path(conn, :show, get_user(message.user_id)),
             "message_show_path" => message_path(conn, :show, message)}
        conn
        |> put_flash(:info, "Message created successfully.")
        |> redirect(to: message_path(conn, :show, message))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    message = User.get_message!(id)
    render(conn, "show.html", message: message)
  end

  def edit(conn, %{"id" => id}) do
    message = User.get_message!(id)
    changeset = User.change_message(message)
    render(conn, "edit.html", message: message, changeset: changeset)
  end

  def update(conn, %{"id" => id, "message" => message_params}) do
    message = User.get_message!(id)

    case User.update_message(message, message_params) do
      {:ok, message} ->
        conn
        |> put_flash(:info, "Message updated successfully.")
        |> redirect(to: message_path(conn, :show, message))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", message: message, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    message = User.get_message!(id)
    {:ok, _message} = User.delete_message(message)

    conn
    |> put_flash(:info, "Message deleted successfully.")
    |> redirect(to: message_path(conn, :index))
  end
end
