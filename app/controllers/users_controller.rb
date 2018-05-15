class UsersController < ApplicationController

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
     users_show_path
  end

  def after_sign_out_path_for(resource)
     top_path
  end

  def index
  	@users = User.all
    @post = PostBook.new
  end

  def show
   	@user = User.find(params[:id])
  	@post_books = @user.post_books.page(params[:page])
  	@post = PostBook.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def post_book_params
    params.require(:post_book).permit(:title, :body, :user_id)
  end

end
