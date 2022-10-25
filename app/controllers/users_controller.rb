class UsersController < ApplicationController
  def new
     @user = User.new
  end

  def index
  end

  def show
   @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    user_id = params[:id].to_i
  login_user_id = current_user.id
  if(user_id != login_user_id)
    redirect_to books_path
     @user = User.find(params[:id])
  end
  end

  def create
    @user = Users.new(user_params)
    if @luser.save
      redirect_to user_path(@user.id)
       flash[:notice] = "投稿が成功しました"
    redirect_to user_path(user.id)
    else
      render :new
    end
  end

 def destroy
   user = User.find(params[:id])
    user.destroy
    redirect_to '/users'
  end

  def update
    @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
    user_id = params[:id].to_i
  login_user_id = current_user.id
  if(user_id != login_user_id)
    redirect_to books_path

  end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
      user_id = params[:id].to_i
      login_user_id = current_user.id
      if(user_id != login_user_id)
        redirect_to books_path
      end
  end
end