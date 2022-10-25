class BooksController < ApplicationController
  def new
    @books = Book.all
  end

  def index
     @books = Book.all
     @user = current_user
     @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @booknew = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save!
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @user = current_user
    @book.destroy
    redirect_to books_path

  end

 private

  def book_params
    params.require(:book).permit(:title, :opinion )
  end

end
