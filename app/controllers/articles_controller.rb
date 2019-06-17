# frozen_string_literal: true

class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    article.create(strong_params)
    redirect_to articles_path
  end

  def edit; end

  def update
    @article.update(strong_params)
    redirect_to article_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def strong_params
    params.require(:article).permit(:title, :content)
  end
end
