# encoding: utf-8
class HomeController < ApplicationController

  def index
    @movies = Movie.all
  end

end
