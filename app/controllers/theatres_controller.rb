# encoding: UTF-8
class TheatresController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]

  def index
    @theatres = Theatre.all
  end

  def new
    @theatre = Theatre.new
  end

  def create
    @theatre = Theatre.new(params[:theatre])
    if @theatre.save
      flash[:notice] = "Новата киносала е внесена!"
      redirect_to root_path
    else
      flash[:error] = "Неуспешнo внесување. Обидете се повторно!"
      render :new
    end
  end

  def edit
    @theatre = Theatre.find(params[:theatre])
  end

  def update
    @theatre = Theatre.find(params[:theatre])
    if @theatre.update_attributes(params[:theatre])
      flash[:notice] = "Податоците се променети"
      redirect_to theatre_url(@theatre)
    else
      flash[:error] = "Неуспешна промена. Обидете се повторно!"
      render :edit
    end
  end

  def destroy
    Theatre.find(params[:theatre]).destroy
  end

end
