defmodule Microblog.UserTest do
  use Microblog.DataCase

  alias Microblog.User

  describe "message" do
    alias Microblog.User.Message

    @valid_attrs %{msg: "some msg", name: "some name"}
    @update_attrs %{msg: "some updated msg", name: "some updated name"}
    @invalid_attrs %{msg: nil, name: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_message()

      message
    end

    test "list_message/0 returns all message" do
      message = message_fixture()
      assert User.list_message() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert User.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = User.create_message(@valid_attrs)
      assert message.msg == "some msg"
      assert message.name == "some name"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = User.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.msg == "some updated msg"
      assert message.name == "some updated name"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_message(message, @invalid_attrs)
      assert message == User.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = User.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> User.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = User.change_message(message)
    end
  end

  describe "follows" do
    alias Microblog.User.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_follow()

      follow
    end

    test "list_follows/0 returns all follows" do
      follow = follow_fixture()
      assert User.list_follows() == [follow]
    end

    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert User.get_follow!(follow.id) == follow
    end

    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = User.create_follow(@valid_attrs)
    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_follow(@invalid_attrs)
    end

    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, follow} = User.update_follow(follow, @update_attrs)
      assert %Follow{} = follow
    end

    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_follow(follow, @invalid_attrs)
      assert follow == User.get_follow!(follow.id)
    end

    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = User.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> User.get_follow!(follow.id) end
    end

    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = User.change_follow(follow)
    end
  end
end
