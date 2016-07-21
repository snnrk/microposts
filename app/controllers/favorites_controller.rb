class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        @micropost = Micropost.find(params[:micropost_id])
        current_user.favorite(@micropost)
    end
    
    def destroy
        @micropost = current_user.favorite_relationships.find(params[:id]).micropost
        current_user.unfavorite(@micropost)
    end
    
    def show
        @user = User.find(params[:id])
        @micropost = @user.microposts.build
        @feed_items = @user.favorite_microposts.order(created_at: :desc)
        @title = t('dictionary.words.favorites')
        render 'static_pages/home'
    end
end
