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

end
