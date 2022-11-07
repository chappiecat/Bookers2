class BooksController < ApplicationController

 before_action :correct_user, only: [:edit, :update]

  def index
     @books = Book.all
     @user = current_user
     @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @booknew = Book.new
     @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
      #return
    end

  end

  def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "投稿が成功しましたsuccessfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @user = current_user
    @book.destroy
    redirect_to books_path
  end

  def update
   @book = Book.find(params[:id])
  if @book.update(book_params)
     flash[:notice] = "投稿が成功しましたsuccessfully"
  redirect_to book_path(@book.id)
  else
      render :edit
  end
  end




 private

  def book_params
    params.require(:book).permit(:title, :body)
  end

   def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
   end


end
