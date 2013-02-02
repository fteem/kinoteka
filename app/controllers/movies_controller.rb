# encoding: utf-8
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
      flash[:notice] = "Филмот \"#{@movie.name}\" е внесен."
      redirect_to  movie_url(@movie)
    else
      flash[:error] = "Настана грешка, внесувањето е неуспешно."
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      flash[:notice] = "Филмот \"#{@movie.name}\" е променет."
      redirect_to  movie_url(@movie)
    else
      flash[:error] = "Настана грешка, промената не е успешна."
      render :edit
    end
  end

end
