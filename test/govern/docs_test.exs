defmodule Govern.DocsTest do
  use Govern.DataCase

  alias Govern.Docs

  describe "documents" do
    alias Govern.Docs.Document

    import Govern.DocsFixtures

    @invalid_attrs %{description: nil, link: nil, name: nil, views: nil}

    test "list_documents/0 returns all documents" do
      document = document_fixture()
      assert Docs.list_documents() == [document]
    end

    test "get_document!/1 returns the document with given id" do
      document = document_fixture()
      assert Docs.get_document!(document.id) == document
    end

    test "create_document/1 with valid data creates a document" do
      valid_attrs = %{description: "some description", link: "some link", name: "some name", views: 42}

      assert {:ok, %Document{} = document} = Docs.create_document(valid_attrs)
      assert document.description == "some description"
      assert document.link == "some link"
      assert document.name == "some name"
      assert document.views == 42
    end

    test "create_document/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Docs.create_document(@invalid_attrs)
    end

    test "update_document/2 with valid data updates the document" do
      document = document_fixture()
      update_attrs = %{description: "some updated description", link: "some updated link", name: "some updated name", views: 43}

      assert {:ok, %Document{} = document} = Docs.update_document(document, update_attrs)
      assert document.description == "some updated description"
      assert document.link == "some updated link"
      assert document.name == "some updated name"
      assert document.views == 43
    end

    test "update_document/2 with invalid data returns error changeset" do
      document = document_fixture()
      assert {:error, %Ecto.Changeset{}} = Docs.update_document(document, @invalid_attrs)
      assert document == Docs.get_document!(document.id)
    end

    test "delete_document/1 deletes the document" do
      document = document_fixture()
      assert {:ok, %Document{}} = Docs.delete_document(document)
      assert_raise Ecto.NoResultsError, fn -> Docs.get_document!(document.id) end
    end

    test "change_document/1 returns a document changeset" do
      document = document_fixture()
      assert %Ecto.Changeset{} = Docs.change_document(document)
    end
  end
end
