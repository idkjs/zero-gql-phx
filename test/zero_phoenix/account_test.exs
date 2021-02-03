defmodule ZeroPhoenix.AccountTest do
  use ZeroPhoenix.DataCase

  alias ZeroPhoenix.Account

  describe "people" do
    alias ZeroPhoenix.Account.Person

    @valid_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name", username: "some username"}
    @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", username: "some updated username"}
    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, username: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_person()

      person
    end

    test "list_people/0 returns all people" do
      person = person_fixture()
      assert Account.list_people() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Account.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Account.create_person(@valid_attrs)
      assert person.email == "some email"
      assert person.first_name == "some first_name"
      assert person.last_name == "some last_name"
      assert person.username == "some username"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Account.update_person(person, @update_attrs)
      assert person.email == "some updated email"
      assert person.first_name == "some updated first_name"
      assert person.last_name == "some updated last_name"
      assert person.username == "some updated username"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_person(person, @invalid_attrs)
      assert person == Account.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Account.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Account.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Account.change_person(person)
    end
  end

  describe "friendships" do
    alias ZeroPhoenix.Account.Friendship

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def friendship_fixture(attrs \\ %{}) do
      {:ok, friendship} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_friendship()

      friendship
    end

    test "list_friendships/0 returns all friendships" do
      friendship = friendship_fixture()
      assert Account.list_friendships() == [friendship]
    end

    test "get_friendship!/1 returns the friendship with given id" do
      friendship = friendship_fixture()
      assert Account.get_friendship!(friendship.id) == friendship
    end

    test "create_friendship/1 with valid data creates a friendship" do
      assert {:ok, %Friendship{} = friendship} = Account.create_friendship(@valid_attrs)
    end

    test "create_friendship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_friendship(@invalid_attrs)
    end

    test "update_friendship/2 with valid data updates the friendship" do
      friendship = friendship_fixture()
      assert {:ok, %Friendship{} = friendship} = Account.update_friendship(friendship, @update_attrs)
    end

    test "update_friendship/2 with invalid data returns error changeset" do
      friendship = friendship_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_friendship(friendship, @invalid_attrs)
      assert friendship == Account.get_friendship!(friendship.id)
    end

    test "delete_friendship/1 deletes the friendship" do
      friendship = friendship_fixture()
      assert {:ok, %Friendship{}} = Account.delete_friendship(friendship)
      assert_raise Ecto.NoResultsError, fn -> Account.get_friendship!(friendship.id) end
    end

    test "change_friendship/1 returns a friendship changeset" do
      friendship = friendship_fixture()
      assert %Ecto.Changeset{} = Account.change_friendship(friendship)
    end
  end
end
