# encoding: UTF-8
class TheatresController < ApplicationController

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
    else
      flash[:notice] = "Настана грешка, новата киносала не е внесена!"
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
      flash[:error] = "Настана грешка, промената не е успешна."
      render :edit
    end
  end

end
