class ProjectionsController < ApplicationController

  def index
    @projections = Projection.all
  end

  def new

  end
end
