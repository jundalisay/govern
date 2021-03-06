defmodule Govern.FeedTest do
  use Govern.DataCase

  alias Govern.Feed

  describe "posts" do
    alias Govern.Feed.Post

    import Govern.FeedFixtures

    @invalid_attrs %{content: nil, name: nil, photo: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Feed.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Feed.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{content: "some content", name: "some name", photo: "some photo"}

      assert {:ok, %Post{} = post} = Feed.create_post(valid_attrs)
      assert post.content == "some content"
      assert post.name == "some name"
      assert post.photo == "some photo"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feed.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{content: "some updated content", name: "some updated name", photo: "some updated photo"}

      assert {:ok, %Post{} = post} = Feed.update_post(post, update_attrs)
      assert post.content == "some updated content"
      assert post.name == "some updated name"
      assert post.photo == "some updated photo"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Feed.update_post(post, @invalid_attrs)
      assert post == Feed.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Feed.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Feed.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Feed.change_post(post)
    end
  end
end
