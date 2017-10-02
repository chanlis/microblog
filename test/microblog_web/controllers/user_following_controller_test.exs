defmodule MicroblogWeb.User_followingControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Accounts

  @create_attrs %{count: 42}
  @update_attrs %{count: 43}
  @invalid_attrs %{count: nil}

  def fixture(:user_following) do
    {:ok, user_following} = Accounts.create_user_following(@create_attrs)
    user_following
  end

  describe "index" do
    test "lists all user_followings", %{conn: conn} do
      conn = get conn, user_following_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing User followings"
    end
  end

  describe "new user_following" do
    test "renders form", %{conn: conn} do
      conn = get conn, user_following_path(conn, :new)
      assert html_response(conn, 200) =~ "New User following"
    end
  end

  describe "create user_following" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, user_following_path(conn, :create), user_following: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == user_following_path(conn, :show, id)

      conn = get conn, user_following_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show User following"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_following_path(conn, :create), user_following: @invalid_attrs
      assert html_response(conn, 200) =~ "New User following"
    end
  end

  describe "edit user_following" do
    setup [:create_user_following]

    test "renders form for editing chosen user_following", %{conn: conn, user_following: user_following} do
      conn = get conn, user_following_path(conn, :edit, user_following)
      assert html_response(conn, 200) =~ "Edit User following"
    end
  end

  describe "update user_following" do
    setup [:create_user_following]

    test "redirects when data is valid", %{conn: conn, user_following: user_following} do
      conn = put conn, user_following_path(conn, :update, user_following), user_following: @update_attrs
      assert redirected_to(conn) == user_following_path(conn, :show, user_following)

      conn = get conn, user_following_path(conn, :show, user_following)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, user_following: user_following} do
      conn = put conn, user_following_path(conn, :update, user_following), user_following: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit User following"
    end
  end

  describe "delete user_following" do
    setup [:create_user_following]

    test "deletes chosen user_following", %{conn: conn, user_following: user_following} do
      conn = delete conn, user_following_path(conn, :delete, user_following)
      assert redirected_to(conn) == user_following_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, user_following_path(conn, :show, user_following)
      end
    end
  end

  defp create_user_following(_) do
    user_following = fixture(:user_following)
    {:ok, user_following: user_following}
  end
end
