defmodule TestAdmin.UsersContextTest do
  use TestAdmin.DataCase

  alias TestAdmin.UsersContext

  describe "users" do
    alias TestAdmin.UsersContext.User

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UsersContext.create_user()

      user
    end

    test "paginate_users/1 returns paginated list of users" do
      for _ <- 1..20 do
        user_fixture()
      end

      {:ok, %{users: users} = page} = UsersContext.paginate_users(%{})

      assert length(users) == 15
      assert page.page_number == 1
      assert page.page_size == 15
      assert page.total_pages == 2
      assert page.total_entries == 20
      assert page.distance == 5
      assert page.sort_field == "inserted_at"
      assert page.sort_direction == "desc"
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert UsersContext.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert UsersContext.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = UsersContext.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UsersContext.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = UsersContext.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = UsersContext.update_user(user, @invalid_attrs)
      assert user == UsersContext.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = UsersContext.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> UsersContext.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = UsersContext.change_user(user)
    end
  end
end
