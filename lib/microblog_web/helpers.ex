defmodule MicroblogWeb.Helpers do
  def is_admin?(nil), do: false
  def is_admin?(user) do
    user.is_admin?
  end

  def get_user(id) do
    Microblog.Accounts.get_user!(id)
  end  

  def get_user_followings() do
    Microblog.User.list_follows
  end

  def nav_active?(conn, text) do
    if String.contains?(to_string(conn.request_path), text) do
      "active"
    else
      ""
    end
  end
end
