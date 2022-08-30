class BookCommentsController < ApplicationController
  before_action :ensure_correct_user,only: [:edit,:destroy]


  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
  end

  def edit
    @comment.save
    redirect_to book_path(@comment.book), notice: "You　have updated this comment successfully."
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def ensure_correct_user
    @user = current_user
    @comment = Comment.find(params[:id])
    unless @user == @comment.user
      redirect_to book_path(@comment.book), notice: "You can't do this action!"
    end
  end

end
