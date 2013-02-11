# encoding: utf-8
class GenresController < ApplicationController

  def show
    @movies = Movie.where(genre_ids: params[:id])
    @genre  = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      # flash[:notice] = "Жанрот е успешно внесен!".force_encoding("UTF-8")
      flash[:notice] = "Success!"
      redirect_to root_path
    else
      # flash[:error].now  = "Настана грешка!"
      flash[:error].now  = "Error!"
      render 'new'
    end
  end


end
