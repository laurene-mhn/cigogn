class FiltersController < ApplicationController
  def new
    @filter = Filter.new
    authorize @filter
  end

  def create

  end

end
