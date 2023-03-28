class FavoritesController < ApplicationController
  def create
    anime = Anime.find(params[:anime_id])
    favorite = current_customer.favorites.new(anime_id: anime.id)
    favorite.save
    redirect_to anime_path(anime)
  end  

  def destroy
    anime = Anime.find(params[:anime_id])
    favorite = current_customer.favorites.find_by(anime_id: anime.id)
    favorite.destroy
    redirect_to anime_path(anime)
  end
end

