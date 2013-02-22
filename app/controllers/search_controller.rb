class SearchController < ApplicationController

  def index
  end

  def lookup
    keyword = params[:keyword]
    @movies = Movie.where(name: keyword)
  end
end
