defmodule GovernWeb.PantryControllerTest do
  use GovernWeb.ConnCase

  import Govern.PantriesFixtures

  @create_attrs %{address: "some address", description: "some description", name: "some name", photo: "some photo"}
  @update_attrs %{address: "some updated address", description: "some updated description", name: "some updated name", photo: "some updated photo"}
  @invalid_attrs %{address: nil, description: nil, name: nil, photo: nil}

  describe "index" do
    test "lists all pantries", %{conn: conn} do
      conn = get(conn, Routes.pantry_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pantries"
    end
  end

  describe "new pantry" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pantry_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pantry"
    end
  end

  describe "create pantry" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pantry_path(conn, :create), pantry: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pantry_path(conn, :show, id)

      conn = get(conn, Routes.pantry_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pantry"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pantry_path(conn, :create), pantry: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pantry"
    end
  end

  describe "edit pantry" do
    setup [:create_pantry]

    test "renders form for editing chosen pantry", %{conn: conn, pantry: pantry} do
      conn = get(conn, Routes.pantry_path(conn, :edit, pantry))
      assert html_response(conn, 200) =~ "Edit Pantry"
    end
  end

  describe "update pantry" do
    setup [:create_pantry]

    test "redirects when data is valid", %{conn: conn, pantry: pantry} do
      conn = put(conn, Routes.pantry_path(conn, :update, pantry), pantry: @update_attrs)
      assert redirected_to(conn) == Routes.pantry_path(conn, :show, pantry)

      conn = get(conn, Routes.pantry_path(conn, :show, pantry))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, pantry: pantry} do
      conn = put(conn, Routes.pantry_path(conn, :update, pantry), pantry: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pantry"
    end
  end

  describe "delete pantry" do
    setup [:create_pantry]

    test "deletes chosen pantry", %{conn: conn, pantry: pantry} do
      conn = delete(conn, Routes.pantry_path(conn, :delete, pantry))
      assert redirected_to(conn) == Routes.pantry_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.pantry_path(conn, :show, pantry))
      end
    end
  end

  defp create_pantry(_) do
    pantry = pantry_fixture()
    %{pantry: pantry}
  end
end
