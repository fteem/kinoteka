class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      flash[:notice] = "The movie \"#{@movie.name}\" has been created."
      redirect_to  movie_url(@movie)
    else
      flash[:error] = "An error occured, the movie wasn't saved."
      render 'new'
    end
  end

end
