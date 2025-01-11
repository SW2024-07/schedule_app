class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # コメントの一覧表示
  def index
    @comments = Comment.all
  end

  # コメントの新規作成フォーム
  def new
    @comment = Comment.new
  end

  # コメントの作成
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path, notice: 'コメントが投稿されました。'
    else
      render :new
    end
  end

  # コメントの削除
  def destroy
    @comment.destroy
    redirect_to comments_path, notice: 'コメントが削除されました。'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
