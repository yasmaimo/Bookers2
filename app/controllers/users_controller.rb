class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
  	@users = User.page(params[:page]).reverse_order
    @post = PostBook.new
  end

  def show
    if User.exists?(params[:id])
     	@user = User.find(params[:id])
    	@post_book = @user.post_books.page(params[:page])
    	@post = PostBook.new
    else
      redirect_to user_path(current_user.id)
    end
  end

  def edit
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      if @user.id != current_user.id
        redirect_to edit_user_path(current_user.id)
      end
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
