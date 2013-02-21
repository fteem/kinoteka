# encoding: UTF-8
class ProjectionsController < ApplicationController

  def index
    @projections = Projection.all
  end

  def show
    @projection = Projection.find(params[:id])
  end

  def new
    @projection = Projection.new
  end

  def create
    @projection = Projection.new(params[:projection])
    @movie = Movie.find(params[:projection][:movie_id])
    @theatre = Theatre.find(params[:projection][:theatre_id])
    if @projection.save
      @movie.projections << @projection
      @theatre.projections << @projection
      flash[:notice] = "Проекцијата е зачувана"
      redirect_to projection_url(@projection)
    else
      flash[:error] = "Проекцијата не е зачувана, обидете се повторно!"
      raise @projection.errors.full_messages.to_yaml
      render :new
    end
  end

  def edit
    @projection = Projection.find(params[:id])
  end

  def update
    @projection = Projection.find(params[:id])
    if @projection.update_attributes(params[:projection])
      flash[:notice] = "Проекцијата е успешно променета!"
      redirect_to projections_url
    else
      flash[:notice] = "Проекцијата е успешно променета!"
      render :edit
    end
  end

end
