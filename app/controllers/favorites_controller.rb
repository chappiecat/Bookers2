class FavoritesController < ApplicationController

  def create
   book_image = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book_image.id)
    favorite.save
    redirect_to book_path(book_image)
  end


  def destroy
    book_image = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book_image.id)
    favorite.destroy
    redirect_to book_path(book_image)
  end


end
