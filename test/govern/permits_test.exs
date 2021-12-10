defmodule Govern.PermitsTest do
  use Govern.DataCase

  alias Govern.Permits

  describe "permits" do
    alias Govern.Permits.Permit

    import Govern.PermitsFixtures

    @invalid_attrs %{name: nil, photo: nil, status: nil, step: nil}

    test "list_permits/0 returns all permits" do
      permit = permit_fixture()
      assert Permits.list_permits() == [permit]
    end

    test "get_permit!/1 returns the permit with given id" do
      permit = permit_fixture()
      assert Permits.get_permit!(permit.id) == permit
    end

    test "create_permit/1 with valid data creates a permit" do
      valid_attrs = %{name: "some name", photo: "some photo", status: "some status", step: "some step"}

      assert {:ok, %Permit{} = permit} = Permits.create_permit(valid_attrs)
      assert permit.name == "some name"
      assert permit.photo == "some photo"
      assert permit.status == "some status"
      assert permit.step == "some step"
    end

    test "create_permit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Permits.create_permit(@invalid_attrs)
    end

    test "update_permit/2 with valid data updates the permit" do
      permit = permit_fixture()
      update_attrs = %{name: "some updated name", photo: "some updated photo", status: "some updated status", step: "some updated step"}

      assert {:ok, %Permit{} = permit} = Permits.update_permit(permit, update_attrs)
      assert permit.name == "some updated name"
      assert permit.photo == "some updated photo"
      assert permit.status == "some updated status"
      assert permit.step == "some updated step"
    end

    test "update_permit/2 with invalid data returns error changeset" do
      permit = permit_fixture()
      assert {:error, %Ecto.Changeset{}} = Permits.update_permit(permit, @invalid_attrs)
      assert permit == Permits.get_permit!(permit.id)
    end

    test "delete_permit/1 deletes the permit" do
      permit = permit_fixture()
      assert {:ok, %Permit{}} = Permits.delete_permit(permit)
      assert_raise Ecto.NoResultsError, fn -> Permits.get_permit!(permit.id) end
    end

    test "change_permit/1 returns a permit changeset" do
      permit = permit_fixture()
      assert %Ecto.Changeset{} = Permits.change_permit(permit)
    end
  end
end
