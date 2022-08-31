class FavoritesController < ApplicationController
 def create
  @book = Book.find_by(params[:book_id])
  @favorite = Favorite.new(user_id: current_user.id, book_id: @book.id)
  @favorite.save
  @books = Book.all
  render 'replace_btn'
 end

 def destroy
  @book = Book.find_by(params[:book_id])
  @favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
  @favorite.destroy
  @books = Book.all
  render 'replace_btn'
 end
end
