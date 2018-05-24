class PostBooksController < ApplicationController
  before_action :authenticate_user!

  def edit
    if PostBook.exists?(params[:id])
      @post_book = PostBook.find(params[:id])
      if @post_book.user.id == current_user.id
        render 'edit'
      else
        redirect_to user_path(current_user.id)
      end
    else
      redirect_to user_path(current_user.id)
    end
  end

  def create
    @post_book = PostBook.new(post_book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to post_books_path
    flash[:created] = "感想を投稿しました"
  end

  def update
    post_book = PostBook.find(params[:id])
    post_book.update(post_book_params)
    redirect_to post_book_path(post_book)
    flash[:updated] = "変更を保存しました"
  end

  def destroy
    post_book = PostBook.find(params[:id])
    post_book.destroy
    redirect_to post_books_path
    flash[:destroyed] = "投稿を削除しました"
  end

  def index
    @post_books = PostBook.page(params[:page]).reverse_order
    @post = PostBook.new
  end

  def show
    if PostBook.exists?(params[:id])
      @post = PostBook.new
      @post_book = PostBook.find(params[:id])
      @post_comment = PostComment.new
    else
      redirect_to user_path(current_user.id)
    end
  end

  private

  def post_book_params
    params.require(:post_book).permit(:title, :body, :user_id)
  end

end
