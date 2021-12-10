defmodule Govern.PantriesTest do
  use Govern.DataCase

  alias Govern.Pantries

  describe "pantries" do
    alias Govern.Pantries.Pantry

    import Govern.PantriesFixtures

    @invalid_attrs %{address: nil, description: nil, name: nil, photo: nil}

    test "list_pantries/0 returns all pantries" do
      pantry = pantry_fixture()
      assert Pantries.list_pantries() == [pantry]
    end

    test "get_pantry!/1 returns the pantry with given id" do
      pantry = pantry_fixture()
      assert Pantries.get_pantry!(pantry.id) == pantry
    end

    test "create_pantry/1 with valid data creates a pantry" do
      valid_attrs = %{address: "some address", description: "some description", name: "some name", photo: "some photo"}

      assert {:ok, %Pantry{} = pantry} = Pantries.create_pantry(valid_attrs)
      assert pantry.address == "some address"
      assert pantry.description == "some description"
      assert pantry.name == "some name"
      assert pantry.photo == "some photo"
    end

    test "create_pantry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pantries.create_pantry(@invalid_attrs)
    end

    test "update_pantry/2 with valid data updates the pantry" do
      pantry = pantry_fixture()
      update_attrs = %{address: "some updated address", description: "some updated description", name: "some updated name", photo: "some updated photo"}

      assert {:ok, %Pantry{} = pantry} = Pantries.update_pantry(pantry, update_attrs)
      assert pantry.address == "some updated address"
      assert pantry.description == "some updated description"
      assert pantry.name == "some updated name"
      assert pantry.photo == "some updated photo"
    end

    test "update_pantry/2 with invalid data returns error changeset" do
      pantry = pantry_fixture()
      assert {:error, %Ecto.Changeset{}} = Pantries.update_pantry(pantry, @invalid_attrs)
      assert pantry == Pantries.get_pantry!(pantry.id)
    end

    test "delete_pantry/1 deletes the pantry" do
      pantry = pantry_fixture()
      assert {:ok, %Pantry{}} = Pantries.delete_pantry(pantry)
      assert_raise Ecto.NoResultsError, fn -> Pantries.get_pantry!(pantry.id) end
    end

    test "change_pantry/1 returns a pantry changeset" do
      pantry = pantry_fixture()
      assert %Ecto.Changeset{} = Pantries.change_pantry(pantry)
    end
  end
end
