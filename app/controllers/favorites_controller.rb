class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, except: :index

  def index
    @favorites = policy_scope(Favorite.all)
    @user = User.find(params[:user_id])
  end

  def create
    @favorite = Favorite.new(user: current_user, article: @article)
    if @favorite.save
    respond_to do |format|
        format.html { redirect_to articles_path(@article) }
        format.js
      end
    else
        format.html { render 'articles/show' }
        format.js
      end
    end
    authorize @favorite

  end

  def destroy
    @favorite = Favorite.where(user: current_user, article: @article).first
    authorize @favorite
    @favorite.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end
end

