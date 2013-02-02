# encoding: utf-8
class GenresController < ApplicationController

  def show
    @movies = Movie.find_by(genre_ids: params[:id])
    @genre  = Genre.find(params[:id])
  end

  def index
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      # flash[:notice] = "Жанрот е успешно внесен!".force_encoding("UTF-8")
      flash[:notice] = "Success!"
      redirect_to genre_path(@genre)
    else
      # flash[:error].now  = "Настана грешка!"
      flash[:error].now  = "Error!"
      render 'new'
    end
  end


end
