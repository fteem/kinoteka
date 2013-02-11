# encoding: utf-8
class MoviesController < ApplicationController
  # before_filter :authenticate_admin!, except: [:index, :show]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def create
    @movie = Movie.new(params[:movie])
    genres_list = params[:movie][:genre_ids]
    if @movie.save
      genres_list.each do |g|
        @movie.genres << Genre.where(_id: g.downcase)
      end
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
    @genre = Genre.where(id: params[:movie][:genre_ids])
    if @movie.update_attributes(params[:movie])
      @movie.genres << @genre
      flash[:notice] = "Филмот \"#{@movie.name}\" е променет."
      redirect_to movie_url(@movie)
    else
      flash[:error] = "Настана грешка, промената не е успешна."
      render :edit
    end
  end

end
