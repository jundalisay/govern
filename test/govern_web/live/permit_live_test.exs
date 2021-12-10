defmodule GovernWeb.PermitLiveTest do
  use GovernWeb.ConnCase

  import Phoenix.LiveViewTest
  import Govern.PermitsFixtures

  @create_attrs %{name: "some name", photo: "some photo", status: "some status", step: "some step"}
  @update_attrs %{name: "some updated name", photo: "some updated photo", status: "some updated status", step: "some updated step"}
  @invalid_attrs %{name: nil, photo: nil, status: nil, step: nil}

  defp create_permit(_) do
    permit = permit_fixture()
    %{permit: permit}
  end

  describe "Index" do
    setup [:create_permit]

    test "lists all permits", %{conn: conn, permit: permit} do
      {:ok, _index_live, html} = live(conn, Routes.permit_index_path(conn, :index))

      assert html =~ "Listing Permits"
      assert html =~ permit.name
    end

    test "saves new permit", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.permit_index_path(conn, :index))

      assert index_live |> element("a", "New Permit") |> render_click() =~
               "New Permit"

      assert_patch(index_live, Routes.permit_index_path(conn, :new))

      assert index_live
             |> form("#permit-form", permit: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#permit-form", permit: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.permit_index_path(conn, :index))

      assert html =~ "Permit created successfully"
      assert html =~ "some name"
    end

    test "updates permit in listing", %{conn: conn, permit: permit} do
      {:ok, index_live, _html} = live(conn, Routes.permit_index_path(conn, :index))

      assert index_live |> element("#permit-#{permit.id} a", "Edit") |> render_click() =~
               "Edit Permit"

      assert_patch(index_live, Routes.permit_index_path(conn, :edit, permit))

      assert index_live
             |> form("#permit-form", permit: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#permit-form", permit: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.permit_index_path(conn, :index))

      assert html =~ "Permit updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes permit in listing", %{conn: conn, permit: permit} do
      {:ok, index_live, _html} = live(conn, Routes.permit_index_path(conn, :index))

      assert index_live |> element("#permit-#{permit.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#permit-#{permit.id}")
    end
  end

  describe "Show" do
    setup [:create_permit]

    test "displays permit", %{conn: conn, permit: permit} do
      {:ok, _show_live, html} = live(conn, Routes.permit_show_path(conn, :show, permit))

      assert html =~ "Show Permit"
      assert html =~ permit.name
    end

    test "updates permit within modal", %{conn: conn, permit: permit} do
      {:ok, show_live, _html} = live(conn, Routes.permit_show_path(conn, :show, permit))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Permit"

      assert_patch(show_live, Routes.permit_show_path(conn, :edit, permit))

      assert show_live
             |> form("#permit-form", permit: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#permit-form", permit: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.permit_show_path(conn, :show, permit))

      assert html =~ "Permit updated successfully"
      assert html =~ "some updated name"
    end
  end
end
