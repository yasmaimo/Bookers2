class PostBooksController < ApplicationController
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
     users_show_path
  end

  def after_sign_out_path_for(resource)
     top_path
  end

  def new
    @post = PostBook.new
    @post_books = PostBook.all
  end

  def create
    @post_book = PostBook.new(post_book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to post_books_path
  end

  def index
    @post_books = PostBook.all

    @post = PostBook.new
  end

  def show
    @post = PostBook.new
    @post_book = PostBook.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


  def post_book_params
    params.require(:post_book).permit(:title, :body, :user_id)
  end
end
