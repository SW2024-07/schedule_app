class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @blog = Blog.new
  end
  
  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: 'ブログが作成されました'
    else
      render :new
    end
  end


  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:success] = "ブログを削除しました。"
      redirect_to blogs_path
    else
      Rails.logger.error "ブログの削除に失敗しました: #{@blog.errors.full_messages.join(', ')}"
      redirect_to blogs_path, alert: 'ブログの削除に失敗しました'
    end
  end


  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集しました"
    else
      render :edit
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :start_time)
  end
end