class CommentsController < ApplicationController

  def create
    # 以下のルーティングをチェックするにはrails routesコマンドをターミナルにうつ
    # /posts/111/comments/
    # 111 => params[:post_id]

    # /posts/111/comments/99
    # 99 => params[:id]
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(user_id: current_user.id)
    # => @post.comments.build => @comment = { post_id: 111, user_id: nil, content: nil}
    if @comment.save
      redirect_to @post, notice: '保存されました'
    else
      render :new # 投稿画面に差し戻す
    end
  end

  def create
    @comments = Comment.where(post_id: params[:post_id]).page(params[:page])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(
      content: params[ :content],
      user_id: @current_user.id,
      post_id: params[ :post_id])
      @comment.save
  end

  def destroy
    @comemnt = Comment.find(params[:id])
    @comment = current_user.comments.find(params[:id])
    # 削除できなかったときに例外を返す
    @comment.destroy!
  end

  def destroy
    @comment = Comment.find_by(id: params[:comment_id])
    @comments = Comment.where(post_id: @comment.post_id ).page(params[:page])
    @comment.destroy
  end

  def user_come_destroy
    @comment = Comment.find_by(id: params[:comment_id])
    @comments = Comment.where(user_id: @comment.user_id ).page(params[:page])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
