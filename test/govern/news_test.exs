defmodule Govern.NewsTest do
  use Govern.DataCase

  alias Govern.News

  describe "articles" do
    alias Govern.News.Article

    import Govern.NewsFixtures

    @invalid_attrs %{category: nil, content: nil, intro: nil, name: nil, photto: nil, subname: nil}

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert News.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert News.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      valid_attrs = %{category: "some category", content: "some content", intro: "some intro", name: "some name", photto: "some photto", subname: "some subname"}

      assert {:ok, %Article{} = article} = News.create_article(valid_attrs)
      assert article.category == "some category"
      assert article.content == "some content"
      assert article.intro == "some intro"
      assert article.name == "some name"
      assert article.photto == "some photto"
      assert article.subname == "some subname"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = News.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      update_attrs = %{category: "some updated category", content: "some updated content", intro: "some updated intro", name: "some updated name", photto: "some updated photto", subname: "some updated subname"}

      assert {:ok, %Article{} = article} = News.update_article(article, update_attrs)
      assert article.category == "some updated category"
      assert article.content == "some updated content"
      assert article.intro == "some updated intro"
      assert article.name == "some updated name"
      assert article.photto == "some updated photto"
      assert article.subname == "some updated subname"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = News.update_article(article, @invalid_attrs)
      assert article == News.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = News.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> News.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = News.change_article(article)
    end
  end
end
