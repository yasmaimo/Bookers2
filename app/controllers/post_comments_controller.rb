class PostCommentsController < ApplicationController
  def create
  	post_book = PostBook.find(params[:post_book_id])
  	comment = current_user.post_comments.new(post_comment_params)
	  comment.post_book_id = post_book.id
	if post_book.errors.any?
    comment.save
	  redirect_to post_book_path(post_book)
	  flash[:created] = "コメントを投稿しました"
  else
    @post = PostBook.new
    @post_book = PostBook.find(params[:post_book_id])
    @post_comment = PostComment.new
    render 'post_books/show'
    flash[:created] = "50文字までのコメントを入力してください"
  end
  end

  def destroy
    #post_book = PostBook.find(params[:post_book_id])
    #comment = PostComment.find(params[:post_book_id])
    #comment.destroy
    redirect_to post_book_path(post_book)
    flash[:destroyed] = "コメントを削除しました"
  end

  private

  def post_comment_params
  	params.require(:post_comment).permit(:user_id, :post_book_id, :comment)
  end

end
