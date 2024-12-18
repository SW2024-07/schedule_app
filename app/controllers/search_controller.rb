# app/controllers/search_controller.rb
class SearchController < ApplicationController
  def search
    @query = params[:query]  # 検索キーワード
    if @query.present?
      @results = Post.where("title LIKE ?", "%#{@query}%")  # Postモデルを検索
    else
      @results = []
    end
  end
end
