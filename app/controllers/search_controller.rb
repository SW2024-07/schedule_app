class SearchController < ApplicationController
  def index
    if params[:query].present?
      @user_result =User.where("username LIKE ?", "%#{params[:query]}%")
      @user_Calendar =UserCalendar.where("title LIKE ?", "%#{params[:query]}%")
      @comment_result =Comment.where("content LIKE ?", "%#{params[:query]}%")
     @results = (@user_result || [] + @user_Calendar || [] + @comment_result || []).uniq
    else
      @results = []
    end
  end
end
